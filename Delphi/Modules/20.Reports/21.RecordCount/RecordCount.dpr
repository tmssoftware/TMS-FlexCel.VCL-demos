program RecordCount;



uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  DataSlowCount in 'DataSlowCount.pas' {TablesSlowCount: TDataModule},
  DataFlexCelCount in 'DataFlexCelCount.pas' {TablesFlexCelCount: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTablesSlowCount, TablesSlowCount);
  Application.CreateForm(TTablesFlexCelCount, TablesFlexCelCount);
  Application.Run;
end.
