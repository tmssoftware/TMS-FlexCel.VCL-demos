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
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TEnterSQL, EnterSQL);
  Application.Run;
end.
