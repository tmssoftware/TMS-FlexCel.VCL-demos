unit USigningPdfs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs,
  StdCtrls,
  pngimage, ExtCtrls, ExtDlgs,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render, FlexCel.Pdf;


type
  {$SCOPEDENUMS ON}
  /// <summary>
  /// The entries of the "Signature type" combo box, in the same order as they are added in the form.
  /// </summary>
  TSignatureType = (
    /// <summary>
    /// "/adbe.pkcs7.detached": the original Adobe format. It is the most compatible, but it is not a CAdES
    /// signature, so it doesn't conform to the PAdES standard the European Union requires.
    /// </summary>
    Pkcs7,

    /// <summary>
    /// "/ETSI.CAdES.detached" without a timestamp: PAdES baseline level B-B.
    /// </summary>
    PAdES_B_B,

    /// <summary>
    /// PAdES baseline level B-T: a B-B signature plus a timestamp from a Time Stamping Authority, which proves
    /// the document was signed before a given date instead of trusting the clock of whoever signed.
    /// </summary>
    PAdES_B_T);
  {$SCOPEDENUMS OFF}

  TFSigningPdfs = class(TForm)
    btnCreateAndSignPdf: TButton;
    lblSignatureType: TLabel;
    cbSignatureType: TComboBox;
    cbCertify: TCheckBox;
    cbVisibleSignature: TCheckBox;
    SignaturePicture: TImage;
    OpenPictureDialog: TOpenPictureDialog;
    OpenExcelDialog: TOpenDialog;
    SavePdfDialog: TSaveDialog;
    procedure cbVisibleSignatureClick(Sender: TObject);
    procedure SignaturePictureClick(Sender: TObject);
    procedure btnCreateAndSignPdfClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    DataPath: string;
    ImgData: ByteArray;
    procedure LoadImage(const FileName: string);
    function CreateSignerFactory(const Signer: TCmsSigner): TPdfSignerFactory;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSigningPdfs: TFSigningPdfs;

implementation
uses IOUtils, UFlexCelHDPI, ShellAPI, IdHTTP;

{$R *.dfm}

const
  //The Time Stamping Authority we ask for the timestamps. Replace it with the one you use: the public ones are
  //rate-limited, and a timestamp is only as trustworthy as the TSA that created it.
  TsaUrl = 'http://timestamp.digicert.com';

/// <summary>
/// <b>FlexCel never connects to the internet by itself.</b> It creates the RFC 3161 request and reads the answer,
/// but the connection to the TSA is this function, which you write. That way you know that no part of FlexCel can
/// reach the network unless you let it.
/// </summary>
/// <remarks>
/// We use Indy here because it is available in every Delphi version this demo compiles in. From XE8
/// (CompilerVersion 29) on you can use THTTPClient from the RTL instead: there is a version of this same function
/// written with it right below.
/// <br /><b>About https:</b> the url above is plain http, which is what most TSAs publish, and it is safe because
/// the answer is signed by the TSA and FlexCel verifies it. If the TSA you use is https, THTTPClient talks to it
/// with nothing extra to deploy, as on Windows it goes through the system http stack. TIdHTTP instead needs the
/// OpenSSL dlls beside the exe, and an ssl handler:
/// <code>
/// uses IdSSLOpenSSL;
/// ...
/// SslHandler := TIdSSLIOHandlerSocketOpenSSL.Create(Http);
/// SslHandler.SSLOptions.SSLVersions := [sslvTLSv1_2]; //older Indy defaults to versions no server accepts today
/// Http.IOHandler := SslHandler;
/// </code>
/// </remarks>
function GetTimestamp(timeStampRequest: ByteArray): ByteArray;
var
  Http: TIdHTTP;
  Request, Response: TMemoryStream;
begin
  Http := TIdHTTP.Create(nil);
  try
    Http.Request.ContentType := 'application/timestamp-query';
    Request := TMemoryStream.Create;
    try
      Response := TMemoryStream.Create;
      try
        Request.WriteBuffer(timeStampRequest[0], Length(timeStampRequest));
        Request.Position := 0;

        //This demo signs when you click a button, so we just wait for the answer here. In a server you would
        //normally make the whole export async instead of blocking a thread on the TSA.
        Http.Post(TsaUrl, Request, Response);

        Result := nil;
        SetLength(Result, Response.Size);
        Response.Position := 0;
        if Length(Result) > 0 then Response.ReadBuffer(Result[0], Length(Result));
      finally
        Response.Free;
      end;
    finally
      Request.Free;
    end;
  finally
    Http.Free;
  end;
end;

(*
  The same function written with THTTPClient, which is in the RTL from XE8 (CompilerVersion 29) on. Add
  System.Net.HttpClient and System.Net.URLClient to the uses clause to use it. Note that, unlike TIdHTTP, it does
  not raise an exception when the server answers an error, so we have to look at the status code ourselves.

function GetTimestamp(timeStampRequest: ByteArray): ByteArray;
var
  Http: THTTPClient;
  Request, Response: TMemoryStream;
  HttpResponse: IHTTPResponse;
begin
  Http := THTTPClient.Create;
  try
    Request := TMemoryStream.Create;
    try
      Response := TMemoryStream.Create;
      try
        Request.WriteBuffer(timeStampRequest[0], Length(timeStampRequest));
        Request.Position := 0;

        HttpResponse := Http.Post(TsaUrl, Request, Response,
                          [TNameValuePair.Create('Content-Type', 'application/timestamp-query')]);
        if HttpResponse.StatusCode <> 200 then
          raise Exception.Create('The Time Stamping Authority answered ' + IntToStr(HttpResponse.StatusCode)
             + ' ' + HttpResponse.StatusText);

        Result := nil;
        SetLength(Result, Response.Size);
        Response.Position := 0;
        if Length(Result) > 0 then Response.ReadBuffer(Result[0], Length(Result));
      finally
        Response.Free;
      end;
    finally
      Request.Free;
    end;
  finally
    Http.Free;
  end;
end;
*)

