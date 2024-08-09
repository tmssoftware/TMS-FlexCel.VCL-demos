program ExportPdf;

uses
  Forms,
  UExportPdf in 'UExportPdf.pas' {FExportPdf},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFExportPdf, FExportPdf);
  Application.Run;
end.
