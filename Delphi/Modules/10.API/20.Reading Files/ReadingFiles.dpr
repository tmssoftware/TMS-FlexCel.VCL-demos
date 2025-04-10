program ReadingFiles;

uses
  Forms,
  UReadingFiles in 'UReadingFiles.pas' {FReadingFiles},
  UPaths in '..\..\..\Shared\UPaths.pas',
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFReadingFiles, FReadingFiles);
  Application.Run;
end.
