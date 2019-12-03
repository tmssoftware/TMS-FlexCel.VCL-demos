unit UDataTypeImp;

interface
uses FlexCel.Core, FlexCel.Report;

type
TDataTypeImp = class(TFlexCelUserFunction)
public
  function Evaluate(const parameters: TFormulaValueArray): TReportValue; override;
end;

implementation
uses SysUtils;

{ TDataTypeImp }

function TDataTypeImp.Evaluate(
  const parameters: TFormulaValueArray): TReportValue;
begin
  if length(parameters) <> 1 then raise Exception.Create('DataType must be called with one parameter.');
  if (parameters[0].IsDateTime) then exit('datetime');
  if (parameters[0].IsNumber) then exit('double');
  Result := '';
end;

end.
