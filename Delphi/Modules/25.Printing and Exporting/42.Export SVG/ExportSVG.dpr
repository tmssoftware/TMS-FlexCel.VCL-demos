program ExportSVG;

uses
  Forms,
  UExportSVG in 'UExportSVG.pas' {FExportSVG},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFExportSVG, FExportSVG);
  Application.Run;
end.
