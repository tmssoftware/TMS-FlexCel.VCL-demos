program ExportHTML;

uses
  Forms,
  UExportHTML in 'UExportHTML.pas' {FExportHTML},
  UMailDialog in 'UMailDialog.pas' {MailDialog},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFExportHTML, FExportHTML);
  Application.CreateForm(TMailDialog, MailDialog);
  Application.Run;
end.
