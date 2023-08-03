unit UExcelUserDefinedFunctions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter,
  {$IFDEF FPC} LResources,{$ENDIF}
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellAPI;

type
  TFExcelUserDefinedFunctions = class(TForm)
    Memo1: TMemo;
    btnGo: TButton;
    SaveDialog: TSaveDialog;
    procedure btnGoClick(Sender: TObject);
  private
    procedure AddData(const Xls: TExcelFile);
    procedure AutoRun;
    procedure LoadUdfs(const Xls: TExcelFile);
 end;

var
  FExcelUserDefinedFunctions: TFExcelUserDefinedFunctions;

implementation
uses IOUtils, UPaths, UUserFunctions;
{$R *.dfm}

{ TFExcelUserDefinedFunctions }

procedure TFExcelUserDefinedFunctions.btnGoClick(Sender: TObject);
begin
  AutoRun;
end;

/// <summary>
/// Loads the user defined functions into the Excel recalculating engine.
/// </summary>
/// <param name="Xls"></param>
procedure TFExcelUserDefinedFunctions.LoadUdfs(const Xls: TExcelFile);
begin
  Xls.AddUserDefinedFunction(TUserDefinedFunctionScope.Local, TUserDefinedFunctionLocation.Internal, TSumCellsWithSameColor.Create);
  Xls.AddUserDefinedFunction(TUserDefinedFunctionScope.Local, TUserDefinedFunctionLocation.Internal, TIsPrime.Create);
  Xls.AddUserDefinedFunction(TUserDefinedFunctionScope.Local, TUserDefinedFunctionLocation.Internal, TBoolChoose.Create);
  Xls.AddUserDefinedFunction(TUserDefinedFunctionScope.Local, TUserDefinedFunctionLocation.Internal, TLowest.Create);
end;

procedure TFExcelUserDefinedFunctions.AddData(const Xls: TExcelFile);
var
  Data: TXlsNamedRange;
  r: Int32;
  FmlaText: String;
  o: TCellValue;
  //pdf: TFlexCelPdfExport;
begin
  LoadUdfs(Xls);  //Register our custom functions. As we are using a local scope, we need to register them each time.
  Xls.Open(TPath.Combine(DataFolder, 'udfs.xls'));  //Open the file we want to manipulate.
   //Fill the cell range with other values so we can see how the sheet is recalculated by FlexCel.
  Data := Xls.GetNamedRange('Data', -1);
  for r := Data.Top to Data.Bottom - 1 do
  begin
    Xls.SetCellValue(r, Data.Left, r - Data.Top);
  end;

  FmlaText := '=BoolChoose(TRUE,"This formula was entered with FlexCel!","It shouldn''t display this")';  //Add an UDF to the sheet. We can enter the function "BoolChoose" here because it was registered into FlexCel in LoadUDF()
  //If it hadn't been registered, this line would raise an Exception of an unknown function.
  Xls.SetCellValue(11, 1, TFormula.Create(FmlaText));
  o := Xls.GetCellValue(11, 1);  //Verify the UDF entered is correct. We can read any udf from Excel, even if it is not registered with AddUserDefinedFunction.
  Assert(o.IsFormula, 'The cell must contain a formula');
  if o.IsFormula then
    Assert(o.AsFormula.Text = FmlaText, ((('Error in Formula: It should be "' + FmlaText) + '" and it is "') + o.AsFormula.Text) + '"');

   //Recalc the sheet. As we are not saving it yet, we ned to make a manual recalc.
  Xls.Recalc;

  {//pdf exporting is not yet implemented
   //Export the file to PDF so we can see the values calculated by FlexCel without Excel recalculating them.
  pdf := FlexCelPdfExport.Create(Xls, true);
  try
    pdf.Export(TPath.ChangeExtension(SaveDialog.FileName, 'pdf'));
  finally
    FreeObj(pdf);
  end;                                   }

   //Save the file as xls too so we can compare.
  Xls.Save(SaveDialog.FileName);
end;

procedure TFExcelUserDefinedFunctions.AutoRun;
var
  Xls: TExcelFile;
begin
  if not SaveDialog.Execute then
    exit;

  Xls := TXlsFile.Create(true);
  try
  AddData(Xls);
  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;
  finally
    Xls.Free;
  end;

end;


end.
