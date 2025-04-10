program GenericReports2;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  USQLDialog in 'USQLDialog.pas' {EnterSQL},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas',
  UDataTypeImp in 'UDataTypeImp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TEnterSQL, EnterSQL);
  Application.Run;
end.
