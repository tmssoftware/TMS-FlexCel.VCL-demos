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
    btnExportHTML: TButton;
    SaveDialogXls: TSaveDialog;
    Label1: TLabel;
    btnExportPdf: TButton;
    btnExportExcel: TButton;
    SaveDialogPdf: TSaveDialog;
    SaveDialogHtml: TSaveDialog;
    procedure btnCancelClick(Sender: TObject);
    procedure btnExportHTMLClick(Sender: TObject);
    procedure btnExportExcelClick(Sender: TObject);
    procedure btnExportPdfClick(Sender: TObject);
  private
    function RunReport(const Xls: TExcelFile; const SaveDialog: TSaveDialog): boolean;
    function GetDataPath: string;
    procedure ShowOpenResult(const SaveDialog: TSaveDialog);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils, DataModel, Queries, AureliusFlexCelSupport;

{$R *.dfm}

function DBFile: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\..\SharedData\Northwind.mdb');
end;


procedure TMainForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnExportExcelClick(Sender: TObject);
var
  Xls: TExcelFile;
begin
  Xls := TXlsFile.Create(true);
  try
    if not RunReport(Xls, SaveDialogXls) then exit;
    Xls.Save(SaveDialogXls.FileName);
    ShowOpenResult(SaveDialogXls);
  finally
    Xls.Free;
  end;
end;

procedure TMainForm.btnExportHTMLClick(Sender: TObject);
var
  Xls: TExcelFile;
  Html: TFlexCelHtmlExport;
begin
  Xls := TXlsFile.Create(true);
  try
    if not RunReport(Xls, SaveDialogHtml) then exit;
    Html := TFlexCelHtmlExport.Create(Xls, true);
    try
      Html.HtmlVersion := THtmlVersion.Html_5;
      Html.EmbedImages := true;
      Html.Export(SaveDialogHtml.FileName, '');
      ShowOpenResult(SaveDialogHtml);
    finally
      Html.Free;
    end;
  finally
    Xls.Free;
  end;
end;

procedure TMainForm.btnExportPdfClick(Sender: TObject);
var
  Xls: TExcelFile;
  Pdf: TFlexCelPdfExport;
begin
  Xls := TXlsFile.Create(true);
  try
    if not RunReport(Xls, SaveDialogPdf) then exit;
    Pdf := TFlexCelPdfExport.Create(Xls, true);
    try
      Pdf.Export(SaveDialogPdf.FileName);
      ShowOpenResult(SaveDialogPdf);
    finally
      Pdf.Free;
    end;
  finally
    Xls.Free;
  end;
end;

function TMainForm.GetDataPath: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..');
end;


function TMainForm.RunReport(const Xls: TExcelFile; const SaveDialog: TSaveDialog): boolean;
var
  Report: TFlexCelReport;
  Query: TAureliusQuery;
begin
  if not SaveDialog.Execute then exit(false);

  Report := TFlexCelReport.Create(true);
  try
    SetupAurelius(Report);

    Query := TAureliusQuery.Create(DBFile);
    try
      Report.AddTable<TEmployees>('Employees', Query.GetEmployees, TDisposeMode.DoNotDispose);
      Report.AddTable<TOrders>('Orders', Query.GetOrders, TDisposeMode.DoNotDispose);

      //Note that we've defined EmployeeID as an integer and not a TProxy, to avoid loading
      //the full employee for every order. If we had left EmployeeID as a proxy we would have
      //to define:
      //Report.AddRelationship('Employees', 'Orders', 'EmployeeID', 'EmployeeID.EmployeeID');
      //It would work, but it would be slower.
      Report.AddRelationship('Employees', 'Orders', 'EmployeeID', 'EmployeeID');
      Report.SetValue('Date', Now);

      Xls.Open(TPath.Combine(GetDataPath, 'TMS Aurelius.template.xls'));
      Report.Run(Xls);
    finally
      Query.Free;
    end;
  finally
    Report.Free;
  end;
  Result := true;
end;

procedure TMainForm.ShowOpenResult(const SaveDialog: TSaveDialog);
begin
  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

end.
