unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, DB, ADODB;

type
  TMainForm = class(TForm)
    btnCancel: TButton;
    btnGo: TButton;
    SaveDialog: TSaveDialog;
    Label1: TLabel;
    ADOConnection: TADOConnection;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure RunReport;
    function GetDataPath: string;
    procedure LoadUserTables(const sender: TObject;
      const e: TUserTableEventArgs);
    function GetDataSet(const TableName: string): TDataSet;
    function Query(const sql: string): TDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils;

{$R *.dfm}
function DBFile: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\..\SharedData\Northwind.mdb');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ADOConnection.ConnectionString := StringReplace(ADOConnection.ConnectionString, 'Northwind.mdb', DbFile, []);
end;


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
    Report.UserTable := LoadUserTables;
    Report.DeleteEmptyRanges := false;
    Report.Run(
      TPath.Combine(GetDataPath, 'User Tables.template' + TPath.GetExtension(SaveDialog.FileName)),
      SaveDialog.FileName);
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

function TMainForm.Query(const sql: string): TDataSet;
begin
  Result := TADODataSet.Create(nil);
  try
    (Result as TADODataSet).Connection := ADOConnection;
    (Result as TADODataSet).CommandText := sql;
  except
    Result.free;
    raise;
  end;
end;

function TMainForm.GetDataSet(const TableName: string): TDataSet;
begin
  if (TableName = 'SUPPLIERS') then exit (Query('select * from suppliers'));
  if (TableName = 'CATEGORIES') then exit (Query('select * from categories'));
  if (TableName = 'PRODUCTS') then exit (Query('select * from products'));
  raise Exception.Create('Unknown user table: '  + TableName);
end;

procedure TMainForm.LoadUserTables(const sender: TObject; const e: TUserTableEventArgs);
var
  TableName: string;
  ds: TDataSet;
begin
  //On this example we will just return the table with the name specified on parameters
  //but you could return whatever you wanted here.
  //As always, remember to *validate* what the user can enter on the parameters string.

  TableName := UpperCase(e.TableName);
  ds := GetDataSet(TableName);

  (sender as TFlexCelReport).AddTable(e.TableName, ds, TRecordCountMode.Normal, TDisposeMode.DisposeAfterRun);


end;

end.
