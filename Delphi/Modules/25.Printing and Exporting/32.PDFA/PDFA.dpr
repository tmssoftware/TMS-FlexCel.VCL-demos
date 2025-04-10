program PDFA;

uses
  Forms,
  UPDFA in 'UPDFA.pas' {FPDFA},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPDFA, FPDFA);
  Application.Run;
end.
