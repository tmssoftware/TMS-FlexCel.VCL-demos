program ExportingWebServices;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  ULatLong in 'ULatLong.pas',
  ndfdXML in 'ndfdXML.pas',
  UDataModel in 'UDataModel.pas',
  XMLMapping in 'XMLMapping.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
