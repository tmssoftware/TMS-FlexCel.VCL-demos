unit UZipCodeImp;
interface
uses SysUtils, FlexCel.Core, FlexCel.Report;

type

  TZipCodeImp = class (TFlexCelUserFormat)
  public
    function Evaluate(const workbook: TExcelFile; const rangeToFormat: TXlsCellRange; const parameters: TFormulaValueArray): TFlxPartialFormat; override;
  end;


implementation
{ TZipCodeImp }

function TZipCodeImp.Evaluate(const workbook: TExcelFile; const rangeToFormat: TXlsCellRange; const parameters: TFormulaValueArray): TFlxPartialFormat;
var
  color: double;
  fmt: TFlxFormat;
  apply: TFlxApplyFormat;
begin
  if (Length(parameters) <> 1) then
    raise Exception.Create('Bad parameter count in call to ZipCode() user-defined format');
  
  //If the zip code is not valid, don't modify the format.
  if parameters[0].IsEmpty or not (parameters[0].TryToDouble(color)) then
    exit(TFlxPartialFormat.Create(TFlxFormat.Null, TFlxApplyFormat.Create, false));

   //This code is not supposed to make sense. We will convert the zip code to a color based in the numeric value.
  fmt := workbook.GetDefaultFormat;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  fmt.FillPattern.FgColor := TExcelColor.FromArgb(Round(color));
  fmt.FillPattern.BgColor := TExcelColor.Automatic;
  fmt.Font.Color := TExcelColor.FromArgb(not Round(color));
  apply := TFlxApplyFormat.Create;
  apply.FillPattern.SetAllMembers(true);
  apply.Font.Color := true;
  Result := TFlxPartialFormat.Create(fmt, apply, false);
end;

end.
