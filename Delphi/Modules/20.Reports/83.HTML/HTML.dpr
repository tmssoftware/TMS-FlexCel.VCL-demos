program HTML;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  DemoData in '..\SharedData\DemoData.pas' {DemoTables: TDataModule},
  DataModel in 'DataModel.pas',
  TripSearchResponse in 'TripSearchResponse.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDemoTables, DemoTables);
  Application.Run;
end.
