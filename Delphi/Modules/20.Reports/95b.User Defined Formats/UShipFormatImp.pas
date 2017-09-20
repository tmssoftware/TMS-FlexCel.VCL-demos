unit UShipFormatImp;
interface
uses SysUtils, StrUtils, FlexCel.Core, FlexCel.Report;

type

  TShipFormatImp = class (TFlexCelUserFormat)
  public
    function Evaluate(const workbook: TExcelFile; const rangeToFormat: TXlsCellRange; const parameters: TFormulaValueArray): TFlxPartialFormat; override;
  end;


implementation
{ TShipFormatImp }

function TShipFormatImp.Evaluate(const workbook: TExcelFile; const rangeToFormat: TXlsCellRange; const parameters: TFormulaValueArray): TFlxPartialFormat;
var
  len: Int32;
  country: String;
  color: Int32;
  fmt: TFlxFormat;
  apply: TFlxApplyFormat;
begin
   //Again, this example is not supposed to make sense, only to show how you can code a complex rule.
   //This method will format the rows with a color that depends in the length of the first parameter,
   //and if the second parameter starts with "B" it will make the text red.
  if (Length(parameters) <> 2) then
    raise Exception.Create('Bad parameter count in call to ShipFormat() user-defined format');
  
  len := Length(parameters[0].ToString);
  country := parameters[1].ToString;
  color := $FFFFFF - (len * 100);
  fmt := workbook.GetDefaultFormat;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromArgb(color);
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  apply := TFlxApplyFormat.Create;
  apply.FillPattern.SetAllMembers(true);
  if StartsText('B', country) then
  begin
    fmt.Font.Color := Colors.OrangeRed;
    apply.Font.Color := true;
  end;
  
  Result := TFlxPartialFormat.Create(fmt, apply, false);
end;

end.
