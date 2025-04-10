program MainDemo;

uses
  Forms,
  UMainDemo in 'UMainDemo.pas' {MainDemoForm},
  UAbout in 'UAbout.pas' {AboutForm},
  USearchEngine in 'USearchEngine.pas',
  UPaths in 'Shared\UPaths.pas',
  UProgressDialog in 'UProgressDialog.pas' {ProgressDialog},
  UCompileProgress in 'UCompileProgress.pas' {FCompiler},
  UFlexCelHDPI in 'Shared\UFlexCelHDPI.pas',
  URichEdit50 in 'URichEdit50.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'FlexCel for VCL and FireMonkey main demo';
  Application.CreateForm(TMainDemoForm, MainDemoForm);
  Application.Run;
end.
