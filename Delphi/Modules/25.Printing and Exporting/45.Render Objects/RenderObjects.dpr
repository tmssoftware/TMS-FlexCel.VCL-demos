program RenderObjects;

uses
  Forms,
  URenderObjects in 'URenderObjects.pas' {FRenderObjects},
  UPaths in '..\..\..\Shared\UPaths.pas',
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRenderObjects, FRenderObjects);
  Application.Run;
end.
