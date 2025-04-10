program ChartAPI;

uses
  Forms,
  UChartAPI in 'UChartAPI.pas' {FChartAPI},
  UPaths in '..\..\..\Shared\UPaths.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFChartAPI, FChartAPI);
  Application.Run;
end.
