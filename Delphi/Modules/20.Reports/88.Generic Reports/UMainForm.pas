unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, DB, ADODB,
  Grids, DBGrids, ComCtrls, ToolWin, ActnList, ImgList;

type
  TMainForm = class(TForm)
    SaveDialog: TSaveDialog;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    DBGrid1: TDBGrid;
    ADOConnection: TADOConnection;
    Table: TADODataSet;
    Actions: TActionList;
    ActionQuery: TAction;
    ActionExportToExcel: TAction;
    ActionClose: TAction;
    DsTable: TDataSource;
    ToolbarImages: TImageList;
    ToolbarImages_100Scale: TImageList;
    ToolbarImages_300Scale: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionQueryExecute(Sender: TObject);
    procedure ActionExportToExcelExecute(Sender: TObject);
  private
    procedure RunReport;
    function GetDataPath: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils, USQLDialog, UFlexCelHDPI;

{$R *.dfm}

procedure TMainForm.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;


procedure TMainForm.ActionExportToExcelExecute(Sender: TObject);
begin
  RunReport;
end;

procedure TMainForm.ActionQueryExecute(Sender: TObject);
begin
  if EnterSQL.ShowModal <> mrOk then exit;
  Table.Active := false;
  Table.CommandText := EnterSQL.SQL;
  Table.Active := true;
end;

function DBFile: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\..\SharedData\Northwind.mdb');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ADOConnection.ConnectionString := StringReplace(ADOConnection.ConnectionString, 'Northwind.mdb', DbFile, []);
  Table.CommandText := 'select * from orders';
  Table.Active := true;
  RegisterForHDPI(Self, nil);
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
    Report.AddTable('Table', Table);

    Report.SetValue('Date', Now);
    Report.SetValue('ReportCaption', Table.CommandText);
    Report.Run(
      TPath.Combine(GetDataPath, 'Generic Reports.template.xls'),
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
