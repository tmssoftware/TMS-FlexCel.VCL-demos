program AdvancedReportsFromLists;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  DataModel in 'DataModel.pas',
  UDataReader in 'UDataReader.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
