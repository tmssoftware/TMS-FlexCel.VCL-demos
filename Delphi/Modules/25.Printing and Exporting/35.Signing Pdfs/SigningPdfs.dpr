program SigningPdfs;

uses
  Forms,
  USigningPdfs in 'USigningPdfs.pas' {FSigningPdfs},
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFSigningPdfs, FSigningPdfs);
  Application.Run;
end.
