program IntelligentPageBreaks;

uses
  Forms,
  UIntelligentPageBreaks in 'UIntelligentPageBreaks.pas' {FIntelligentPageBreaks},
  UPaths in '..\..\..\Shared\UPaths.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFIntelligentPageBreaks, FIntelligentPageBreaks);
  Application.Run;
end.
