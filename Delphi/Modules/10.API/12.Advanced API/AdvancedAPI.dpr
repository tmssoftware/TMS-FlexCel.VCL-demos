program AdvancedAPI;

uses
  Forms,
  UAdvancedAPI in 'UAdvancedAPI.pas' {FAdvancedAPI},
  UPaths in '..\..\..\Shared\UPaths.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFAdvancedAPI, FAdvancedAPI);
  Application.Run;
end.
