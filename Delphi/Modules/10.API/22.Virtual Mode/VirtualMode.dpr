program VirtualMode;

uses
  Forms,
  UVirtualMode in 'UVirtualMode.pas' {FVirtualMode},
  UPaths in '..\..\..\Shared\UPaths.pas',
  UCellReader in 'UCellReader.pas',
  USheetSelect in 'USheetSelect.pas' {FSheetSelect},
  USparseArray in 'USparseArray.pas',
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFVirtualMode, FVirtualMode);
  Application.Run;
end.
