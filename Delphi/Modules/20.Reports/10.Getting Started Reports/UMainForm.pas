unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    edName: TLabeledEdit;
    edURL: TLabeledEdit;
    cbAutoOpen: TCheckBox;
    btnCancel: TButton;
    btnGo: TButton;
    SaveDialog: TSaveDialog;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
  private
    procedure Setup(const ReportStart: TFlexCelReport; const UserName, UserUrl,
      DataPath: string);
    procedure AutoOpenRun;
    procedure NormalRun;
    function GetDataPath: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils;

{$R *.dfm}

procedure TMainForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnGoClick(Sender: TObject);
begin
  if cbAutoOpen.Checked then AutoOpenRun else NormalRun;

end;

function TMainForm.GetDataPath: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..');
end;

procedure TMainForm.Setup(const ReportStart: TFlexCelReport; const UserName: string; const UserUrl: string; const DataPath: string);
begin
  //Set report variables, including an image.

  ReportStart.SetValue('Date', Now);
  ReportStart.SetValue('Name', UserName);
  ReportStart.SetValue('TwoLines', 'First line' + #13#10 + 'Second Line');
  ReportStart.SetValue('Empty', TReportValue.Empty);
  ReportStart.SetValue('LinkPage', UserUrl);
  ReportStart.SetValue('Img', TFile.ReadAllBytes(TPath.Combine(DataPath, 'img.png')));
end;

procedure TMainForm.NormalRun;
var
  Report: TFlexCelReport;
  FileExt: string;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    Setup(Report, edName.Text, edURL.Text, GetDataPath);
    //FlexCel doesn't do a 100% accurate conversion between xls and xlsx, it isn't designed for that
    //So to create an xls file is it best to use an xls template, and for xlsx and xlsx template.
    if TPath.GetExtension(SaveDialog.FileName) = '.xlsx' then FileExt := '.xlsx' else FileExt := '.xls';

    Report.Run(
      TPath.Combine(GetDataPath, 'Getting Started Reports.template' + FileExt),
      SaveDialog.FileName);
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

procedure TMainForm.AutoOpenRun;
begin

end;

end.
