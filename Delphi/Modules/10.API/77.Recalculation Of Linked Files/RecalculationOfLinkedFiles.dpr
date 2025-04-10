program RecalculationOfLinkedFiles;

uses
  Forms,
  URecalculationOfLinkedFiles in 'URecalculationOfLinkedFiles.pas' {FRecalculationOfLinkedFiles};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRecalculationOfLinkedFiles, FRecalculationOfLinkedFiles);
  Application.Run;
end.
