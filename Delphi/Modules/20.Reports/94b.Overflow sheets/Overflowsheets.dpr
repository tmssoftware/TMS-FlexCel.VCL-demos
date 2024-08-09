program Overflowsheets;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
