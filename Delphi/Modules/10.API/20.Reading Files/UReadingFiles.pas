unit UReadingFiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, StdCtrls,
  Tabs, Grids,ExtCtrls, ComCtrls, ToolWin, UPaths,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter;

type
  TFReadingFiles = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    SheetData: TStringGrid;
    Tabs: TTabSet;
    Panel2: TPanel;
    Label1: TLabel;
    FmtBox: TEdit;
    Actions: TActionList;
    ActionOpen: TAction;
    ActionValueInCurrentCell: TAction;
    ActionInfo: TAction;
    ActionClose: TAction;
    OpenDialog: TOpenDialog;
    ToolbarImages: TImageList;
    StatusBar: TStatusBar;
    ToolButton7: TToolButton;
    ActionFormatValues: TAction;
    ToolbarImages_300Scale: TImageList;
    ToolbarImages_100Scale: TImageList;
    Panel1: TPanel;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionInfoExecute(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure ActionValueInCurrentCellExecute(Sender: TObject);
    procedure SheetDataSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ActionFormatValuesExecute(Sender: TObject);
    procedure TabsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    UpdatingCount, UpdatingCellsCount: integer;
    Xls: TExcelFile;

    procedure ImportFile(const FileName: string);
    procedure FillTabs;
    procedure FillGrid(const Formatted: boolean);
    procedure SelectedCell(const aCol, aRow: integer);
    procedure AnalizeFile(const Row, Col: integer);
    function FormatValue(const v: TCellValue; const Row,
      Col: integer): String;
    procedure ClearGrid;
    procedure ResizeGrid;
    procedure BeginUpdatingGrid;
    procedure EndUpdatingGrid;
    procedure BeginUpdatingGridCells;
    procedure EndUpdatingGridCells;
    { Private declarations }
  public
    destructor Destroy; override;
    { Public declarations }
  end;

var
  FReadingFiles: TFReadingFiles;

implementation
uses UFlexCelHDPI;

{$R *.dfm}

procedure TFReadingFiles.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFReadingFiles.ActionFormatValuesExecute(Sender: TObject);
begin
  ActionFormatValues.Checked := not ActionFormatValues.Checked;
  FillGrid(ActionFormatValues.Checked);
end;

procedure TFReadingFiles.ActionInfoExecute(Sender: TObject);
begin
  ShowMessage('This demo shows how to read the contents of an xls file' + #10 +
      'The ''Open File'' button will load an Excel file into a dataset.'+ #10 +
      'The ''Format Values'' button will apply the format to the cells, or show the raw data.'+ #10 +
      'The ''Value in Current Cell'' button will show more information about the cell selected in the grid. Try it with formulas.');

end;

procedure TFReadingFiles.ActionOpenExecute(Sender: TObject);
begin
  if not OpenDialog.Execute then exit;
  ImportFile(OpenDialog.FileName);
end;

procedure TFReadingFiles.ActionValueInCurrentCellExecute(Sender: TObject);
begin
  AnalizeFile(SheetData.Row, SheetData.Col);
end;

destructor TFReadingFiles.Destroy;
begin
  FreeAndNil(Xls);
  inherited;
end;

procedure TFReadingFiles.SheetDataSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  SelectedCell(aCol, aRow);
  CanSelect := true;
end;

procedure TFReadingFiles.TabsClick(Sender: TObject);
begin
  FillGrid(ActionFormatValues.Checked);
end;

procedure TFReadingFiles.FillTabs;
var
  s: integer;
begin

  Tabs.Tabs.Clear;
  for s := 1 to Xls.SheetCount do
  begin
    Tabs.Tabs.Add(Xls.GetSheetName(s));
  end;
end;


procedure TFReadingFiles.ImportFile(const FileName: string);
var
  StartOpen: TDateTime;
  EndOpen: TDateTime;
  EndFill: TDateTime;
begin
   //Open the Excel file.
  if Xls = nil then Xls := TXlsFile.Create(false);
  StartOpen := Now;
  xls.Open(FileName);
  EndOpen := Now;

  FillTabs;
  Tabs.TabIndex := Xls.ActiveSheet - 1;

  EndFill := Now;
  StatusBar.SimpleText := 'Time to load file: '+  ElapsedTime(EndOpen, StartOpen) + '     Time to load file and fill grid: ' + ElapsedTime(EndFill, StartOpen);
  Caption := 'Reading Files: ' + ExtractFileName(FileName);
end;

procedure TFReadingFiles.ClearGrid;
var
  r: integer;
begin
  BeginUpdatingGrid;
  try
    for r := 1 to SheetData.RowCount do SheetData.Rows[r].Clear;
  finally
    EndUpdatingGrid;
  end;
end;

procedure TFReadingFiles.BeginUpdatingGrid;
begin
  Inc(UpdatingCount);
  if (UpdatingCount = 1) then
  begin
    SendMessage(SheetData.Handle, WM_SETREDRAW, 0, 0);
  end;
end;

procedure TFReadingFiles.EndUpdatingGrid;
begin
  Dec(UpdatingCount);
  if (UpdatingCount = 0) then
  begin
    SendMessage(SheetData.Handle, WM_SETREDRAW, 1, 0);
    RedrawWindow(SheetData.Handle, nil, 0, RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN);
  end;
end;

procedure TFReadingFiles.BeginUpdatingGridCells;
var
  c: integer;
begin
  Inc(UpdatingCellsCount);
  if (UpdatingCellsCount = 1) then
  begin
    for c := 1 to SheetData.ColCount do SheetData.Cols[c].BeginUpdate;
  end;
end;

procedure TFReadingFiles.EndUpdatingGridCells;
var
  c: integer;
begin
  Dec(UpdatingCellsCount);
  if (UpdatingCellsCount = 0) then
  begin
    for c := 1 to SheetData.ColCount do SheetData.Cols[c].EndUpdate;
  end;
end;

procedure TFReadingFiles.FillGrid(const Formatted: boolean);
var
  r, c, cIndex: Integer;
  v: TCellValue;
begin
  if Xls = nil then exit;
  BeginUpdatingGrid;
  try
    if (Tabs.TabIndex + 1 <= Xls.SheetCount) and (Tabs.TabIndex >= 0) then Xls.ActiveSheet := Tabs.TabIndex + 1 else Xls.ActiveSheet := 1;
    //Clear data in previous grid
    ClearGrid;
    SheetData.RowCount := 1;
    SheetData.ColCount := 1;
    FmtBox.Text := '';

    SheetData.RowCount := Xls.RowCount + 1; //Include fixed row
    SheetData.ColCount := Xls.ColCount + 1; //Include fixed col. NOTE THAT COLCOUNT IS SLOW. We use it here because we really need it. See the Performance.pdf doc.

    BeginUpdatingGridCells;
    try

      if (SheetData.ColCount > 1) then SheetData.FixedCols := 1; //it is deleted when we set the width to 1.
      if (SheetData.RowCount > 1) then SheetData.FixedRows := 1;

      for r := 1 to Xls.RowCount do
      begin
        //Instead of looping in all the columns, we will just loop in the ones that have data. This is much faster.
        for cIndex := 1 to Xls.ColCountInRow(r) do
        begin
          c := Xls.ColFromIndex(r, cIndex); //The real column.
          if Formatted then
          begin
            SheetData.Cells[c, r] := Xls.GetStringFromCell(r, c);
          end
          else
          begin
            v := Xls.GetCellValue(r, c);
            SheetData.Cells[c, r] := v.ToString;
          end;
        end;
      end;

      ResizeGrid;
      SelectedCell(1,1);
    finally
      EndUpdatingGridCells;
    end;
  finally
    EndUpdatingGrid;
  end;

end;

procedure TFReadingFiles.ResizeGrid;
var
  r,c: integer;
begin
  BeginUpdatingGrid;
  try
    BeginUpdatingGridCells;
    try
      if Xls = nil then
      begin
        SheetData.DefaultColWidth := Round(64.0 * Font.PixelsPerInch / 96.0);
        SheetData.DefaultRowHeight := Round(18.0 * Font.PixelsPerInch / 96.0);
        exit;
      end;
      if (Tabs.TabIndex + 1 <= Xls.SheetCount) and (Tabs.TabIndex >= 0) then Xls.ActiveSheet := Tabs.TabIndex + 1 else Xls.ActiveSheet := 1;

      SheetData.RowHeights[0] := Round(20 * Font.PixelsPerInch / 96.0);
      SheetData.ColWidths[0] := Round(50 * Font.PixelsPerInch / 96.0);

      //Fill the row headers
      for r := 1 to SheetData.RowCount - 1 do
      begin
        SheetData.Cells[0, r] := IntToStr(r);
        SheetData.RowHeights[r] := Round(Xls.GetRowHeight(r) / TExcelMetrics.RowMultDisplay(Xls) * Font.PixelsPerInch / 96.0);
      end;

      //Fill the column headers
      for c := 1 to SheetData.ColCount - 1 do
      begin
        SheetData.Cells[c, 0] := TCellAddress.EncodeColumn(c);
        SheetData.ColWidths[c] := Round(Xls.GetColWidth(c) / TExcelMetrics.ColMult(Xls) * Font.PixelsPerInch / 96.0);
      end;
    finally
      EndUpdatingGridCells;
    end;
  finally
    EndUpdatingGrid;
  end;
end;


procedure TFReadingFiles.SelectedCell(const aCol, aRow: integer);
var
  Fmt: TFlxFormat;
begin
  if  Xls = nil then exit;
  if (aRow < 1) or (aCol < 1) then exit;

  Fmt := Xls.GetCellVisibleFormatDef(aRow, aCol);
  FmtBox.Text := Fmt.Format;
end;


procedure TFReadingFiles.AnalizeFile(const Row, Col: integer);
var
  v: TCellValue;
  Fmla: TFormula;
begin
  if (Xls = nil) then
  begin
    ShowMessage('You need to open a file first');
    exit;
  end;

  if (Row < 1) or (Col < 1) or (Row > SheetData.RowCount - 1) or (Col > SheetData.ColCount - 1) then
  begin
    ShowMessage('The selected cell is not valid.');
    exit;
  end;


  ShowMessage(('Active sheet is "' + xls.SheetName) + '"');
  v := xls.GetCellValue(Row, Col);

  //First see if it is a formula
  if v.IsFormula then
  begin
    Fmla := v.AsFormula;
    ShowMessage('Cell ' + TCellAddress.Create(Row, Col).CellRef + ' contains the Formula: ' + Fmla.Text + #10 +
                'The result of the formula is ' + FormatValue(Fmla.FormulaResult, Row, Col));
    exit;
  end;

  ShowMessage('Cell ' + TCellAddress.Create(Row, Col).CellRef + ' is ' + FormatValue(v, Row, Col));
end;

function TFReadingFiles.FormatValue(const v: TCellValue; const Row, Col: integer): String;
var
  CellValue: String;
  Formatted: string;
  HasDate, HasTime: boolean;
  CellColor: TUIColor;
begin

  case v.ValueType of
  TCellValueType.Empty: exit('empty');
  TCellValueType.Boolean: exit('a boolean: ' + BoolToStr(v.AsBoolean, true));
  TCellValueType.Error: exit('an error: ' + TFormulaMessages.ErrString(v.AsError));

  TCellValueType.Number:
    begin  //Remember, dates are doubles with date format. Also, all numbers are returned as doubles, even if they are integers.
      CellColor := TUIColor.Empty;
      CellValue := TFlxNumberFormat.FormatValue(v, xls.GetCellVisibleFormatDef(Row, Col).Format, CellColor, xls, HasDate, HasTime).ToString;
      if HasDate or HasTime then
      begin
        Result := 'a DateTime value: ' + DateTimeToStr(v.ToDateTime(xls.OptionsDates1904)) + #10 + 'The value is displayed as: ' + CellValue;
      end
      else
      begin
        Result := 'a double: ' + FloatToStr(v.AsNumber) + #10 + 'The value is displayed as: ' + CellValue + #10;
      end;
      exit;
    end;

  TCellValueType.DateTime:  //FlexCel won't currently return DateTime values, as dates are numbers.
  begin
    exit('a DateTime value: ' + DateTimeToStr(v.AsDateTime));
  end;

  TCellValueType.StringValue:
    begin
      if v.AsString.RTFRunCount > 0 then Formatted := ' FORMATTED ' else Formatted := ' ';

      Result := 'a' + Formatted +'string: ' + v.AsString.ToString
      + #10 + 'In html: ' + v.AsString.ToHtml(xls, xls.GetCellVisibleFormatDef(Row, Col), THtmlVersion.Html_32, THtmlStyle.Simple, TEncoding.UTF8);
      exit;
    end;
  end;

  raise Exception.Create('Unexpected value on cell');
end;


procedure TFReadingFiles.FormCreate(Sender: TObject);
begin
  RegisterForHDPI(Self, ResizeGrid);
end;

end.
