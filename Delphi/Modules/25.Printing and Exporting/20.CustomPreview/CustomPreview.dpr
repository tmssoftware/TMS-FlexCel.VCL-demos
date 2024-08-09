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
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFCustomPreview, FCustomPreview);
  Application.Run;
end.
