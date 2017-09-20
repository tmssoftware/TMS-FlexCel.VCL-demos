// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.weather.gov/forecasts/xml/DWMLgen/wsdl/ndfdXML.wsdl
//  >Import : http://www.weather.gov/forecasts/xml/DWMLgen/wsdl/ndfdXML.wsdl>0
// Version  : 1.0
// (25/09/2014 14:06:51 - - $Rev: 45757 $)
// ************************************************************************ //

unit ndfdXML;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:date            - "http://www.w3.org/2001/XMLSchema"[]
  // !:integer         - "http://www.w3.org/2001/XMLSchema"[]
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"[]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[]
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  weatherParametersType = class;                { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblCplx] }

  {$SCOPEDENUMS ON}
  { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblSmpl] }
  displayLevelType = (_1, _2, _3, _4, _12, _34, _1234);

  { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblSmpl] }
  featureTypeType = (Forecast_Gml2Point, Forecast_Gml2AllWx, Forecast_GmlsfPoint, Forecast_GmlObs, NdfdMultiPointCoverage, Ndfd_KmlPoint);

  { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblSmpl] }
  compTypeType = (IsEqual, Between, GreaterThan, GreaterThanEqualTo, LessThan, LessThanEqualTo);

  { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblSmpl] }
  formatType = (_24_hourly, _12_hourly);

  { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblSmpl] }
  productType = (time_series, glance);

  { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblSmpl] }
  sectorType = (conus, nhemi, alaska, guam, hawaii, puertori, npacocn);

  { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblSmpl] }
  unitType = (e, m);

  {$SCOPEDENUMS OFF}



  // ************************************************************************ //
  // XML       : weatherParametersType, global, <complexType>
  // Namespace : http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd
  // ************************************************************************ //
  weatherParametersType = class(TRemotable)
  private
    Fmaxt: Boolean;
    Fmint: Boolean;
    Ftemp: Boolean;
    Fdew: Boolean;
    Fpop12: Boolean;
    Fqpf: Boolean;
    Fsky: Boolean;
    Fsnow: Boolean;
    Fwspd: Boolean;
    Fwdir: Boolean;
    Fwx: Boolean;
    Fwaveh: Boolean;
    Ficons: Boolean;
    Frh: Boolean;
    Fappt: Boolean;
    Fincw34: Boolean;
    Fincw50: Boolean;
    Fincw64: Boolean;
    Fcumw34: Boolean;
    Fcumw50: Boolean;
    Fcumw64: Boolean;
    Fcritfireo: Boolean;
    Fdryfireo: Boolean;
    Fconhazo: Boolean;
    Fptornado: Boolean;
    Fphail: Boolean;
    Fptstmwinds: Boolean;
    Fpxtornado: Boolean;
    Fpxhail: Boolean;
    Fpxtstmwinds: Boolean;
    Fptotsvrtstm: Boolean;
    Fpxtotsvrtstm: Boolean;
    Ftmpabv14d: Boolean;
    Ftmpblw14d: Boolean;
    Ftmpabv30d: Boolean;
    Ftmpblw30d: Boolean;
    Ftmpabv90d: Boolean;
    Ftmpblw90d: Boolean;
    Fprcpabv14d: Boolean;
    Fprcpblw14d: Boolean;
    Fprcpabv30d: Boolean;
    Fprcpblw30d: Boolean;
    Fprcpabv90d: Boolean;
    Fprcpblw90d: Boolean;
    Fprecipa_r: Boolean;
    Fsky_r: Boolean;
    Ftd_r: Boolean;
    Ftemp_r: Boolean;
    Fwdir_r: Boolean;
    Fwspd_r: Boolean;
    Fwwa: Boolean;
    Fwgust: Boolean;
    Ficeaccum: Boolean;
    Fmaxrh: Boolean;
    Fminrh: Boolean;
  published
    property maxt:         Boolean  read Fmaxt write Fmaxt;
    property mint:         Boolean  read Fmint write Fmint;
    property temp:         Boolean  read Ftemp write Ftemp;
    property dew:          Boolean  read Fdew write Fdew;
    property pop12:        Boolean  read Fpop12 write Fpop12;
    property qpf:          Boolean  read Fqpf write Fqpf;
    property sky:          Boolean  read Fsky write Fsky;
    property snow:         Boolean  read Fsnow write Fsnow;
    property wspd:         Boolean  read Fwspd write Fwspd;
    property wdir:         Boolean  read Fwdir write Fwdir;
    property wx:           Boolean  read Fwx write Fwx;
    property waveh:        Boolean  read Fwaveh write Fwaveh;
    property icons:        Boolean  read Ficons write Ficons;
    property rh:           Boolean  read Frh write Frh;
    property appt:         Boolean  read Fappt write Fappt;
    property incw34:       Boolean  read Fincw34 write Fincw34;
    property incw50:       Boolean  read Fincw50 write Fincw50;
    property incw64:       Boolean  read Fincw64 write Fincw64;
    property cumw34:       Boolean  read Fcumw34 write Fcumw34;
    property cumw50:       Boolean  read Fcumw50 write Fcumw50;
    property cumw64:       Boolean  read Fcumw64 write Fcumw64;
    property critfireo:    Boolean  read Fcritfireo write Fcritfireo;
    property dryfireo:     Boolean  read Fdryfireo write Fdryfireo;
    property conhazo:      Boolean  read Fconhazo write Fconhazo;
    property ptornado:     Boolean  read Fptornado write Fptornado;
    property phail:        Boolean  read Fphail write Fphail;
    property ptstmwinds:   Boolean  read Fptstmwinds write Fptstmwinds;
    property pxtornado:    Boolean  read Fpxtornado write Fpxtornado;
    property pxhail:       Boolean  read Fpxhail write Fpxhail;
    property pxtstmwinds:  Boolean  read Fpxtstmwinds write Fpxtstmwinds;
    property ptotsvrtstm:  Boolean  read Fptotsvrtstm write Fptotsvrtstm;
    property pxtotsvrtstm: Boolean  read Fpxtotsvrtstm write Fpxtotsvrtstm;
    property tmpabv14d:    Boolean  read Ftmpabv14d write Ftmpabv14d;
    property tmpblw14d:    Boolean  read Ftmpblw14d write Ftmpblw14d;
    property tmpabv30d:    Boolean  read Ftmpabv30d write Ftmpabv30d;
    property tmpblw30d:    Boolean  read Ftmpblw30d write Ftmpblw30d;
    property tmpabv90d:    Boolean  read Ftmpabv90d write Ftmpabv90d;
    property tmpblw90d:    Boolean  read Ftmpblw90d write Ftmpblw90d;
    property prcpabv14d:   Boolean  read Fprcpabv14d write Fprcpabv14d;
    property prcpblw14d:   Boolean  read Fprcpblw14d write Fprcpblw14d;
    property prcpabv30d:   Boolean  read Fprcpabv30d write Fprcpabv30d;
    property prcpblw30d:   Boolean  read Fprcpblw30d write Fprcpblw30d;
    property prcpabv90d:   Boolean  read Fprcpabv90d write Fprcpabv90d;
    property prcpblw90d:   Boolean  read Fprcpblw90d write Fprcpblw90d;
    property precipa_r:    Boolean  read Fprecipa_r write Fprecipa_r;
    property sky_r:        Boolean  read Fsky_r write Fsky_r;
    property td_r:         Boolean  read Ftd_r write Ftd_r;
    property temp_r:       Boolean  read Ftemp_r write Ftemp_r;
    property wdir_r:       Boolean  read Fwdir_r write Fwdir_r;
    property wspd_r:       Boolean  read Fwspd_r write Fwspd_r;
    property wwa:          Boolean  read Fwwa write Fwwa;
    property wgust:        Boolean  read Fwgust write Fwgust;
    property iceaccum:     Boolean  read Ficeaccum write Ficeaccum;
    property maxrh:        Boolean  read Fmaxrh write Fmaxrh;
    property minrh:        Boolean  read Fminrh write Fminrh;
  end;

  listLatLonType  = string;         { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblSmpl] }
  zipCodeListType = string;         { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblSmpl] }
  listCityNamesType = string;       { "http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd"[GblSmpl] }

  // ************************************************************************ //
  // Namespace : http://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl
  // soapAction: http://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : ndfdXMLBinding
  // service   : ndfdXML
  // port      : ndfdXMLPort
  // URL       : http://graphical.weather.gov/xml/SOAP_server/ndfdXMLserver.php
  // ************************************************************************ //
  ndfdXMLPortType = interface(IInvokable)
  ['{1E6F1B25-B6D9-BB0E-5BE9-05D3A60F2020}']
    function  NDFDgen(const latitude: TXSDecimal; const longitude: TXSDecimal; const product: productType; const startTime: TXSDateTime; const endTime: TXSDateTime; const Unit_: unitType; 
                      const weatherParameters: weatherParametersType): string; stdcall;
    function  NDFDgenByDay(const latitude: TXSDecimal; const longitude: TXSDecimal; const startDate: TXSDate; const numDays: Int64; const Unit_: unitType; const format: formatType
                           ): string; stdcall;
    function  NDFDgenLatLonList(const listLatLon: listLatLonType; const product: productType; const startTime: TXSDateTime; const endTime: TXSDateTime; const Unit_: unitType; const weatherParameters: weatherParametersType
                                ): string; stdcall;
    function  NDFDgenByDayLatLonList(const listLatLon: listLatLonType; const startDate: TXSDate; const numDays: Int64; const Unit_: unitType; const format: formatType): string; stdcall;
    function  GmlLatLonList(const listLatLon: listLatLonType; const requestedTime: TXSDateTime; const featureType: featureTypeType; const weatherParameters: weatherParametersType): string; stdcall;
    function  GmlTimeSeries(const listLatLon: listLatLonType; const startTime: TXSDateTime; const endTime: TXSDateTime; const compType: compTypeType; const featureType: featureTypeType; const propertyName: string
                            ): string; stdcall;
    function  LatLonListSubgrid(const lowerLeftLatitude: TXSDecimal; const lowerLeftLongitude: TXSDecimal; const upperRightLatitude: TXSDecimal; const upperRightLongitude: TXSDecimal; const resolution: TXSDecimal): listLatLonType; stdcall;
    function  LatLonListLine(const endPoint1Lat: TXSDecimal; const endPoint1Lon: TXSDecimal; const endPoint2Lat: TXSDecimal; const endPoint2Lon: TXSDecimal): listLatLonType; stdcall;
    function  LatLonListZipCode(const zipCodeList: zipCodeListType): listLatLonType; stdcall;
    function  LatLonListSquare(const centerPointLat: TXSDecimal; const centerPointLon: TXSDecimal; const distanceLat: TXSDecimal; const distanceLon: TXSDecimal; const resolution: TXSDecimal): listLatLonType; stdcall;
    function  CornerPoints(const sector: sectorType): listLatLonType; stdcall;
    function  LatLonListCityNames(const displayLevel: displayLevelType): listCityNamesType; stdcall;
  end;

function GetndfdXMLPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ndfdXMLPortType;


implementation
  uses SysUtils;

function GetndfdXMLPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ndfdXMLPortType;
const
  defWSDL = 'http://www.weather.gov/forecasts/xml/DWMLgen/wsdl/ndfdXML.wsdl';
  defURL  = 'http://graphical.weather.gov/xml/SOAP_server/ndfdXMLserver.php';
  defSvc  = 'ndfdXML';
  defPrt  = 'ndfdXMLPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ndfdXMLPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { ndfdXMLPortType }
  InvRegistry.RegisterInterface(TypeInfo(ndfdXMLPortType), 'http://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ndfdXMLPortType), 'http://graphical.weather.gov/xml/DWMLgen/wsdl/ndfdXML.wsdl#%operationName%');
  { ndfdXMLPortType.NDFDgen }
  InvRegistry.RegisterParamInfo(TypeInfo(ndfdXMLPortType), 'NDFDgen', 'Unit_', 'Unit', '');
  { ndfdXMLPortType.NDFDgenByDay }
  InvRegistry.RegisterParamInfo(TypeInfo(ndfdXMLPortType), 'NDFDgenByDay', 'Unit_', 'Unit', '');
  { ndfdXMLPortType.NDFDgenLatLonList }
  InvRegistry.RegisterParamInfo(TypeInfo(ndfdXMLPortType), 'NDFDgenLatLonList', 'Unit_', 'Unit', '');
  { ndfdXMLPortType.NDFDgenByDayLatLonList }
  InvRegistry.RegisterParamInfo(TypeInfo(ndfdXMLPortType), 'NDFDgenByDayLatLonList', 'Unit_', 'Unit', '');
  RemClassRegistry.RegisterXSInfo(TypeInfo(displayLevelType), 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'displayLevelType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(displayLevelType), '_1', '1');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(displayLevelType), '_2', '2');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(displayLevelType), '_3', '3');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(displayLevelType), '_4', '4');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(displayLevelType), '_12', '12');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(displayLevelType), '_34', '34');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(displayLevelType), '_1234', '1234');
  RemClassRegistry.RegisterXSInfo(TypeInfo(featureTypeType), 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'featureTypeType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(compTypeType), 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'compTypeType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(formatType), 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'formatType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(formatType), '_24_hourly', '24 hourly');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(formatType), '_12_hourly', '12 hourly');
  RemClassRegistry.RegisterXSInfo(TypeInfo(productType), 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'productType');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(productType), 'time_series', 'time-series');
  RemClassRegistry.RegisterXSInfo(TypeInfo(sectorType), 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'sectorType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(unitType), 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'unitType');
  RemClassRegistry.RegisterXSClass(weatherParametersType, 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'weatherParametersType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(listLatLonType), 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'listLatLonType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(zipCodeListType), 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'zipCodeListType');
  RemClassRegistry.RegisterXSInfo(TypeInfo(listCityNamesType), 'http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd', 'listCityNamesType');

end.