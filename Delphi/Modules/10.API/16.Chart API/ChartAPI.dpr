program ChartAPI;

uses
  Forms,
  UChartAPI in 'UChartAPI.pas' {FChartAPI},
  UPaths in '..\..\..\Shared\UPaths.pas';

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF ConditionalExpressions}{$IF CompilerVersion >= 18}Application.MainFormOnTaskbar := True;{$IFEND}{$ENDIF}
  Application.CreateForm(TFChartAPI, FChartAPI);
  Application.Run;
end.
