unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
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
    procedure GetIncludes(const sender: TObject;const e: TGetIncludeEventArgs);
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


procedure TMainForm.GetIncludes(const sender: TObject; const e: TGetIncludeEventArgs);
var
  IncReport: TResourceStream;
  b: TBytes;
begin
  IncReport := TResourceStream.Create(hinstance, TPath.GetFileNameWithoutExtension(e.FileName), RT_RCDATA);
  try
    SetLength(b, IncReport.Size);
    if (Length(b) > 0) then IncReport.ReadBuffer(b[0], Length(b));
    e.IncludeData := b;
  finally
    IncReport.Free;
  end;
end;

procedure TMainForm.RunReport;
var
  Report: TFlexCelReport;
  TemplateStream: TResourceStream;
  OutputStream: TFileStream;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    Report.GetInclude := GetIncludes; //this is only needed if you have includes.
    Report.AddTable(DemoTables);
    Report.SetValue('Date', Now);

    TemplateStream := TResourceStream.Create(hinstance, 'TemplatesInTheExe', RT_RCDATA);
    try
      OutputStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
      try
        Report.Run(TemplateStream, OutputStream);
      finally
        OutputStream.Free;
      end;
    finally
      TemplateStream.Free;
    end;
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

end.
