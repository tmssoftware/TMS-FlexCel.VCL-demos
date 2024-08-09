program BalancedColumns;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  DemoCustomers in '..\SharedData\DemoCustomers.pas' {DemoTables: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDemoTables, DemoTables);
  Application.Run;
end.
