program FeaturesPage;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  UFeaturesData in 'UFeaturesData.pas' {FeaturesDataModule: TDataModule},
  UImagesImpl in 'UImagesImpl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFeaturesDataModule, FeaturesDataModule);
  Application.Run;
end.
