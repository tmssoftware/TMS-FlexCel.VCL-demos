program ExcelUserDefinedFunctions;

uses
  Forms,
  UExcelUserDefinedFunctions in 'UExcelUserDefinedFunctions.pas' {FExcelUserDefinedFunctions},
  UPaths in '..\..\..\Shared\UPaths.pas',
  UUserFunctions in 'UUserFunctions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFExcelUserDefinedFunctions, FExcelUserDefinedFunctions);
  Application.Run;
end.
