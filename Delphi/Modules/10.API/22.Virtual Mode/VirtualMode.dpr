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
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFVirtualMode, FVirtualMode);
  Application.Run;
end.
