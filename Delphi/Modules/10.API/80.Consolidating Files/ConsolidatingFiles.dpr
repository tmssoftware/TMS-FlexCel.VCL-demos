program ConsolidatingFiles;

uses
  Forms,
  UConsolidatingFiles in 'UConsolidatingFiles.pas' {FConsolidatingFiles};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFConsolidatingFiles, FConsolidatingFiles);
  Application.Run;
end.