/// <summary>
/// Creates the factory that will sign the document in the format selected in the combo box.
/// </summary>
function TFSigningPdfs.CreateSignerFactory(const Signer: TCmsSigner): TPdfSignerFactory;
begin
  case TSignatureType(cbSignatureType.ItemIndex) of
    TSignatureType.PAdES_B_B:
      //Besides writing "/ETSI.CAdES.detached" in the pdf, this adds the ESS signing-certificate-v2 signed
      //attribute that CAdES needs, so the signature says which certificate created it.
      Result := TBuiltInSignerFactory.Create(Signer, TPdfSignatureSubFilter.EtsiCAdESDetached);

    TSignatureType.PAdES_B_T:
      //FlexCel has to reserve the space for the signature before it knows how big the timestamp will be, so it
      //asks the TSA for one sample token the first time. Passing the url as the cache key means the size is
      //measured once for the whole application and shared by every factory using this TSA, which matters because
      //TSAs tend to rate-limit. If you already know the size, set TokenSizeHint instead and FlexCel will not ask
      //for the sample at all.
      Result := TBuiltInSignerFactory.Create(Signer, TPdfSignatureSubFilter.EtsiCAdESDetached,
                   TPdfTimestampSettings_Create(GetTimestamp, TsaUrl));

    else
      Result := TBuiltInSignerFactory.Create(Signer, TPdfSignatureSubFilter.AdbePkcs7Detached);
  end;
end;

procedure TFSigningPdfs.LoadImage(const FileName: string);
begin
  ImgData := TFile.ReadAllBytes(FileName);
  SignaturePicture.Picture.LoadFromFile(FileName);
end;

procedure TFSigningPdfs.FormCreate(Sender: TObject);
begin
  DataPath := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\');
  LoadImage(DataPath + 'sign.png');
  cbSignatureType.ItemIndex := Ord(TSignatureType.PAdES_B_B);
end;


procedure TFSigningPdfs.btnCreateAndSignPdfClick(Sender: TObject);
var
  xls: TExcelFile;
  pdf: TFlexCelPdfExport;
  Cert: TX509Certificate2;
  Signer: TCmsSigner;
  SignerFactory: TPdfSignerFactory;
  Signature: TPdfSignature;

begin
  //Load the Excel file.
  if (not OpenExcelDialog.Execute) then exit;
  xls := TXlsFile.Create;
  try
    xls.Open(OpenExcelDialog.FileName);

    //Export it to pdf.
    pdf := TFlexCelPdfExport.Create(xls, true);
    try
      pdf.FontEmbed := TFontEmbed.Embed;

      //Load the certificate and create a signer.
      Cert := EncryptionFactory.GetX509Certificate(TFile.ReadAllBytes(DataPath + 'flexcel.pfx'), 'password');
      try
        // The current implementation uses only one certificate. The algorithm by
        // default if you leave the second parameter empty is SHA512.
        Signer := EncryptionFactory.GetSigner(TArray<TX509Certificate2>.Create(Cert), '');
        SignerFactory := nil;
        try
          //The format of the signature is decided by the factory, not by the signature itself.
          SignerFactory := CreateSignerFactory(Signer);
          Signer := nil; //The factory now owns the Signer so we don't want to free it.

          if (cbVisibleSignature.Checked) then
          begin
            //The -1 as "page" parameter means the last page.
            Signature := TPdfVisibleSignature.Create(SignerFactory,
                            'Signature',
                            'I have read the document and certify it is valid.',
                            'Springfield',
                            'adrian@tmssoftware.com',
                            -1,
                            TUIRectangle.Create(50, 50, 140, 70),
                            ImgData);
          end
          else
          begin
            Signature := TPdfSignature.Create(SignerFactory,
                                          'Signature',
                                          'I have read the document and certify it is valid.',
                                          'Springfield',
                                          'adrian@tmssoftware.com');
          end;
          SignerFactory := nil; //The signature now owns the factory so we don't want to free it.
        Except
          Signer.Free;  //Only if there is an error.
          SignerFactory.Free;
          raise;
        end;

        //A certifying signature (the default) says who is responsible for the document and which changes are
        //allowed in it afterwards, and only the first signature of a document can certify it. An approval
        //signature just says that whoever signed agrees with what the document says at that moment, and many of
        //them can be added to the same document.
        Signature.Certify := cbCertify.Checked;

        //You must sign the document *BEFORE* starting to write it.
        pdf.Sign(Signature); //Now the pdf owns the signature. There is no need to free it.

        if (not SavePdfDialog.Execute) then exit;
        pdf.ExportAllVisibleSheets(SavePdfDialog.FileName, false, 'Signed Pdf');
      finally
        Cert.Free;
      end;
    finally
      pdf.Free;
    end;
  finally
    xls.Free;
  end;
                    
  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SavePdfDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;

end;

procedure TFSigningPdfs.cbVisibleSignatureClick(Sender: TObject);
var
  delta: integer;
begin
  SignaturePicture.Visible := cbVisibleSignature.Checked;
  Delta := SignaturePicture.Height + 30;
  if (cbVisibleSignature.Checked) then Height := Height + delta else Height := Height - delta;
end;

procedure TFSigningPdfs.SignaturePictureClick(Sender: TObject);
begin
  if (not OpenPictureDialog.Execute) then exit;
  LoadImage(OpenPictureDialog.FileName);
end;

end.
