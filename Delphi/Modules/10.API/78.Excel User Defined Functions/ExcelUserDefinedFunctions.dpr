program ExcelUserDefinedFunctions;

uses
  Forms,
  UExcelUserDefinedFunctions in 'UExcelUserDefinedFunctions.pas' {FExcelUserDefinedFunctions},
  UPaths in '..\..\..\Shared\UPaths.pas',
  UUserFunctions in 'UUserFunctions.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFExcelUserDefinedFunctions, FExcelUserDefinedFunctions);
  Application.Run;
end.
