program TMSAurelius;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  DataModel in 'DataModel.pas',
  Queries in 'Queries.pas',
  AureliusFlexCelSupport in 'AureliusFlexCelSupport.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
