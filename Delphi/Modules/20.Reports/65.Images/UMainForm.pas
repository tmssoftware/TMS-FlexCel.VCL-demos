unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    btnCancel: TButton;
    btnGo: TButton;
    SaveDialog: TSaveDialog;
    Label1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
  private
    procedure RunReport;
    function GetDataPath: string;
    procedure GetImageData(const sender: TObject;
      const e: TGetImageDataEventArgs);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils, DemoData;

{$R *.dfm}

procedure TMainForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnGoClick(Sender: TObject);
begin
  RunReport;

end;

function TMainForm.GetDataPath: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..');
end;

procedure TMainForm.GetImageData(const sender: TObject; const e: TGetImageDataEventArgs);
var
  RealImageData, e_ImageData: TBytes;
  MemStream, OutStream: TMemoryStream;
  bmp, newbmp: TUIImage;
begin
  if (SameText(e.ImageName, '<#PhotoCode>')) then
  begin
    RealImageData := TImageUtils.StripOLEHeader(e.ImageData); //On access databases, images are stored with an OLE
                                                              //header that we have to strip to get the real image.
                                                              //This is done automatically by flexcel in most cases,
                                                              //but here we have the original image format.

    if Length(RealImageData) = 0 then exit;

    MemStream := TMemoryStream.Create;
    try
      MemStream.Write(RealImageData[0], Length(RealImageData));
      MemStream.Position := 0;

      bmp := TUIImage.FromStream(MemStream);
      try
        newbmp := bmp.ConvertToGrayscale;
        try
          OutStream := TMemoryStream.Create;
          try
            newbmp.Save(OutStream, TXlsImgType.Png);
            OutStream.Position := 0;
            e.Width := newbmp.Width;
            e.Height := newbmp.Height;
            SetLength(e_ImageData, OutStream.Size);
            if Length(e_ImageData) > 0 then OutStream.Read(e_ImageData[0], Length(e_ImageData));
            e.ImageData := e_ImageData;
          finally
            OutStream.Free;
          end;
        finally
          newbmp.Free;
        end;
      finally
        bmp.Free;
      end;

    finally
      MemStream.Free;
    end;
  end;
end;

procedure TMainForm.RunReport;
var
  Report: TFlexCelReport;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    Report.GetImageData := GetImageData;
    Report.AddTable(DemoTables);
    Report.SetValue('Date', Now);
    Report.Run(
      TPath.Combine(GetDataPath, 'Images.template.xls'),
      SaveDialog.FileName);
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

end.
