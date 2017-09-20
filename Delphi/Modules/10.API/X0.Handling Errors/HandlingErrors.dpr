program HandlingErrors;

uses
  Forms,
  UHandlingErrors in 'UHandlingErrors.pas' {FHandlingErrors},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFHandlingErrors, FHandlingErrors);
  Application.Run;
end.
