program CustomPreview;

uses
  Forms,
  UCustomPreview in 'UCustomPreview.pas' {FCustomPreview},
  UProgressThread in 'UProgressThread.pas',
  UPdfExporting in 'UPdfExporting.pas',
  UPrinting in 'UPrinting.pas',
  UPasswordDialog in 'UPasswordDialog.pas',
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFCustomPreview, FCustomPreview);
  Application.Run;
end.
