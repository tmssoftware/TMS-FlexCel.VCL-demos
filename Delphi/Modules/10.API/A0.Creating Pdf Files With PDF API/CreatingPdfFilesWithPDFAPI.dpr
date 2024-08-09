program CreatingPdfFilesWithPDFAPI;

uses
  Forms,
  UPDFAPI in 'UPDFAPI.pas' {FPDFAPI},
  UPaths in '..\..\..\Shared\UPaths.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFPDFAPI, FPDFAPI);
  Application.Run;
end.
