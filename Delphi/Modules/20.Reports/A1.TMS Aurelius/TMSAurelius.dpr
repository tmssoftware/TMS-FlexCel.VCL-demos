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
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
