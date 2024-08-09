program HandlingErrors;

uses
  Forms,
  UHandlingErrors in 'UHandlingErrors.pas' {FHandlingErrors},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFHandlingErrors, FHandlingErrors);
  Application.Run;
end.
