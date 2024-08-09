program AdvancedAPI;

uses
  Forms,
  UAdvancedAPI in 'UAdvancedAPI.pas' {FAdvancedAPI},
  UPaths in '..\..\..\Shared\UPaths.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFAdvancedAPI, FAdvancedAPI);
  Application.Run;
end.
