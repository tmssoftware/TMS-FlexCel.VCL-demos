program PDFA;

uses
  Forms,
  UPDFA in 'UPDFA.pas' {FPDFA},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFPDFA, FPDFA);
  Application.Run;
end.
