program ValidateRecalc;

uses
  Forms,
  UValidateRecalc in 'UValidateRecalc.pas' {FValidateRecalc},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFValidateRecalc, FValidateRecalc);
  Application.Run;
end.
