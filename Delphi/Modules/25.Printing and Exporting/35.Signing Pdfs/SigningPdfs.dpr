program SigningPdfs;

uses
  Forms,
  USigningPdfs in 'USigningPdfs.pas' {FSigningPdfs},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFSigningPdfs, FSigningPdfs);
  Application.Run;
end.
