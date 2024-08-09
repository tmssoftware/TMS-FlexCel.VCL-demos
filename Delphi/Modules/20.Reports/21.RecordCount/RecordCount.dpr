program RecordCount;



uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  DataSlowCount in 'DataSlowCount.pas' {TablesSlowCount: TDataModule},
  DataFlexCelCount in 'DataFlexCelCount.pas' {TablesFlexCelCount: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTablesSlowCount, TablesSlowCount);
  Application.CreateForm(TTablesFlexCelCount, TablesFlexCelCount);
  Application.Run;
end.
