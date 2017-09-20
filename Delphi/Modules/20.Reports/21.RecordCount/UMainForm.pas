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
    CountOption: TRadioGroup;
    Label1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
  private
    procedure RunReport;
    function GetDataPath: string;
    procedure DoSlowCount;
    procedure DoFlexCelCount;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils, DataSlowCount, DataFlexCelCount;

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
begin
  if not SaveDialog.Execute then exit;

  if CountOption.ItemIndex = 1 then DoSlowCount else DoFlexCelCount;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

procedure TMainForm.DoSlowCount;
var
  Report: TFlexCelReport;
begin
  Report := TFlexCelReport.Create(true);
  try
    Report.AddTable(TablesSlowCount, TRecordCountMode.normal);
    Report.SetValue('Date', Now);
    Report.Run(
      TPath.Combine(GetDataPath, 'RecordCount.template.xls'),
      SaveDialog.FileName);
  finally
    Report.Free;
  end
end;

procedure TMainForm.DoFlexCelCount;
var
  Report: TFlexCelReport;
begin
  Report := TFlexCelReport.Create(true);
  try
    //the categories table in this data module change the sql to include the count.
    //The orders table doesn't need a FlexCelCount parameter, because it is related
    //with a FlexCel Relationship with categories. Tables that are filtered in the template,
    //or sorted, or have relationships added with AddRelationship will calculate the count automatically.
    Report.AddTable(TablesFlexCelCount);

    //for this example we will use a master detail relationship defined in FlexCel, instead of using one defined with mastersources.
    //note that there aren't datasources in the datamodule, Categories and Products aren't linked.
    Report.AddRelationship('Categories', 'Products', 'CategoryID', 'CategoryID');
    Report.SetValue('Date', Now);
    Report.Run(
      TPath.Combine(GetDataPath, 'RecordCount.template.xls'),
      SaveDialog.FileName);
  finally
    Report.Free;
  end
end;


end.
