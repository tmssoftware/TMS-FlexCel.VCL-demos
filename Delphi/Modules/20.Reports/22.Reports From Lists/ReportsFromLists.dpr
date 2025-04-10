program ReportsFromLists;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  DataModel in 'DataModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
