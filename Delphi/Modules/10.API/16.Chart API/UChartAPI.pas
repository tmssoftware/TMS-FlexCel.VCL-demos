unit UChartAPI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, UPaths,
  Dialogs, StdCtrls, VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellAPI;

type
  TFChartAPI = class(TForm)
    Memo1: TMemo;
    btnCreateFile: TButton;
    SaveDialog: TSaveDialog;
    procedure btnCreateFileClick(Sender: TObject);
  private
    procedure CreateFile;
    procedure AddData(const Xls: TExcelFile);
    procedure AddChart(const Xls: TExcelFile);
    procedure OpenFile(const Xls: TExcelFile);
  end;

var
  FChartAPI: TFChartAPI;

implementation
uses IOUtils, DateUtils;

{$IFNDEF FPC}
{$R *.dfm}
{$ENDIF}


procedure TFChartAPI.AddChart(const Xls: TExcelFile);
var
  ChartOptions1: IShapeProperties;
  Chart1: IExcelChart;
  Title: IDataLabel;
  TextFillOptions: IChartFillOptions;
  LabelTextOptions: IChartTextOptions;
  LabelOptions: TDataLabelOptions;
  ChartLineOptions: IChartLineOptions;
  ChartFillOptions: IChartFillOptions;
  Paragraphs: TArray<TDrawingTextParagraph>;
  ParagraphRuns: TArray<TDrawingTextRun>;
  TextAttributes: TDrawingTextAttributes;
  RunProperties: TDrawingTextProperties;
  TextFill: IFillStyle;
  ParagraphEndProperties: TDrawingTextProperties;
  LabelValue1: TDrawingRichString;
  PlotAreaFrame: IChartFrameOptions;
  PlotAreaPos: TChartPlotAreaPosition;
  Series: IChartSeries;
  SeriesFill: IChartSeriesFillOptions;
  SeriesLine: IChartSeriesLineOptions;
  AxisFont: TFlxChartFont;
  AxisLine: TAxisLineOptions;
  AxisTicks: TAxisTickOptions;
  AxisRangeOptions: TAxisRangeOptions;
  CatAxis: TBaseAxis;
  ValAxis: TBaseAxis;

  LastYear, Year: integer;
  shade: double;
  i, xf: integer;
  SeriesColor: TDrawingColor;
