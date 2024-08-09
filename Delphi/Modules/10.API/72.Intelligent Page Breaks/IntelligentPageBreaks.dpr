program IntelligentPageBreaks;

uses
  Forms,
  UIntelligentPageBreaks in 'UIntelligentPageBreaks.pas' {FIntelligentPageBreaks},
  UPaths in '..\..\..\Shared\UPaths.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFIntelligentPageBreaks, FIntelligentPageBreaks);
  Application.Run;
end.
