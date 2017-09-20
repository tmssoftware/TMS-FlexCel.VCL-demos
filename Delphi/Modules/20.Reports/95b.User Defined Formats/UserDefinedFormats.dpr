program UserDefinedFormats;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  DemoOrders in '..\SharedData\DemoOrders.pas' {DemoTables: TDataModule},
  UShipFormatImp in 'UShipFormatImp.pas',
  UZipCodeImp in 'UZipCodeImp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDemoTables, DemoTables);
  Application.Run;
end.
