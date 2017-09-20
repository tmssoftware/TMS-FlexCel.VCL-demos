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
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
