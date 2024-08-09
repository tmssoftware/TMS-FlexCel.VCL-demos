program ConsolidatingFiles;

uses
  Forms,
  UConsolidatingFiles in 'UConsolidatingFiles.pas' {FConsolidatingFiles};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFConsolidatingFiles, FConsolidatingFiles);
  Application.Run;
end.
