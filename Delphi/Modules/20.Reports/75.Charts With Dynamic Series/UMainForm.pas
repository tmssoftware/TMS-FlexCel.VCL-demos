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
    function GetDataPath: string;
    procedure CustomizeSeriesColors(const sender: TObject;
      const e: TCustomizeChartEventArgs);
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


procedure TMainForm.RunReport;
var
  Report: TFlexCelReport;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    Report.AddTable(DemoTables);
    Report.CustomizeChart := CustomizeSeriesColors;
    Report.Run(
      TPath.Combine(GetDataPath, 'Charts With Dynamic Series.template.xlsx'),
      SaveDialog.FileName);
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

procedure TMainForm.CustomizeSeriesColors(const sender: TObject; const e: TCustomizeChartEventArgs);
var
  subChart: integer;
  series: integer;
  seriesDef: IChartSeries;
  seriesOptions: TChartSeriesOptions;
begin
  if (e.ChartName = 'Stock<#swap series>') then
  begin
     //In this event we will set the colors of the series depending on the product.
     //Let's image each product has an associated color that we want to use for its series.
    for subChart := 1 to e.Chart.SubchartCount do
    begin
      for series := 1 to e.Chart.SeriesInSubchart(subChart) do
      begin
        seriesDef := e.Chart.GetSeriesInSubchart(subChart, series, true, true, true);
        seriesOptions := seriesDef.Options[-1];
        seriesOptions.FillOptions := TChartSeriesFillOptions_Create(TShapeFill_Create(true, TSolidFill_Create(Colors.Red)), nil, false, false);
        seriesOptions.LineOptions := TChartSeriesLineOptions_Create(TShapeLine_Create(true, TLineStyle_Create(TSolidFill_Create(Colors.Red))), false);
        e.Chart.SetSeriesInSubchart(subChart, series, seriesDef);
      end;

    end;

  end;

end;


end.
