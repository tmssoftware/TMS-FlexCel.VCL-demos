program FeaturesPage;

uses
  Forms,
  UMainForm in 'UMainForm.pas' {MainForm},
  UFeaturesData in 'UFeaturesData.pas' {FeaturesDataModule: TDataModule},
  UImagesImpl in 'UImagesImpl.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFeaturesDataModule, FeaturesDataModule);
  Application.Run;
end.
