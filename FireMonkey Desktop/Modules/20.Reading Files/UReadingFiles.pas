unit UReadingFiles;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.StdCtrls, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.Layouts, FMX.Grid,
  FMX.TabControl, FMX.Objects, System.Math, System.Rtti,
  {$if CompilerVersion >= 31.0}FMX.Grid.Style, {$IFEND}
  FMX.FlexCel.Core, FlexCel.XlsAdapter, FMX.Edit, FMX.Graphics;

type
  TFReadingFiles = class(TForm)
    ToolBar1: TToolBar;
    OpenDialog: TOpenDialog;
    btnOpen: TButton;
    SheetData: TGrid;
    Image1: TImage;
    btnFormatValues: TButton;
    Image2: TImage;
    btnInfo: TButton;
    Image4: TImage;
    Tabs: TTabControl;
    procedure btnInfoClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure SheetDataGetValue(Sender: TObject; const Col, Row: Integer;
      var Value: TValue);
    procedure btnFormatValuesClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SheetDataDrawColumnCell(Sender: TObject; const Canvas: TCanvas;
      const Column: TColumn; const Bounds: TRectF; const Row: Integer;
      const Value: TValue; const State: TGridDrawStates);
  private
    Xls: TExcelFile;
    procedure ClearGrid;
    procedure SetupGrid;
    procedure ImportFile(const FileName: string);
    procedure FillTabs;
    procedure SheetChanged(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReadingFiles: TFReadingFiles;

implementation

{$R *.fmx}

procedure TFReadingFiles.btnFormatValuesClick(Sender: TObject);
begin
  SheetData.Repaint; //when repainting, we will read the new value of this button.
end;

procedure TFReadingFiles.btnInfoClick(Sender: TObject);
begin
  ShowMessage('This demo shows how to read the contents of an xls file' + #10 +
      'The ''Open File'' button will load an Excel file into a dataset.'+ #10 +
      'The ''Format Values'' button will apply the format to the cells, or show the raw data.'+ #10 +
      'The ''Value in Current Cell'' button will show more information about the cell selected in the grid. Try it with formulas.');

end;

procedure TFReadingFiles.btnOpenClick(Sender: TObject);
begin
  if not OpenDialog.Execute then exit;
  ImportFile(OpenDialog.FileName);
end;

procedure TFReadingFiles.ImportFile(const FileName: string);
begin
   //Open the Excel file.
  if Xls = nil then Xls := TXlsFile.Create(false);
  xls.Open(FileName);

  FillTabs;
  SetupGrid;

  Caption := 'Reading Files: ' + ExtractFileName(FileName);
end;

procedure TFReadingFiles.SheetChanged(Sender: TObject);
begin
  Xls.ActiveSheet := (Sender as TComponent).Tag;
  SetupGrid;
end;

procedure TFReadingFiles.SheetDataDrawColumnCell(Sender: TObject;
  const Canvas: TCanvas; const Column: TColumn; const Bounds: TRectF;
  const Row: Integer; const Value: TValue; const State: TGridDrawStates);
var
  fmt: TFlxFormat;
  FillBrush: TBrush;
  BoundsExt: TRectF;
begin
   //Here we will show how to do colors
   if Xls = nil then exit;
   BoundsExt := Bounds;
   BoundsExt.Inflate(4, 4);
   fmt := Xls.GetCellVisibleFormatDef(Row + 1, Column.Index + 1);

   if (fmt.FillPattern.Pattern = TFlxPatternStyle.Solid) then
   begin
      FillBrush := TBrush.Create(TBrushKind.Solid, fmt.FillPattern.FgColor.ToColor(xls));
      try
        Canvas.FillRect(BoundsExt, 0, 0, [], 1, FillBrush);
      finally
        FillBrush.Free;
      end;
      Canvas.Font.Size := fmt.Font.Size20 / 20.0 * 96.0/ 72.0;  //Firemonkey's Font.size is smaller than in VCL. So we multiply by 96/72.
      Canvas.Font.Family := fmt.Font.Name;
      //You could assign the font style here too.

      Canvas.Fill.Color := fmt.Font.Color.ToColor(xls);
      Canvas.FillText(Bounds, Xls.GetStringFromCell(Row + 1, Column.Index + 1).ToString,
         fmt.WrapText, 1, [], TTextAlign.Leading);
   end;
end;

procedure TFReadingFiles.SheetDataGetValue(Sender: TObject; const Col,
  Row: Integer; var Value: TValue);
begin
  if Xls = nil then
  begin
    Value := '';
    exit;
  end;

  if btnFormatValues.IsPressed then
  begin
    value := Xls.GetStringFromCell(Row + 1, Col + 1).ToString;
  end
  else
  begin
    value := Xls.GetCellValue(Row + 1, Col + 1);
  end;
end;

procedure TFReadingFiles.FillTabs;
var
  s, i: integer;
  btn: TTabItem;
begin
  for i := Tabs.TabCount - 1 downto 0 do Tabs.Tabs[i].Free;

  for s := 1 to Xls.SheetCount do
  begin
    btn := TTabItem.Create(Tabs);
    btn.Text := Xls.GetSheetName(s);
    btn.Tag := s;

    btn.OnClick := SheetChanged;
    Tabs.AddObject(btn);
  end;
end;


procedure TFReadingFiles.FormDestroy(Sender: TObject);
begin
  Xls.Free;
end;

procedure TFReadingFiles.ClearGrid;
var
  i: integer;
begin
  SheetData.RowCount := 0;
  for i := SheetData.ColumnCount - 1 downto 0 do SheetData.Columns[i].Free;

end;

procedure TFReadingFiles.SetupGrid;
var
  ColCount: integer;
  Column: TColumn;
  c: Integer;
begin
  SheetData.BeginUpdate;
  try
    ClearGrid;

    SheetData.RowCount := Xls.RowCount;
    ColCount := Xls.ColCount; // NOTE THAT COLCOUNT IS SLOW. We use it here because we really need it. See the Performance.pdf doc.
    //Create the columns
    for c := 1 to ColCount do
    begin
      Column := TColumn.Create(SheetData);
      Column.Width := Xls.GetColWidth(c) / TExcelMetrics.ColMult(Xls);
      Column.Header := TCellAddress.EncodeColumn(c);
      Column.Parent := SheetData;
    end;
  finally
    SheetData.EndUpdate;
  end;

  SheetData.Repaint;
end;

end.
