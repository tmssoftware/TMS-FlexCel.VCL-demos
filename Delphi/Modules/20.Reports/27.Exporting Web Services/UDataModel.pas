unit UDataModel;

interface
uses SysUtils, Generics.Collections;

type

  TWeather = class
    private
      FDay: TDateTime;
      FLow: double;
      FHigh: double;
      FIcon: TBytes;

    public
      property Day: TDateTime read FDay;
      property Low: double read FLow;
      property High: double read FHigh;
      property Icon: TBytes read FIcon;

      constructor Create(const aDay: TDateTime; const aLow, aHigh: double; const aIcon: TBytes);
  end;

  TWeatherList = class(TObjectList<TWeather>)
  end;


implementation

{ TWeather }

constructor TWeather.Create(const aDay: TDateTime; const aLow, aHigh: double;
  const aIcon: TBytes);
begin
  FDay := aDay;
  FLow := aLow;
  FHigh := aHigh;
  FIcon := aIcon;
end;

end.
