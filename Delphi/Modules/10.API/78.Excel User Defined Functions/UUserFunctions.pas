unit UUserFunctions;
interface
uses VCL.FlexCel.Core;
type

  /// <summary>
  /// Creates a new instance and registers the class in the FlexCel recalculating engine as "BoolChoose".
  /// </summary>
  TBoolChoose = class (TUserDefinedFunction)
  public
    constructor Create;
    /// <summary>
    /// Chooses between 2 different strings.
    /// </summary>
    /// <param name="arguments"></param>
    /// <param name="parameters">In this case we expect 3 parameters: The first is a boolean, and the other 2 strings. We will return an error otherwise.</param>
    /// <returns></returns>
    function Evaluate(const arguments: TUdfEventArgs; const parameters: TFormulaValueArray): TFormulaValue; override;
  end;

  TSumCellsWithSameColor = class (TUserDefinedFunction)
  public
    constructor Create;
    /// <summary>
    /// Returns the sum of cells in a range that have the same color as a reference cell.
    /// </summary>
    /// <param name="arguments"></param>
    /// <param name="parameters">In this case we expect 2 parameters, first the reference cell and then
    /// the range in which to sum. We will return an error otherwise.</param>
    /// <returns></returns>
    function Evaluate(const arguments: TUdfEventArgs; const parameters: TFormulaValueArray): TFormulaValue; override;
  end;

  TIsPrime = class (TUserDefinedFunction)
  public
    /// <summary>
    /// Creates a new instance and registers the class in the FlexCel recalculating engine as "IsPrime".
    /// </summary>
    constructor Create;

      /// <summary>
      /// Returns true if a number is prime.
      /// </summary>
      /// <param name="arguments"></param>
      /// <param name="parameters">In this case we expect 1 parameter with the number. We will return an error otherwise.</param>
      /// <returns></returns>
      function Evaluate(const arguments: TUdfEventArgs; const parameters: TFormulaValueArray): TFormulaValue; override;
  end;

  TLowest = class (TUserDefinedFunction)
  public
    /// <summary>
    /// Creates a new instance and registers the class in the FlexCel recalculating engine as "Lowest".
    /// </summary>
    constructor Create;

    /// <summary>
    /// Chooses the lowest element in an array.
    /// </summary>
    /// <param name="arguments"></param>
    /// <param name="parameters">In this case we expect 1 parameter that should be an array. We will return an error otherwise.</param>
    /// <returns></returns>
    function Evaluate(const arguments: TUdfEventArgs; const parameters: TFormulaValueArray): TFormulaValue; override;
  end;

implementation
constructor TBoolChoose.Create;
begin
  inherited Create('BoolChoose');
end;

function TBoolChoose.Evaluate(const arguments: TUdfEventArgs; const parameters: TFormulaValueArray): TFormulaValue;
var
  Err: TFlxFormulaErrorValue;
  ChooseFirst: Boolean;
  s1: String;
  s2: String;
begin
  if not CheckParameters(parameters, 3, Err) then
    exit(Err);

   //The first parameter should be a boolean.
  if not TryGetBoolean(arguments.Xls, parameters[0], ChooseFirst, Err) then
    exit(Err);

   //The second parameter should be a string.
  if not TryGetString(arguments.Xls, parameters[1], s1, Err) then
    exit(Err);

   //The third parameter should be a string.
  if not TryGetString(arguments.Xls, parameters[2], s2, Err) then
    exit(Err);

   //Return s1 or s2 depending on ChooseFirst
  if ChooseFirst then
    Result := s1 else
    Result := s2;
end;

{ TSumCellsWithSameColor }

constructor TSumCellsWithSameColor.Create;
begin
 inherited Create('SumCellsWithSameColor');
end;

function TSumCellsWithSameColor.Evaluate(const arguments: TUdfEventArgs;
  const parameters: TFormulaValueArray): TFormulaValue;
