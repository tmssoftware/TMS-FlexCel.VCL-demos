program IntelligentPageBreaksInReports;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  DemoCustomers in '..\SharedData\DemoCustomers.pas' {DemoTables: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDemoTables, DemoTables);
  Application.Run;
end.
