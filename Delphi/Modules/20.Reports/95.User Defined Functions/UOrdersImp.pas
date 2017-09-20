unit UOrdersImp;

interface
uses DB, FlexCel.Core, FlexCel.Report, Generics.Collections;

type
  TOrdersImp = class(TFlexCelUserFunction)
  private
    Orders: TDictionary<Int64, integer>;
    function GetKey(const Employee, Shipper: integer): Int64;
  public
    constructor Create(const aOrders: TDataSet);
    destructor Destroy; override;
    function Evaluate(const parameters: TFormulaValueArray): TReportValue; override;
  end;

implementation
uses SysUtils;

{ TOrdersImp }

constructor TOrdersImp.Create(const aOrders: TDataSet);
var
  key: Int64;
  count: integer;
begin
  Orders := TDictionary<Int64, integer>.Create;

  aOrders.Open;
  try
    aOrders.First;
    while not aOrders.Eof do
    begin
      key := GetKey(aOrders['EmployeeId'], aOrders['ShipVia']);
      if Orders.TryGetValue(Key, count) then
      begin
        Orders[Key] := count + 1;
      end
      else
      begin
        Orders.Add(Key, 1);
      end;

      aOrders.Next;
    end;
  finally
    aOrders.Close;
  end;
end;

destructor TOrdersImp.Destroy;
begin
  Orders.Free;
  inherited;
end;

function TOrdersImp.Evaluate(
  const parameters: TFormulaValueArray): TReportValue;
var
  Employee, ShipVia: Integer;
  Ri: Integer;
  i: Integer;
begin
  if Length(Parameters) <> 2 then raise Exception.Create('Bad parameter count in call to Orders() user-defined function.');
  for i := 0 to High(Parameters) do
  begin
    if not Parameters[i].IsNumber then exit(TReportValue.Empty); //might be null
  end;

  Employee := Round(Parameters[0].AsNumber);
  ShipVia := Round(Parameters[1].AsNumber);
  if not Orders.TryGetValue(GetKey(Employee, ShipVia), Ri) then exit(TReportValue.Empty);
  Result := Ri;
end;

function TOrdersImp.GetKey(const Employee, Shipper: integer): Int64;
begin
  //For simplicity, we'll just keep the key in an int64 with the employee in the high int32 and the shipper in the low int32
  //To do this better, we should create a record with shipper and employee and define a GetHashCode.
  Result := (Int64(Employee) shl 32) or Int64(Shipper);
end;

end.
