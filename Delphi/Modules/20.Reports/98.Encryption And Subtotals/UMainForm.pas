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
    OpenPassTemplate: TLabeledEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    OpenPassGenerated: TLabeledEdit;
    ModifyPassGenerated: TLabeledEdit;
    ProtectWorkbookPass: TLabeledEdit;
    ProtectSheetPass: TLabeledEdit;
    ProtectWorkbook: TCheckBox;
    ProtectSheet: TCheckBox;
    ReservingUser: TLabeledEdit;
    RecommendReadOnly: TCheckBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
  private
    procedure RunReport;
    function GetDataPath: string;
    procedure Report_AfterGenerateSheet(const Sender: TObject;
      const e: TGenerateEventArgs);
    procedure Report_AfterGenerateWorkbook(const Sender: TObject;
      const e: TGenerateEventArgs);
    procedure Report_BeforeReadTemplate(const Sender: TObject;
      const e: TGenerateEventArgs);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils, DemoProducts;

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


procedure TMainForm.RunReport;
var
  Report: TFlexCelReport;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    Report.BeforeReadTemplate := Report_BeforeReadTemplate;
    Report.AfterGenerateSheet := Report_AfterGenerateSheet;
    Report.AfterGenerateWorkbook := Report_AfterGenerateWorkbook;

    Report.AddTable('Products', DemoTables.Products);
    Report.AddTable('Order Details', DemoTables.OrderDetails);
    Report.SetValue('Date', Now);
    Report.Run(
      TPath.Combine(GetDataPath, 'Encryption and Subtotals.template.xls'),
      SaveDialog.FileName);
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

procedure TMainForm.Report_BeforeReadTemplate(const Sender: TObject; const e: TGenerateEventArgs);
begin
  e.DataFile.Protection.OpenPassword := OpenPassTemplate.Text;
end;

procedure TMainForm.Report_AfterGenerateSheet(const Sender: TObject; const e: TGenerateEventArgs);
begin
  e.DataFile.Protection.SetSheetProtection(ProtectSheetPass.Text, TSheetProtectionOptions.Create(ProtectSheet.Checked));
end;

procedure TMainForm.Report_AfterGenerateWorkbook(const Sender: TObject; const e: TGenerateEventArgs);
begin
  e.DataFile.Protection.OpenPassword := OpenPassGenerated.Text;
  e.DataFile.Protection.SetModifyPassword(ModifyPassGenerated.Text, RecommendReadOnly.Checked, ReservingUser.Text);
  e.DataFile.Protection.SetWorkbookProtection(ProtectWorkbookPass.Text, TWorkbookProtectionOptions.Create(false, ProtectWorkbook.Checked));
end;

end.
