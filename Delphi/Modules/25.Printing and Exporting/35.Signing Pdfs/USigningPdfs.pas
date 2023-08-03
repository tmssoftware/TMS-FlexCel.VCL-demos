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
  TFSigningPdfs = class(TForm)
    btnCreateAndSignPdf: TButton;
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

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSigningPdfs: TFSigningPdfs;

implementation
uses IOUtils, UFlexCelHDPI, ShellAPI;

{$R *.dfm}
procedure TFSigningPdfs.LoadImage(const FileName: string);
begin
  ImgData := TFile.ReadAllBytes(FileName);
  SignaturePicture.Picture.LoadFromFile(FileName);
end;

procedure TFSigningPdfs.FormCreate(Sender: TObject);
begin
  DataPath := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\');
  LoadImage(DataPath + 'sign.png');
end;


procedure TFSigningPdfs.btnCreateAndSignPdfClick(Sender: TObject);
var
  xls: TExcelFile;
  pdf: TFlexCelPdfExport;
  Cert: TX509Certificate2;
  Signer: TCmsSigner;
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
        try
          if (cbVisibleSignature.Checked) then
          begin
            //The -1 as "page" parameter means the last page.
            Signature := TPdfVisibleSignature.Create(TBuiltInSignerFactory.Create(Signer),
                            'Signature',
                            'I have read the document and certify it is valid.',
                            'Springfield',
                            'adrian@tmssoftware.com',
                            -1,
                            TUIRectangle.Create(50, 50, 140, 70),
                            ImgData);
            Signer := nil; //The signature now owns the Signer so we don't want to free it.



          end
          else
          begin
            Signature := TPdfSignature.Create(TBuiltInSignerFactory.Create(Signer),
                                          'Signature',
                                          'I have read the document and certify it is valid.',
                                          'Springfield',
                                          'adrian@tmssoftware.com');
            Signer := nil; //The signature now owns the Signer so we don't want to free it.
          end;
        Except
          Signer.Free;  //Only if there is an error.
          raise;
        end;

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
