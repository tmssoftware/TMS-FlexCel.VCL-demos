program RenderObjects;

uses
  Forms,
  URenderObjects in 'URenderObjects.pas' {FRenderObjects},
  UPaths in '..\..\..\Shared\UPaths.pas',
  UFlexCelHDPI in '..\..\..\Shared\UFlexCelHDPI.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFRenderObjects, FRenderObjects);
  Application.Run;
end.
