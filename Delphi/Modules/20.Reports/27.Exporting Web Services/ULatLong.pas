unit ULatLong;

interface
type
  TLatLong = record
    public
    Latitude,
    Longitude: Currency;

    constructor Create(const aLatitude, aLongitude: Currency);

  end;
implementation

{ LatLong }

constructor TLatLong.Create(const aLatitude, aLongitude: Currency);
begin
  Latitude := aLatitude;
  Longitude := aLongitude;
end;

end.
