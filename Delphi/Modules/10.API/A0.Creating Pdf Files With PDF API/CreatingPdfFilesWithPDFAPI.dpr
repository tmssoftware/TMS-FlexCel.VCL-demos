program CreatingPdfFilesWithPDFAPI;

uses
  Forms,
  UPDFAPI in 'UPDFAPI.pas' {FPDFAPI},
  UPaths in '..\..\..\Shared\UPaths.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPDFAPI, FPDFAPI);
  Application.Run;
end.
