program ValidateRecalc;

uses
  Forms,
  UValidateRecalc in 'UValidateRecalc.pas' {FValidateRecalc},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFValidateRecalc, FValidateRecalc);
  Application.Run;
end.