var
  Err: TFlxFormulaErrorValue;
  SourceCell: TXls3DRange;
  SumRange: TXls3DRange;
  fmt: TFlxFormat;
  SourceColor: Int32;
  _Result: double;
  s: Int32;
  r: Int32;
  c: Int32;
  XF: Int32;
  val: TFormulaValue;
  sumfmt: TFlxFormat;
begin
  if not CheckParameters(parameters, 2, Err) then
    exit(Err);

   //The first parameter should be a range
  if not TryGetCellRange(parameters[0], SourceCell, Err) then
    exit(Err);

   //The second parameter should be a range too.
  if not TryGetCellRange(parameters[1], SumRange, Err) then
    exit(Err);

   //Get the color in SourceCell. Note that if Source cell is a range with more than one cell,
   //we will use the first cell in the range. Also, as different colors can have the same rgb value, we will compare the actual RGB values, not the ExcelColors
  fmt := arguments.Xls.GetCellVisibleFormatDef(SourceCell.Sheet1, SourceCell.Top, SourceCell.Left);
  SourceColor := fmt.FillPattern.FgColor.ToColor(arguments.Xls).ToArgb;
  _Result := 0;
   //Loop in the sum range and sum the corresponding values.
  for s := SumRange.Sheet1 to SumRange.Sheet2 do
  begin
    for r := SumRange.Top to SumRange.Bottom do
    begin
      for c := SumRange.Left to SumRange.Right do
      begin
        XF := -1;
        val := arguments.Xls.GetCellValue(s, r, c, XF);
        if val.IsNumber then  //we will only sum numeric values.
        begin
          sumfmt := arguments.Xls.GetCellVisibleFormatDef(s, r, c);
          if sumfmt.FillPattern.FgColor.ToColor(arguments.Xls).ToArgb = SourceColor then
          begin
            _Result:= _Result + val.AsNumber;
          end;

        end;

      end;

    end;

  end;

  Result := _Result;
end;

{ IsPrime }

constructor TIsPrime.Create;
begin
  inherited Create('IsPrime');
end;

function TIsPrime.Evaluate(const arguments: TUdfEventArgs;
  const parameters: TFormulaValueArray): TFormulaValue;
var
  Err: TFlxFormulaErrorValue;
  Number: double;
  n: Int32;
  i: Int32;
begin
  if not CheckParameters(parameters, 1, Err) then
    exit(Err);

   //The parameter should be a double or a range.
  if not TryGetDouble(arguments.Xls, parameters[0], Number, Err) then
    exit(Err);

  n := Trunc(Number);  //Return true if the number is prime.
  if n = 2 then
    exit(true);

  if (n < 2) or ((n mod 2) = 0) then
    exit(false);

  begin
    i := 3;
    while i <= Sqrt(n) do
    try
      if (n mod i) = 0 then
        exit(false);

    finally
      i:= i + 2;
    end;

  end;
  Result := true;
end;

{ TLowest }

constructor TLowest.Create;
begin
  inherited Create('Lowest');
end;

function TLowest.Evaluate(const arguments: TUdfEventArgs;
  const parameters: TFormulaValueArray): TFormulaValue;
var
  Err: TFlxFormulaErrorValue;
  SourceArray: TFormulaValueArray2;
  sa: TSingleFormulaValueArray;
  _Result: double;
  First: Boolean;
  o: TFormulaValue;
begin
  if not CheckParameters(parameters, 1, Err) then
    exit(Err);

   //The first parameter should be an array.
  if not TryGetArray(arguments.Xls, parameters[0], SourceArray, Err) then
    exit(Err);

  _Result := 0;
  First := true;
  for sa in SourceArray do
  begin
    for o in sa do
    begin
      if o.IsNumber then
      begin
        if First then
        begin
          First := false;
          _Result := o.AsNumber;
        end else
        begin
          if o.AsNumber < _Result then
            _Result := o.AsNumber;

        end;

      end else
        exit(TFlxFormulaErrorValue.ErrValue);

    end;
  end;
  Result := _Result;
end;

end.
