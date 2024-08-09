program ExportSVG;

uses
  Forms,
  UExportSVG in 'UExportSVG.pas' {FExportSVG},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFExportSVG, FExportSVG);
  Application.Run;
end.
