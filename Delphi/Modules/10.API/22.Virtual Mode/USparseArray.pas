unit USparseArray;

interface
uses Generics.Collections, Generics.Defaults;

type
  TSparseCell = record
    Col: integer;
    Value: string;

    class function Create(const aCol: integer; const aValue: string): TSparseCell; static;
  end;

  TSparseRow = record
    Row: integer;
    Data: TList<TSparseCell>;

    class function Create(const aRow: integer): TSparseRow; static;
    procedure CreateData(const CellComparer: IComparer<TSparseCell>);
  end;

  TSparseRowComparer = class(TInterfacedObject, IComparer<TSparseRow>)
    function Compare(const Left, Right: TSparseRow): Integer;
  end;

  TSparseCellComparer = class(TInterfacedObject, IComparer<TSparseCell>)
    function Compare(const Left, Right: TSparseCell): Integer;
  end;

  ///	<summary>
  ///	  This is a simple class that holds cell values. Items are supposed to
  ///	  be entered in sorted order, and it isn't really production-ready, just
  ///	  to be used in a demo.
  ///	</summary>
  TSparseCellArray = class
  private
    Data: TList<TSparseRow>;
    FColCount: integer;
    RowComparer: IComparer<TSparseRow>;
    CellComparer: IComparer<TSparseCell>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddValue(const Row, Col: integer; const Value: string);
    function GetValue(const Row, Col: integer): string;

    property ColCount: integer read FColCount;
    function RowCount: integer;
  end;
implementation

{ TSparseArray }

procedure TSparseCellArray.AddValue(const Row, Col: integer; const Value: string);
var
  Idx: integer;
  SpRow: TSparseRow;
  SpCell: TSparseCell;
begin
  if Col > FColCount then FColCount := Col;
  if Data = nil then Data := TList<TSparseRow>.Create(RowComparer);
  SpRow := TSparseRow.Create(Row);
  if not Data.BinarySearch(SpRow, Idx) then
  begin
    SpRow.CreateData(CellComparer);
    Data.Insert(Idx, SpRow);
  end
  else SpRow := Data[Idx];

  SpCell := TSparseCell.Create(Col, Value);
  if not SpRow.Data.BinarySearch(SpCell, Idx) then
  begin
    SpRow.Data.Insert(Idx, SpCell);
  end else
  begin
    SpRow.Data[Idx] := SpCell;
  end;

end;

constructor TSparseCellArray.Create;
begin
  FColCount := 0;
  RowComparer := TSparseRowComparer.Create;
  CellComparer := TSparseCellComparer.Create;
end;

destructor TSparseCellArray.Destroy;
var
  i: Integer;
begin
  if (Data <> nil) then
  begin
    for i := 0 to Data.Count - 1 do Data[i].Data.Free;
    Data.Free;
  end;

  inherited;
end;

function TSparseCellArray.GetValue(const Row, Col: integer): string;
var
  Idx: integer;
  SpRow: TSparseRow;
  SpCell: TSparseCell;
begin
  if Data = nil then exit('');

  SpRow := TSparseRow.Create(Row);
  if not Data.BinarySearch(SpRow, Idx) then exit('');
  SpRow := Data[Idx];
  SpCell := TSparseCell.Create(Col, '');
  if not SpRow.Data.BinarySearch(SpCell, Idx) then exit('');
  Result := SpRow.Data[Idx].Value;
end;

function TSparseCellArray.RowCount: integer;
begin
  if (Data = nil) or (Data.Count = 0) then exit(0);
  Result := Data[Data.Count - 1].Row;

end;

{ TSparseRow }

class function TSparseRow.Create(const aRow: integer): TSparseRow;
begin
  Result.Row := aRow;
  Result.Data := nil;
end;

procedure TSparseRow.CreateData(const CellComparer: IComparer<TSparseCell>);
begin
  Data := TList<TSparseCell>.Create(CellComparer);
end;

{ TSparseCell }

class function TSparseCell.Create(const aCol: integer;
  const aValue: string): TSparseCell;
begin
  Result.Col := aCol;
  Result.Value := aValue;
end;

{ TSparseRowComparer }

function TSparseRowComparer.Compare(const Left, Right: TSparseRow): Integer;
begin
  Result := Left.Row - Right.Row;
end;

{ TSparseCellComparer }

function TSparseCellComparer.Compare(const Left, Right: TSparseCell): Integer;
begin
  Result := Left.Col - Right.Col;
end;

end.
