unit UVirtualMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, StdCtrls,
  Tabs, Grids,ExtCtrls, ComCtrls, ToolWin, UPaths,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, UCellReader, USparseArray;

type
  TFVirtualMode = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    SheetData: TDrawGrid;
    Panel2: TPanel;
    Actions: TActionList;
    ActionOpen: TAction;
    ActionInfo: TAction;
    ActionClose: TAction;
    OpenDialog: TOpenDialog;
    ToolbarImages: TImageList;
    cbFirst50Rows: TCheckBox;
    cbIgnoreFormulaText: TCheckBox;
    cbFormatValues: TCheckBox;
    ToolbarImages_100Scale: TImageList;
    ToolbarImages_300Scale: TImageList;
    Panel1: TPanel;
    StatusBar: TStatusBar;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionInfoExecute(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure SheetDataDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    CellData: TSparseCellArray; //For this demo we will store the data here, in your application you should use the data as you wish, send it to a db, etc.
    procedure ResizeGrid;
    procedure ImportFile(const FileName: string);
    function GetCellValue(const aCol, aRow: integer): string;
  public
    destructor Destroy; override;
  end;

var
  FVirtualMode: TFVirtualMode;

implementation
uses UFlexCelHDPI;

{$R *.dfm}

procedure TFVirtualMode.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFVirtualMode.ActionInfoExecute(Sender: TObject);
begin
  ShowMessage('This demo shows how to read the contents of an xls file without loading the file in memory.' + #10 +
      'We will first load the sheet names in the file, then open just a single sheet, and read all or just the 50 first rows of it.')

end;

procedure TFVirtualMode.ActionOpenExecute(Sender: TObject);
begin
  if not OpenDialog.Execute then exit;
  ImportFile(OpenDialog.FileName);
end;

destructor TFVirtualMode.Destroy;
begin
  CellData.Free;
  inherited;
end;

procedure TFVirtualMode.FormCreate(Sender: TObject);
begin
  RegisterForHDPI(Self, ResizeGrid);
end;

procedure TFVirtualMode.ImportFile(const FileName: string);
var
  StartOpen: TDateTime;
  EndOpen: TDateTime;
  StartSheetSelect, EndSheetSelect: TDateTime;
  Xls: TExcelFile;
  CellReader: TCellReader;
begin
   //Open the Excel file.
  Xls := TXlsFile.Create(false);
  try
    FreeAndNil(CellData);
    CellData := TSparseCellArray.Create;
    StartOpen := Now;

    //By default, FlexCel returns the formula text for the formulas, besides its calculated value.
    //If you are not interested in formula texts, you can gain a little performance by ignoring it.
    //This also works in non virtual mode.
    xls.IgnoreFormulaText := cbIgnoreFormulaText.Checked;

    xls.VirtualMode := true;
    CellReader := TCellReader.Create(cbFirst50Rows.Checked, CellData, cbFormatValues.Checked);
    try
      xls.VirtualCellStartReading := CellReader.OnStartReading;
      xls.VirtualCellRead := CellReader.OnCellRead;

      xls.Open(FileName);
      StartSheetSelect := CellReader.StartSheetSelect;
      EndSheetSelect := CellReader.EndSheetSelect;
    finally
      CellReader.Free;
    end;
    EndOpen := Now;
  finally
    Xls.Free;
  end;

  if CellData <> nil then
  begin
    SheetData.ColCount := CellData.ColCount + 1;
    SheetData.RowCount := CellData.RowCount + 1;
  end
  else
  begin
    SheetData.ColCount := 1;
    SheetData.RowCount := 1;
  end;
  if (SheetData.ColCount > 1) and (SheetData.RowCount > 1) then
  begin
    SheetData.FixedRows := 1;
    SheetData.FixedCols := 1;
  end;
  StatusBar.SimpleText := 'Time to open file: ' + ElapsedTime(StartSheetSelect, StartOpen) +
                          '     Time to load file and fill grid: '
                          +  ElapsedTime(EndOpen, EndSheetSelect);
  Caption := 'Reading Files: ' + ExtractFileName(FileName);
  SheetData.Invalidate;
end;

procedure TFVirtualMode.ResizeGrid;
begin
  SheetData.DefaultColWidth := Round(64.0 * Font.PixelsPerInch / 96.0);
  SheetData.DefaultRowHeight := Round(18.0 * Font.PixelsPerInch / 96.0);
end;

procedure TFVirtualMode.SheetDataDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  SheetData.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, GetCellValue(ACol, ARow));
end;

function TFVirtualMode.GetCellValue(const aCol, aRow: integer): string;
begin
if ACol = 0 then
  begin
    if ARow = 0 then exit('');
    exit (IntToStr(aRow));
  end;
  if ARow = 0 then exit(TCellAddress.EncodeColumn(aCol));
  if CellData = nil then exit('');
  exit(CellData.GetValue(ARow, aCol));
end;

end.
