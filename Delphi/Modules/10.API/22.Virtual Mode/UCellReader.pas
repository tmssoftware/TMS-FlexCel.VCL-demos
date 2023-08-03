unit UCellReader;

interface
uses FlexCel.Core, USheetSelect, Controls, USparseArray;

type
  //A simple cell reader that will get the values from FlexCel and put them into a grid.
  TCellReader = class
  private
    Only50Rows: boolean;
    FormatValues: boolean;
    SheetData: TSparseCellArray;
    SheetToRead: integer;
  public
    StartSheetSelect, EndSheetSelect: TDateTime;
    constructor Create(const aOnly50Rows: boolean; const aSheetData: TSparseCellArray; const aFormatValues: boolean);
    procedure OnStartReading(const sender: TObject; const e: TVirtualCellStartReadingEventArgs);
    procedure OnCellRead(const sender: TObject; const e: TVirtualCellReadEventArgs);
  end;
implementation
uses SysUtils;
{ TCellReader }

constructor TCellReader.Create(const aOnly50Rows: boolean;
  const aSheetData: TSparseCellArray; const aFormatValues: boolean);
begin
  Only50Rows := aOnly50Rows;
  SheetData := aSheetData;
  FormatValues := aFormatValues;
end;

procedure TCellReader.OnCellRead(const sender: TObject;
  const e: TVirtualCellReadEventArgs);
var
  Clr: TUIColor;
begin
  if Only50Rows and (e.Cell.Row > 50) then
  begin
    e.NextSheet := ''; //Stop reading all sheets.
    exit;
  end;

  if e.Cell.Sheet <> SheetToRead then
  begin
    e.NextSheet := ''; //Stop reading all sheets.
    exit;
  end;

  if FormatValues then
  begin
    SheetData.AddValue(e.Cell.Row, e.Cell.Col,
       TFlxNumberFormat.FormatValue(e.Cell.Value,
       TExcelFile(Sender).GetFormat(e.Cell.XF).Format, Clr, TExcelFile(Sender)));
  end
  else
  begin
    SheetData.AddValue(e.Cell.Row, e.Cell.Col, e.Cell.Value.ToString);
  end;
end;

procedure TCellReader.OnStartReading(const sender: TObject;
  const e: TVirtualCellStartReadingEventArgs);
var
  SheetSelector: TFSheetSelect;
begin
  StartSheetSelect := now;
  SheetSelector := TFSheetSelect.Create(e.SheetNames);
  try
    if SheetSelector.ShowModal <> mrOk then
    begin
      EndSheetSelect := now;
      e.NextSheet := ''; //stop reading
      exit;
    end;
    EndSheetSelect := now;
    e.NextSheet := SheetSelector.SelectedSheet;
    SheetToRead := SheetSelector.SelectedSheetIndex + 1;
  finally
    SheetSelector.Free;
  end;
end;

end.
