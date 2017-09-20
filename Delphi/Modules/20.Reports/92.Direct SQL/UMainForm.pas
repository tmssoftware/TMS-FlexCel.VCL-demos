unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, DB,
  ADODB;

type
  TMainForm = class(TForm)
    btnCancel: TButton;
    btnGo: TButton;
    SaveDialog: TSaveDialog;
    Label1: TLabel;
    dtStartDate: TDateTimePicker;
    dtEndDate: TDateTimePicker;
    Label2: TLabel;
    ADOConnection: TADOConnection;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure RunReport;
    function GetDataPath: string;
    procedure SetupConnection(const Report: TFlexCelReport);
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
  RunReport;

end;

function DBFile: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\..\SharedData\Northwind.mdb');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ADOConnection.ConnectionString := StringReplace(ADOConnection.ConnectionString, 'Northwind.mdb', DbFile, []);
end;

function TMainForm.GetDataPath: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..');
end;

procedure TMainForm.SetupConnection(const Report: TFlexCelReport);
begin
    Report.AddConnection('Northwind',
      function (const sql: string): TDataSet   //We need to return a new TDataSet here, FlexCel will free it.
      var
        ds: TADODataSet;
      begin
        ds := TADODataSet.Create(nil);
        ds.Connection := ADOConnection;
        ds.CommandText := sql;

        Result := ds;
      end);

    Report.AddSqlParameter('StartDate',
      procedure (const ParamName: string; const DataSet: TDataSet)
      begin
        (DataSet as TADODataSet).Parameters.ParamValues[ParamName] := dtStartDate.DateTime;
        (DataSet as TADODataSet).Parameters.ParamByName(ParamName).DataType := ftDateTime;
      end);

    Report.AddSqlParameter('EndDate',
      procedure (const ParamName: string; const DataSet: TDataSet)
      begin
        (DataSet as TADODataSet).Parameters.ParamValues[ParamName] := dtEndDate.DateTime;
        (DataSet as TADODataSet).Parameters.ParamByName(ParamName).DataType := ftDateTime;
      end);

end;

procedure TMainForm.RunReport;
var
  Report: TFlexCelReport;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    Report.SetValue('ReportCaption', 'Sales by Country and Employee');
    SetupConnection(Report);

    Report.Run(
      TPath.Combine(GetDataPath, 'Direct SQL.template.xls'),
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
