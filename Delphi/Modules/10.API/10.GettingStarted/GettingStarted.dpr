program GettingStarted;



uses
  Forms,
  UGettingStarted in 'UGettingStarted.pas' {FGettingStarted},
  UPaths in '..\..\..\Shared\UPaths.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFGettingStarted, FGettingStarted);
  Application.Run;
end.
