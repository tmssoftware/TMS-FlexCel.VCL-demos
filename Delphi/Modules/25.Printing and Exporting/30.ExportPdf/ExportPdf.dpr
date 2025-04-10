program ExportPdf;

uses
  Forms,
  UExportPdf in 'UExportPdf.pas' {FExportPdf},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFExportPdf, FExportPdf);
  Application.Run;
end.