begin

  //Objects
  ChartOptions1 := TShapeProperties_Create;
  ChartOptions1.Anchor := TClientAnchor.Create(TFlxAnchorType.MoveAndResize, 1, 215, 1, 608, 30, 228, 17, 736);
  ChartOptions1.ShapeName := 'Lines of Code';
  ChartOptions1.Print := true;
  ChartOptions1.Visible := true;
  ChartOptions1.ShapeOptions.SetValue(TShapeOption.fLockText, true);
  ChartOptions1.ShapeOptions.SetValue(TShapeOption.LockRotation, true);
  ChartOptions1.ShapeOptions.SetValue(TShapeOption.fAutoTextMargin, true);
  ChartOptions1.ShapeOptions.SetValue(TShapeOption.fillColor, 134217806);
  ChartOptions1.ShapeOptions.SetValue(TShapeOption.wzName, 'Lines of code');
  Chart1 := xls.AddChart(ChartOptions1, TChartType.Area, TChartStyle.Create(102), false);

  Title := TDataLabel_Create();
  Title.PositionZeroBased := nil;

  TextFillOptions := TChartFillOptions_Create(TShapeFill_Create(TSolidFill_Create(TDrawingColor.FromRgb($80, $80, $80)), true, TFormattingType.Subtle, TDrawingColor.FromRgb($00, $00, $00, TColorTransformArray.Create(TColorTransform.Create(TColorTransformType.Alpha, 0))), false));
  LabelTextOptions := TChartTextOptions_Create(TFlxChartFont.Create('Calibri Light', 320, TExcelColor.FromArgb($80, $80, $80), [TFlxFontStyles.Bold], TFlxUnderline.None, TFontScheme.Major), THFlxAlignment.center, TVFlxAlignment.center, TBackgroundMode.Transparent, TextFillOptions);
  Title.TextOptions := LabelTextOptions;
  LabelOptions := TDataLabelOptions.Create();
  Title.LabelOptions := LabelOptions;
  ChartLineOptions := TChartLineOptions_Create(TShapeLine_Create(true, TLineStyle_Create(TNoFill_Create(), nil), nil, TFormattingType.Subtle));
  ChartFillOptions := TChartFillOptions_Create(TShapeFill_Create(TNoFill_Create(), false, TFormattingType.Subtle, nil, false));
  Title.Frame := TChartFrameOptions_Create(ChartLineOptions, ChartFillOptions, false);

  SetLength(Paragraphs, 1);
  SetLength(ParagraphRuns, 1);
  TextAttributes := TDrawingTextAttributes.Create(nil, 'en-US', '', 16, TRUE, nil,
     NullableTDrawingUnderlineStyle.Null, NullableTDrawingTextStrike.Null, nil,
     NullableTDrawingTextCapitalization.Null, NullableTDrawingCoordinate.Null,
     nil, nil, nil, false, false, false, 0, '');
  TextFill := TSolidFill_Create(TDrawingColor.FromRgb($80, $80, $80));
  RunProperties := TDrawingTextProperties.Create(TextFill,
      nil,
      nil,
      nil,
      TDrawingUnderline.Null,
      TThemeTextFont.Create('Calibri Light'),
      nil,
      nil,
      nil,
      TDrawingHyperlink.Null,
      TDrawingHyperlink.Null,
      false,
      TextAttributes);

  ParagraphRuns[0] := TDrawingTextRun.Create('FlexCel: Lines of code over time', RunProperties);
  ParagraphEndProperties := TDrawingTextProperties.Create(nil, TDrawingTextAttributes.Empty);
  Paragraphs[0] := TDrawingTextParagraph.Create(ParagraphRuns, TDrawingParagraphProperties.Empty, ParagraphEndProperties);

  LabelValue1 := TDrawingRichString.Create(Paragraphs);

  Title.LabelValues := TArray<TDrawingValue>.Create(
    LabelValue1
  );

  Chart1.SetTitle(Title);

  Chart1.Background := TChartFrameOptions_Create(TDrawingColor.FromTheme(TThemeColor.Dark1, TColorTransformArray.Create(TColorTransform.Create(TColorTransformType.LumMod, 0.15), TColorTransform.Create(TColorTransformType.LumOff, 0.85))), 9525, TDrawingColor.FromTheme(TThemeColor.Light1), false);

  ChartLineOptions := TChartLineOptions_Create(TShapeLine_Create(true, TLineStyle_Create(TNoFill_Create(), nil), nil, TFormattingType.Subtle));
  ChartFillOptions := TChartFillOptions_Create(TShapeFill_Create(TPatternFill_Create(TDrawingColor.FromTheme(TThemeColor.Dark1, TColorTransformArray.Create(TColorTransform.Create(TColorTransformType.LumMod, 0.15), TColorTransform.Create(TColorTransformType.LumOff, 0.85))), TDrawingColor.FromTheme(TThemeColor.Light1), TDrawingPattern.ltDnDiag), true, TFormattingType.Subtle, nil, false));
  PlotAreaFrame := TChartFrameOptions_Create(ChartLineOptions, ChartFillOptions, false);
  PlotAreaPos := TChartPlotAreaPosition.Create(true, TChartRelativeRectangle.Automatic, TChartLayoutTarget.Inner, true);
  Chart1.PlotArea := TChartPlotArea_Create(PlotAreaFrame, PlotAreaPos, false);

  Chart1.SetChartOptions(1, TAreaChartOptions_Create(false, TStackedMode.Stacked, nil));

  LastYear := 0;
  shade := 1;
  for i := 2 to 189 do
  begin


    Series := TChartSeries_Create(
               '=' + TCellAddress.Create('Data', 1, i, true, true).CellRef,
               '=' + TCellAddress.Create('Data', 2, i, true, true).CellRef + ':' + TCellAddress.Create('Data', 189, i, true, true).CellRef,
               '=Data!$A$2:$A$189');

    //We will display every year in a single color. Each month gets its own shade.
    xf := -1;
    Year := YearOf(TFlxDateTime.FromOADate((xls.GetCellValue(2, 1, i, xf).AsNumber), false));
    if (LastYear <> Year) then shade := 1 else if (shade > 0.3) then shade := shade - 0.05;
    LastYear := Year;
    SeriesColor := TDrawingColor.FromTheme(TThemeColor(integer(TThemeColor.Accent1) + Year mod 6),
                    TColorTransformArray.Create(TColorTransform.Create(TColorTransformType.Shade, shade)));

    SeriesFill := TChartSeriesFillOptions_Create(TShapeFill_Create(TSolidFill_Create(SeriesColor), true, TFormattingType.Subtle, nil, false), nil, false, false);
    SeriesLine := TChartSeriesLineOptions_Create(TShapeLine_Create(true, TLineStyle_Create(TNoFill_Create(), nil), nil, TFormattingType.Subtle), false);
    Series.Options.Add(TChartSeriesOptions.CreateNoClone(-1, SeriesFill, SeriesLine, nil, nil, nil, true));
    Chart1.AddSeries(Series);
  end;

  Chart1.PlotEmptyCells := TPlotEmptyCells.Zero;
  Chart1.ShowDataInHiddenRowsAndCols := false;


  AxisFont := TFlxChartFont.Create('Calibri', 180, TExcelColor.FromArgb($59, $59, $59), [], TFlxUnderline.None, TFontScheme.Minor);
  AxisLine := TAxisLineOptions.Create();
  AxisLine.MainAxis := TChartLineOptions_Create(TShapeLine_Create(true, TLineStyle_Create(TSolidFill_Create(TDrawingColor.FromTheme(TThemeColor.Dark1, TColorTransformArray.Create(TColorTransform.Create(TColorTransformType.LumMod, 0.15), TColorTransform.Create(TColorTransformType.LumOff, 0.85)))), 9525, TPenAlignment.Center, TLineCap.Flat, TCompoundLineType.Single, NullableTLineDashing.Null, TLineJoin.Round, nil, nil, nil), nil, TFormattingType.Subtle));
  AxisLine.DoNotDrawLabelsIfNotDrawingAxis := false;
  AxisTicks := TAxisTickOptions.Create(TTickType.Outside, TTickType.None, TAxisLabelPosition.NextToAxis, TBackgroundMode.Transparent, TDrawingColor.FromRgb($59, $59, $59), 0);
  AxisRangeOptions := TAxisRangeOptions.Create(12, 1, false, false, false);
  CatAxis := TCategoryAxis.Create(0, 0, 12, TDateUnits.Days, 12, TDateUnits.Days, TDateUnits.Months, 0, [TCategoryAxisOptions.AutoMin, TCategoryAxisOptions.AutoMax, TCategoryAxisOptions.DateAxis, TCategoryAxisOptions.AutoCrossDate, TCategoryAxisOptions.AutoDate], AxisFont, 'yyyy\-mm\-dd;@', true, AxisLine, AxisTicks, AxisRangeOptions, nil, TChartAxisPos.Bottom, 1);
  AxisFont := TFlxChartFont.Create('Calibri', 180, TExcelColor.FromArgb($59, $59, $59), [], TFlxUnderline.None, TFontScheme.Minor);
  AxisLine := TAxisLineOptions.Create();
  AxisLine.MainAxis := TChartLineOptions_Create(TShapeLine_Create(true, TLineStyle_Create(TSolidFill_Create(TDrawingColor.FromTheme(TThemeColor.Dark1, TColorTransformArray.Create(TColorTransform.Create(TColorTransformType.LumMod, 0.15), TColorTransform.Create(TColorTransformType.LumOff, 0.85)))), 9525, TPenAlignment.Center, TLineCap.Flat, TCompoundLineType.Single, NullableTLineDashing.Null, TLineJoin.Round, nil, nil, nil), nil, TFormattingType.Subtle));
  AxisLine.MajorGridLines := TChartLineOptions_Create(TShapeLine_Create(true, TLineStyle_Create(TSolidFill_Create(TDrawingColor.FromTheme(TThemeColor.Dark1, TColorTransformArray.Create(TColorTransform.Create(TColorTransformType.LumMod, 0.15), TColorTransform.Create(TColorTransformType.LumOff, 0.85)))), 9525, TPenAlignment.Center, TLineCap.Flat, TCompoundLineType.Single, NullableTLineDashing.Null, TLineJoin.Round, nil, nil, nil), nil, TFormattingType.Subtle));
  AxisLine.DoNotDrawLabelsIfNotDrawingAxis := false;
  AxisTicks := TAxisTickOptions.Create(TTickType.None, TTickType.None, TAxisLabelPosition.NextToAxis, TBackgroundMode.Transparent, TDrawingColor.FromRgb($59, $59, $59), 0);
  ValAxis := TValueAxis.Create(0, 0, 0, 0, 0, [TValueAxisOptions.AutoMin, TValueAxisOptions.AutoMax, TValueAxisOptions.AutoMajor, TValueAxisOptions.AutoMinor, TValueAxisOptions.AutoCross], AxisFont, 'General', true, AxisLine, AxisTicks, nil, TChartAxisPos.Left);
  Chart1.SetChartAxis(TChartAxis_Create(0, CatAxis, ValAxis));

end;

procedure TFChartAPI.AddData(const Xls: TExcelFile);
begin
  //Add a new empty sheet for adding the chart.
  Xls.InsertAndCopySheets(0, 1, 1);
  Xls.ActiveSheet := 1;
  Xls.SheetName := 'Chart';
  Xls.PrintToFit := true;
  Xls.PrintScale := 70;
  Xls.PrintXResolution := 600;
  Xls.PrintYResolution := 600;
  Xls.PrintOptions := [];
  Xls.PrintPaperSize := TPaperSize.Letter;
  Xls.PrintLandscape := true;

  AddChart(Xls);

end;

procedure TFChartAPI.btnCreateFileClick(Sender: TObject);
begin
   CreateFile;
end;


procedure TFChartAPI.CreateFile;
var
  Xls: TExcelFile;
begin
  Xls := TXlsFile.Create(TPath.Combine(DataFolder, 'git-stats.xlsx'), true);

  try
    AddData(Xls);
    OpenFile(Xls);
  finally
    FreeAndNil(Xls);
  end;
end;

procedure TFChartAPI.OpenFile(const Xls: TExcelFile);
begin
  if not SaveDialog.Execute then exit;
  Xls.Save(SaveDialog.FileName);

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

end.
