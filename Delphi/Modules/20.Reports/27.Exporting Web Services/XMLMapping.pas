
{*****************************************************************************************************************************}
{                                                                                                                             }
{                                                      XML Data Binding                                                       }
{                                                                                                                             }
{         Generated on: 25/09/2014 23:11:50                                                                                   }
{       Generated from: http://graphical.weather.gov/xml/DWMLgen/schema/DWML.xsd                                              }
{                                                                                                                             }
{*****************************************************************************************************************************}

unit XMLMapping;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDwml = interface;
  IXMLHeadType = interface;
  IXMLProductType = interface;
  IXMLCreationdateType = interface;
  IXMLSourceType = interface;
  IXMLProductioncenterType = interface;
  IXMLDataType = interface;
  IXMLDataTypeList = interface;
  IXMLLocationType = interface;
  IXMLLocationTypeList = interface;
  IXMLPointType = interface;
  IXMLNwszoneType = interface;
  IXMLAreaType = interface;
  IXMLCircleType = interface;
  IXMLRadiusType = interface;
  IXMLRectangleType = interface;
  IXMLCityType = interface;
  IXMLHeightType = interface;
  IXMLLevelType = interface;
  IXMLLayerType = interface;
  IXMLMoreWeatherInformationType = interface;
  IXMLMoreWeatherInformationTypeList = interface;
  IXMLTimelayoutElementType = interface;
  IXMLTimelayoutElementTypeList = interface;
  IXMLStartvalidtimeType = interface;
  IXMLStartvalidtimeTypeList = interface;
  IXMLParametersType = interface;
  IXMLParametersTypeList = interface;
  IXMLCategoriesType = interface;
  IXMLCategoriesTypeList = interface;
  IXMLValueListType = interface;
  IXMLValueListTypeList = interface;
  IXMLTemperature = interface;
  IXMLTemperatureList = interface;
  IXMLTempValType = interface;
  IXMLTempValTypeList = interface;
  IXMLValueWithUncertainty = interface;
  IXMLValueWithUncertaintyList = interface;
  IXMLUncertaintyType = interface;
  IXMLError = interface;
  IXMLPrecipitation = interface;
  IXMLPrecipitationList = interface;
  IXMLDecimalValType = interface;
  IXMLDecimalValTypeList = interface;
  IXMLProbabilityofprecipitation = interface;
  IXMLProbabilityofprecipitationList = interface;
  IXMLPercentageValType = interface;
  IXMLPercentageValTypeList = interface;
  IXMLFireweather = interface;
  IXMLFireweatherList = interface;
  IXMLConvectivehazard = interface;
  IXMLConvectivehazardList = interface;
  IXMLOutlook = interface;
  IXMLSeverecomponent = interface;
  IXMLSeverecomponentList = interface;
  IXMLValue = interface;
  IXMLValueList = interface;
  IXMLClimateanomaly = interface;
  IXMLClimateanomalyList = interface;
  IXMLAnomalyType = interface;
  IXMLAnomalyTypeList = interface;
  IXMLWindspeed = interface;
  IXMLWindspeedList = interface;
  IXMLWspdValType = interface;
  IXMLWspdValTypeList = interface;
  IXMLDirection = interface;
  IXMLDirectionList = interface;
  IXMLWdirValType = interface;
  IXMLWdirValTypeList = interface;
  IXMLCloudamount = interface;
  IXMLCloudamountList = interface;
  IXMLHumidity = interface;
  IXMLHumidityList = interface;
  IXMLWeather = interface;
  IXMLWeatherList = interface;
  IXMLWeatherconditions = interface;
  IXMLWeatherconditionsList = interface;
  IXMLConditionsicon = interface;
  IXMLConditionsiconList = interface;
  IXMLHazards = interface;
  IXMLHazardsList = interface;
  IXMLHazardconditions = interface;
  IXMLHazardconditionsList = interface;
  IXMLHazard = interface;
  IXMLWordedForecast = interface;
  IXMLPressure = interface;
  IXMLPressureList = interface;
  IXMLProbabilisticCondition = interface;
  IXMLProbabilisticConditionList = interface;
  IXMLValueForRangeType = interface;
  IXMLValueForRangeTypeList = interface;
  IXMLWaterstate = interface;
  IXMLWaterstateList = interface;
  IXMLWaves = interface;
  IXMLWavesList = interface;
  IXMLSwell = interface;
  IXMLSwellList = interface;
  IXMLSeas = interface;
  IXMLSeasList = interface;
  IXMLNonNegativeIntegerList = interface;
  IXMLDateTimeList = interface;
  IXMLAnyURIList = interface;
  IXMLString_List = interface;

{ IXMLDwml }

  IXMLDwml = interface(IXMLNode)
    ['{E2FA236E-2095-4A07-B755-5B9EF9F502C3}']
    { Property Accessors }
    function Get_Version: UnicodeString;
    function Get_Head: IXMLHeadType;
    function Get_Data: IXMLDataTypeList;
    function Get_MinResolution: UnicodeString;
    function Get_LatLonList: UnicodeString;
    function Get_CityNameList: UnicodeString;
    procedure Set_Version(Value: UnicodeString);
    procedure Set_MinResolution(Value: UnicodeString);
    procedure Set_LatLonList(Value: UnicodeString);
    procedure Set_CityNameList(Value: UnicodeString);
    { Methods & Properties }
    property Version: UnicodeString read Get_Version write Set_Version;
    property Head: IXMLHeadType read Get_Head;
    property Data: IXMLDataTypeList read Get_Data;
    property MinResolution: UnicodeString read Get_MinResolution write Set_MinResolution;
    property LatLonList: UnicodeString read Get_LatLonList write Set_LatLonList;
    property CityNameList: UnicodeString read Get_CityNameList write Set_CityNameList;
  end;

{ IXMLHeadType }

  IXMLHeadType = interface(IXMLNode)
    ['{49A96FB4-A869-43F0-A89C-678B20B90563}']
    { Property Accessors }
    function Get_Product: IXMLProductType;
    function Get_Source: IXMLSourceType;
    { Methods & Properties }
    property Product: IXMLProductType read Get_Product;
    property Source: IXMLSourceType read Get_Source;
  end;

{ IXMLProductType }

  IXMLProductType = interface(IXMLNode)
    ['{C53D23ED-40C7-4F42-AFB3-E46CA1AA2F2E}']
    { Property Accessors }
    function Get_Concisename: UnicodeString;
    function Get_Operationalmode: UnicodeString;
    function Get_SrsName: UnicodeString;
    function Get_Title: UnicodeString;
    function Get_Field: UnicodeString;
    function Get_Category: UnicodeString;
    function Get_Creationdate: IXMLCreationdateType;
    procedure Set_Concisename(Value: UnicodeString);
    procedure Set_Operationalmode(Value: UnicodeString);
    procedure Set_SrsName(Value: UnicodeString);
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Field(Value: UnicodeString);
    procedure Set_Category(Value: UnicodeString);
    { Methods & Properties }
    property Concisename: UnicodeString read Get_Concisename write Set_Concisename;
    property Operationalmode: UnicodeString read Get_Operationalmode write Set_Operationalmode;
    property SrsName: UnicodeString read Get_SrsName write Set_SrsName;
    property Title: UnicodeString read Get_Title write Set_Title;
    property Field: UnicodeString read Get_Field write Set_Field;
    property Category: UnicodeString read Get_Category write Set_Category;
    property Creationdate: IXMLCreationdateType read Get_Creationdate;
  end;

{ IXMLCreationdateType }

  IXMLCreationdateType = interface(IXMLNode)
    ['{298426AA-5763-4682-81C9-ED38796884CB}']
    { Property Accessors }
    function Get_Refreshfrequency: UnicodeString;
    procedure Set_Refreshfrequency(Value: UnicodeString);
    { Methods & Properties }
    property Refreshfrequency: UnicodeString read Get_Refreshfrequency write Set_Refreshfrequency;
  end;

{ IXMLSourceType }

  IXMLSourceType = interface(IXMLNode)
    ['{B59A0976-F9B8-4BE5-A049-1F01A79739EA}']
    { Property Accessors }
    function Get_Moreinformation: UnicodeString;
    function Get_Productioncenter: IXMLProductioncenterType;
    function Get_Disclaimer: UnicodeString;
    function Get_Credit: UnicodeString;
    function Get_Creditlogo: UnicodeString;
    function Get_Feedback: UnicodeString;
    procedure Set_Moreinformation(Value: UnicodeString);
    procedure Set_Disclaimer(Value: UnicodeString);
    procedure Set_Credit(Value: UnicodeString);
    procedure Set_Creditlogo(Value: UnicodeString);
    procedure Set_Feedback(Value: UnicodeString);
    { Methods & Properties }
    property Moreinformation: UnicodeString read Get_Moreinformation write Set_Moreinformation;
    property Productioncenter: IXMLProductioncenterType read Get_Productioncenter;
    property Disclaimer: UnicodeString read Get_Disclaimer write Set_Disclaimer;
    property Credit: UnicodeString read Get_Credit write Set_Credit;
    property Creditlogo: UnicodeString read Get_Creditlogo write Set_Creditlogo;
    property Feedback: UnicodeString read Get_Feedback write Set_Feedback;
  end;

{ IXMLProductioncenterType }

  IXMLProductioncenterType = interface(IXMLNode)
    ['{074FA7D0-9D66-4209-963C-DF50DB30AB13}']
    { Property Accessors }
    function Get_Subcenter: UnicodeString;
    procedure Set_Subcenter(Value: UnicodeString);
    { Methods & Properties }
    property Subcenter: UnicodeString read Get_Subcenter write Set_Subcenter;
  end;

{ IXMLDataType }

  IXMLDataType = interface(IXMLNode)
    ['{A3A07AA7-B64C-4A78-81AC-C8DAD6A266A8}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Location: IXMLLocationTypeList;
    function Get_MoreWeatherInformation: IXMLMoreWeatherInformationTypeList;
    function Get_Timelayout: IXMLTimelayoutElementTypeList;
    function Get_Parameters: IXMLParametersTypeList;
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Location: IXMLLocationTypeList read Get_Location;
    property MoreWeatherInformation: IXMLMoreWeatherInformationTypeList read Get_MoreWeatherInformation;
    property Timelayout: IXMLTimelayoutElementTypeList read Get_Timelayout;
    property Parameters: IXMLParametersTypeList read Get_Parameters;
  end;

{ IXMLDataTypeList }

  IXMLDataTypeList = interface(IXMLNodeCollection)
    ['{3CE23E73-3851-470E-B22A-33743DAF015B}']
    { Methods & Properties }
    function Add: IXMLDataType;
    function Insert(const Index: Integer): IXMLDataType;

    function Get_Item(Index: Integer): IXMLDataType;
    property Items[Index: Integer]: IXMLDataType read Get_Item; default;
  end;

{ IXMLLocationType }

  IXMLLocationType = interface(IXMLNode)
    ['{A47559A0-CEA0-415E-BE00-783BFCEA08F2}']
    { Property Accessors }
    function Get_Locationkey: UnicodeString;
    function Get_Description: UnicodeString;
    function Get_Point: IXMLPointType;
    function Get_Nwszone: IXMLNwszoneType;
    function Get_Area: IXMLAreaType;
    function Get_City: IXMLCityType;
    function Get_Areadescription: UnicodeString;
    function Get_Height: IXMLHeightType;
    function Get_Level: IXMLLevelType;
    function Get_Layer: IXMLLayerType;
    procedure Set_Locationkey(Value: UnicodeString);
    procedure Set_Description(Value: UnicodeString);
    procedure Set_Areadescription(Value: UnicodeString);
    { Methods & Properties }
    property Locationkey: UnicodeString read Get_Locationkey write Set_Locationkey;
    property Description: UnicodeString read Get_Description write Set_Description;
    property Point: IXMLPointType read Get_Point;
    property Nwszone: IXMLNwszoneType read Get_Nwszone;
    property Area: IXMLAreaType read Get_Area;
    property City: IXMLCityType read Get_City;
    property Areadescription: UnicodeString read Get_Areadescription write Set_Areadescription;
    property Height: IXMLHeightType read Get_Height;
    property Level: IXMLLevelType read Get_Level;
    property Layer: IXMLLayerType read Get_Layer;
  end;

{ IXMLLocationTypeList }

  IXMLLocationTypeList = interface(IXMLNodeCollection)
    ['{56EF8DD3-A574-40F5-905C-F4B7C4F86979}']
    { Methods & Properties }
    function Add: IXMLLocationType;
    function Insert(const Index: Integer): IXMLLocationType;

    function Get_Item(Index: Integer): IXMLLocationType;
    property Items[Index: Integer]: IXMLLocationType read Get_Item; default;
  end;

{ IXMLPointType }

  IXMLPointType = interface(IXMLNode)
    ['{E22CB1AE-B403-4C3A-A2B7-FED9027D062D}']
    { Property Accessors }
    function Get_Latitude: UnicodeString;
    function Get_Longitude: UnicodeString;
    function Get_Summarization: UnicodeString;
    procedure Set_Latitude(Value: UnicodeString);
    procedure Set_Longitude(Value: UnicodeString);
    procedure Set_Summarization(Value: UnicodeString);
    { Methods & Properties }
    property Latitude: UnicodeString read Get_Latitude write Set_Latitude;
    property Longitude: UnicodeString read Get_Longitude write Set_Longitude;
    property Summarization: UnicodeString read Get_Summarization write Set_Summarization;
  end;

{ IXMLNwszoneType }

  IXMLNwszoneType = interface(IXMLNode)
    ['{F4A7A734-43CD-4E02-A036-25B2FDBB5119}']
    { Property Accessors }
    function Get_State: UnicodeString;
    function Get_Summarization: UnicodeString;
    procedure Set_State(Value: UnicodeString);
    procedure Set_Summarization(Value: UnicodeString);
    { Methods & Properties }
    property State: UnicodeString read Get_State write Set_State;
    property Summarization: UnicodeString read Get_Summarization write Set_Summarization;
  end;

{ IXMLAreaType }

  IXMLAreaType = interface(IXMLNode)
    ['{F604E0F9-9C8E-438E-8505-5AA606C61728}']
    { Property Accessors }
    function Get_Areatype: UnicodeString;
    function Get_Circle: IXMLCircleType;
    function Get_Rectangle: IXMLRectangleType;
    procedure Set_Areatype(Value: UnicodeString);
    { Methods & Properties }
    property Areatype: UnicodeString read Get_Areatype write Set_Areatype;
    property Circle: IXMLCircleType read Get_Circle;
    property Rectangle: IXMLRectangleType read Get_Rectangle;
  end;

{ IXMLCircleType }

  IXMLCircleType = interface(IXMLNode)
    ['{7F094A52-BB6D-457F-81E0-35A13D0F3B4B}']
    { Property Accessors }
    function Get_Summarization: UnicodeString;
    function Get_Point: IXMLPointType;
    function Get_Radius: IXMLRadiusType;
    procedure Set_Summarization(Value: UnicodeString);
    { Methods & Properties }
    property Summarization: UnicodeString read Get_Summarization write Set_Summarization;
    property Point: IXMLPointType read Get_Point;
    property Radius: IXMLRadiusType read Get_Radius;
  end;

{ IXMLRadiusType }

  IXMLRadiusType = interface(IXMLNode)
    ['{8113FF8E-9F22-4F18-8E6F-56A38E7F3811}']
    { Property Accessors }
    function Get_Radiusunits: UnicodeString;
    procedure Set_Radiusunits(Value: UnicodeString);
    { Methods & Properties }
    property Radiusunits: UnicodeString read Get_Radiusunits write Set_Radiusunits;
  end;

{ IXMLRectangleType }

  IXMLRectangleType = interface(IXMLNodeCollection)
    ['{93F85AA2-4466-4D09-B6ED-4CCBD2220559}']
    { Property Accessors }
    function Get_Summarization: UnicodeString;
    function Get_Point(Index: Integer): IXMLPointType;
    procedure Set_Summarization(Value: UnicodeString);
    { Methods & Properties }
    function Add: IXMLPointType;
    function Insert(const Index: Integer): IXMLPointType;
    property Summarization: UnicodeString read Get_Summarization write Set_Summarization;
    property Point[Index: Integer]: IXMLPointType read Get_Point; default;
  end;

{ IXMLCityType }

  IXMLCityType = interface(IXMLNode)
    ['{E4150AE8-0D4E-463E-B4AF-2A190173E87B}']
    { Property Accessors }
    function Get_State: UnicodeString;
    function Get_Summarization: UnicodeString;
    procedure Set_State(Value: UnicodeString);
    procedure Set_Summarization(Value: UnicodeString);
    { Methods & Properties }
    property State: UnicodeString read Get_State write Set_State;
    property Summarization: UnicodeString read Get_Summarization write Set_Summarization;
  end;

{ IXMLHeightType }

  IXMLHeightType = interface(IXMLNode)
    ['{2F6C61DE-A1A9-4D2A-B043-3A1BC35121C1}']
    { Property Accessors }
    function Get_Datum: UnicodeString;
    function Get_Heightunits: UnicodeString;
    procedure Set_Datum(Value: UnicodeString);
    procedure Set_Heightunits(Value: UnicodeString);
    { Methods & Properties }
    property Datum: UnicodeString read Get_Datum write Set_Datum;
    property Heightunits: UnicodeString read Get_Heightunits write Set_Heightunits;
  end;

{ IXMLLevelType }

  IXMLLevelType = interface(IXMLNode)
    ['{8AB3896F-43A5-425E-8814-75CA30D08BE1}']
    { Property Accessors }
    function Get_Verticalcoordinate: UnicodeString;
    procedure Set_Verticalcoordinate(Value: UnicodeString);
    { Methods & Properties }
    property Verticalcoordinate: UnicodeString read Get_Verticalcoordinate write Set_Verticalcoordinate;
  end;

{ IXMLLayerType }

  IXMLLayerType = interface(IXMLNode)
    ['{89B97DC3-0B05-4C56-81CD-5E1A9E6E3675}']
    { Property Accessors }
    function Get_Verticalcoordinate: UnicodeString;
    procedure Set_Verticalcoordinate(Value: UnicodeString);
    { Methods & Properties }
    property Verticalcoordinate: UnicodeString read Get_Verticalcoordinate write Set_Verticalcoordinate;
  end;

{ IXMLMoreWeatherInformationType }

  IXMLMoreWeatherInformationType = interface(IXMLNode)
    ['{6330AEA8-C7BA-44C8-B252-1E5925B5E3F5}']
    { Property Accessors }
    function Get_Applicablelocation: UnicodeString;
    procedure Set_Applicablelocation(Value: UnicodeString);
    { Methods & Properties }
    property Applicablelocation: UnicodeString read Get_Applicablelocation write Set_Applicablelocation;
  end;

{ IXMLMoreWeatherInformationTypeList }

  IXMLMoreWeatherInformationTypeList = interface(IXMLNodeCollection)
    ['{A039DFDD-9176-4878-AB30-9174CA2C23B4}']
    { Methods & Properties }
    function Add: IXMLMoreWeatherInformationType;
    function Insert(const Index: Integer): IXMLMoreWeatherInformationType;

    function Get_Item(Index: Integer): IXMLMoreWeatherInformationType;
    property Items[Index: Integer]: IXMLMoreWeatherInformationType read Get_Item; default;
  end;

{ IXMLTimelayoutElementType }

  IXMLTimelayoutElementType = interface(IXMLNode)
    ['{25C3A58B-2141-4344-8AE8-1E20C5DBA950}']
    { Property Accessors }
    function Get_Timecoordinate: UnicodeString;
    function Get_Summarization: UnicodeString;
    function Get_Layoutkey: UnicodeString;
    function Get_Startvalidtime: IXMLStartvalidtimeTypeList;
    function Get_Endvalidtime: IXMLDateTimeList;
    procedure Set_Timecoordinate(Value: UnicodeString);
    procedure Set_Summarization(Value: UnicodeString);
    procedure Set_Layoutkey(Value: UnicodeString);
    { Methods & Properties }
    property Timecoordinate: UnicodeString read Get_Timecoordinate write Set_Timecoordinate;
    property Summarization: UnicodeString read Get_Summarization write Set_Summarization;
    property Layoutkey: UnicodeString read Get_Layoutkey write Set_Layoutkey;
    property Startvalidtime: IXMLStartvalidtimeTypeList read Get_Startvalidtime;
    property Endvalidtime: IXMLDateTimeList read Get_Endvalidtime;
  end;

{ IXMLTimelayoutElementTypeList }

  IXMLTimelayoutElementTypeList = interface(IXMLNodeCollection)
    ['{9208F31D-5150-4041-A61F-C43923DD24AF}']
    { Methods & Properties }
    function Add: IXMLTimelayoutElementType;
    function Insert(const Index: Integer): IXMLTimelayoutElementType;

    function Get_Item(Index: Integer): IXMLTimelayoutElementType;
    property Items[Index: Integer]: IXMLTimelayoutElementType read Get_Item; default;
  end;

{ IXMLStartvalidtimeType }

  IXMLStartvalidtimeType = interface(IXMLNode)
    ['{2168E6E5-FB41-436C-A3CB-F30FF4458AC4}']
    { Property Accessors }
    function Get_Periodname: UnicodeString;
    procedure Set_Periodname(Value: UnicodeString);
    { Methods & Properties }
    property Periodname: UnicodeString read Get_Periodname write Set_Periodname;
  end;

{ IXMLStartvalidtimeTypeList }

  IXMLStartvalidtimeTypeList = interface(IXMLNodeCollection)
    ['{6F062C79-EB7F-4B14-B489-C542AD481C07}']
    { Methods & Properties }
    function Add: IXMLStartvalidtimeType;
    function Insert(const Index: Integer): IXMLStartvalidtimeType;

    function Get_Item(Index: Integer): IXMLStartvalidtimeType;
    property Items[Index: Integer]: IXMLStartvalidtimeType read Get_Item; default;
  end;

{ IXMLParametersType }

  IXMLParametersType = interface(IXMLNode)
    ['{3979E775-2545-46A5-A147-5906A336FDB4}']
    { Property Accessors }
    function Get_Applicablelocation: UnicodeString;
    function Get_Categories: IXMLCategoriesTypeList;
    function Get_Temperature: IXMLTemperatureList;
    function Get_Precipitation: IXMLPrecipitationList;
    function Get_Probabilityofprecipitation: IXMLProbabilityofprecipitationList;
    function Get_Fireweather: IXMLFireweatherList;
    function Get_Convectivehazard: IXMLConvectivehazardList;
    function Get_Climateanomaly: IXMLClimateanomalyList;
    function Get_Windspeed: IXMLWindspeedList;
    function Get_Direction: IXMLDirectionList;
    function Get_Cloudamount: IXMLCloudamountList;
    function Get_Humidity: IXMLHumidityList;
    function Get_Weather: IXMLWeatherList;
    function Get_Conditionsicon: IXMLConditionsiconList;
    function Get_Hazards: IXMLHazardsList;
    function Get_WordedForecast: IXMLWordedForecast;
    function Get_Pressure: IXMLPressureList;
    function Get_ProbabilisticCondition: IXMLProbabilisticConditionList;
    function Get_Waterstate: IXMLWaterstateList;
    procedure Set_Applicablelocation(Value: UnicodeString);
    { Methods & Properties }
    property Applicablelocation: UnicodeString read Get_Applicablelocation write Set_Applicablelocation;
    property Categories: IXMLCategoriesTypeList read Get_Categories;
    property Temperature: IXMLTemperatureList read Get_Temperature;
    property Precipitation: IXMLPrecipitationList read Get_Precipitation;
    property Probabilityofprecipitation: IXMLProbabilityofprecipitationList read Get_Probabilityofprecipitation;
    property Fireweather: IXMLFireweatherList read Get_Fireweather;
    property Convectivehazard: IXMLConvectivehazardList read Get_Convectivehazard;
    property Climateanomaly: IXMLClimateanomalyList read Get_Climateanomaly;
    property Windspeed: IXMLWindspeedList read Get_Windspeed;
    property Direction: IXMLDirectionList read Get_Direction;
    property Cloudamount: IXMLCloudamountList read Get_Cloudamount;
    property Humidity: IXMLHumidityList read Get_Humidity;
    property Weather: IXMLWeatherList read Get_Weather;
    property Conditionsicon: IXMLConditionsiconList read Get_Conditionsicon;
    property Hazards: IXMLHazardsList read Get_Hazards;
    property WordedForecast: IXMLWordedForecast read Get_WordedForecast;
    property Pressure: IXMLPressureList read Get_Pressure;
    property ProbabilisticCondition: IXMLProbabilisticConditionList read Get_ProbabilisticCondition;
    property Waterstate: IXMLWaterstateList read Get_Waterstate;
  end;

{ IXMLParametersTypeList }

  IXMLParametersTypeList = interface(IXMLNodeCollection)
    ['{774E83F2-E0C6-41E9-AFAF-61D3D14C39CB}']
    { Methods & Properties }
    function Add: IXMLParametersType;
    function Insert(const Index: Integer): IXMLParametersType;

    function Get_Item(Index: Integer): IXMLParametersType;
    property Items[Index: Integer]: IXMLParametersType read Get_Item; default;
  end;

{ IXMLCategoriesType }

  IXMLCategoriesType = interface(IXMLNode)
    ['{D6F637A6-6A5D-4BC8-BA9C-545BBE17CFDD}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Probabilitytype: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Categorieskey: UnicodeString;
    function Get_ValueList: IXMLValueListType;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Probabilitytype(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Categorieskey(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Probabilitytype: UnicodeString read Get_Probabilitytype write Set_Probabilitytype;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Categorieskey: UnicodeString read Get_Categorieskey write Set_Categorieskey;
    property ValueList: IXMLValueListType read Get_ValueList;
  end;

{ IXMLCategoriesTypeList }

  IXMLCategoriesTypeList = interface(IXMLNodeCollection)
    ['{27864505-4C68-4E84-B3D8-3461F4821702}']
    { Methods & Properties }
    function Add: IXMLCategoriesType;
    function Insert(const Index: Integer): IXMLCategoriesType;

    function Get_Item(Index: Integer): IXMLCategoriesType;
    property Items[Index: Integer]: IXMLCategoriesType read Get_Item; default;
  end;

{ IXMLValueListType }

  IXMLValueListType = interface(IXMLNode)
    ['{2FEC65A6-4003-4F63-A899-F9E86751A5C8}']
    { Property Accessors }
    function Get_Median: UnicodeString;
    function Get_ConfidenceInterval50: UnicodeString;
    function Get_ConfidenceInterval80: UnicodeString;
    function Get_Skew80: UnicodeString;
    procedure Set_Median(Value: UnicodeString);
    procedure Set_ConfidenceInterval50(Value: UnicodeString);
    procedure Set_ConfidenceInterval80(Value: UnicodeString);
    procedure Set_Skew80(Value: UnicodeString);
    { Methods & Properties }
    property Median: UnicodeString read Get_Median write Set_Median;
    property ConfidenceInterval50: UnicodeString read Get_ConfidenceInterval50 write Set_ConfidenceInterval50;
    property ConfidenceInterval80: UnicodeString read Get_ConfidenceInterval80 write Set_ConfidenceInterval80;
    property Skew80: UnicodeString read Get_Skew80 write Set_Skew80;
  end;

{ IXMLValueListTypeList }

  IXMLValueListTypeList = interface(IXMLNodeCollection)
    ['{51D51DBF-84B1-4BA3-975A-624BAF4A76BF}']
    { Methods & Properties }
    function Add: IXMLValueListType;
    function Insert(const Index: Integer): IXMLValueListType;

    function Get_Item(Index: Integer): IXMLValueListType;
    property Items[Index: Integer]: IXMLValueListType read Get_Item; default;
  end;

{ IXMLTemperature }

  IXMLTemperature = interface(IXMLNode)
    ['{2639DD19-20A7-4468-88B8-DB5BE94B97F0}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_LikelihoodUnits: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Applicablecategories: UnicodeString;
    function Get_Probabilitytype: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLTempValTypeList;
    function Get_ValueList: IXMLValueListTypeList;
    function Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_LikelihoodUnits(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Applicablecategories(Value: UnicodeString);
    procedure Set_Probabilitytype(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property LikelihoodUnits: UnicodeString read Get_LikelihoodUnits write Set_LikelihoodUnits;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Applicablecategories: UnicodeString read Get_Applicablecategories write Set_Applicablecategories;
    property Probabilitytype: UnicodeString read Get_Probabilitytype write Set_Probabilitytype;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLTempValTypeList read Get_Value;
    property ValueList: IXMLValueListTypeList read Get_ValueList;
    property ValueWithUncertainty: IXMLValueWithUncertaintyList read Get_ValueWithUncertainty;
  end;

{ IXMLTemperatureList }

  IXMLTemperatureList = interface(IXMLNodeCollection)
    ['{948DABB9-E2C2-4FE8-9CA5-7F90C301DC62}']
    { Methods & Properties }
    function Add: IXMLTemperature;
    function Insert(const Index: Integer): IXMLTemperature;

    function Get_Item(Index: Integer): IXMLTemperature;
    property Items[Index: Integer]: IXMLTemperature read Get_Item; default;
  end;

{ IXMLTempValType }

  IXMLTempValType = interface(IXMLNode)
    ['{F205CEDA-1353-4248-9E2B-A9CEC528FC8A}']
    { Property Accessors }
    function Get_Upperrange: Integer;
    function Get_Lowerrange: Integer;
    function Get_Type_: UnicodeString;
    procedure Set_Upperrange(Value: Integer);
    procedure Set_Lowerrange(Value: Integer);
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Upperrange: Integer read Get_Upperrange write Set_Upperrange;
    property Lowerrange: Integer read Get_Lowerrange write Set_Lowerrange;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLTempValTypeList }

  IXMLTempValTypeList = interface(IXMLNodeCollection)
    ['{AF4660AD-0732-490A-9F60-7213AE03548B}']
    { Methods & Properties }
    function Add: IXMLTempValType;
    function Insert(const Index: Integer): IXMLTempValType;

    function Get_Item(Index: Integer): IXMLTempValType;
    property Items[Index: Integer]: IXMLTempValType read Get_Item; default;
  end;

{ IXMLValueWithUncertainty }

  IXMLValueWithUncertainty = interface(IXMLNode)
    ['{95BCCDC0-A5A1-4757-9714-B0F098527BBF}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Value: IXMLTempValType;
    function Get_Uncertainty: IXMLUncertaintyType;
    function Get_NumberWithEquality: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_NumberWithEquality(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Value: IXMLTempValType read Get_Value;
    property Uncertainty: IXMLUncertaintyType read Get_Uncertainty;
    property NumberWithEquality: UnicodeString read Get_NumberWithEquality write Set_NumberWithEquality;
  end;

{ IXMLValueWithUncertaintyList }

  IXMLValueWithUncertaintyList = interface(IXMLNodeCollection)
    ['{BBA2FF18-91B3-4A67-AD36-9C26829EA4CD}']
    { Methods & Properties }
    function Add: IXMLValueWithUncertainty;
    function Insert(const Index: Integer): IXMLValueWithUncertainty;

    function Get_Item(Index: Integer): IXMLValueWithUncertainty;
    property Items[Index: Integer]: IXMLValueWithUncertainty read Get_Item; default;
  end;

{ IXMLUncertaintyType }

  IXMLUncertaintyType = interface(IXMLNode)
    ['{EBC6D20E-F28D-4D26-B0A1-4F016C0B0057}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Error: IXMLError;
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Error: IXMLError read Get_Error;
  end;

{ IXMLError }

  IXMLError = interface(IXMLNode)
    ['{3322E9EA-3C48-4C25-AAFC-49EE68AA405C}']
    { Property Accessors }
    function Get_Qualifier: UnicodeString;
    procedure Set_Qualifier(Value: UnicodeString);
    { Methods & Properties }
    property Qualifier: UnicodeString read Get_Qualifier write Set_Qualifier;
  end;

{ IXMLPrecipitation }

  IXMLPrecipitation = interface(IXMLNode)
    ['{534400A7-4778-46FE-846A-DD576A965FE2}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_LikelihoodUnits: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Probabilitytype: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLDecimalValTypeList;
    function Get_ValueList: IXMLValueListTypeList;
    function Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_LikelihoodUnits(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Probabilitytype(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property LikelihoodUnits: UnicodeString read Get_LikelihoodUnits write Set_LikelihoodUnits;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Probabilitytype: UnicodeString read Get_Probabilitytype write Set_Probabilitytype;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLDecimalValTypeList read Get_Value;
    property ValueList: IXMLValueListTypeList read Get_ValueList;
    property ValueWithUncertainty: IXMLValueWithUncertaintyList read Get_ValueWithUncertainty;
  end;

{ IXMLPrecipitationList }

  IXMLPrecipitationList = interface(IXMLNodeCollection)
    ['{4AD8B55B-5148-4F35-9051-72DB33F3D90B}']
    { Methods & Properties }
    function Add: IXMLPrecipitation;
    function Insert(const Index: Integer): IXMLPrecipitation;

    function Get_Item(Index: Integer): IXMLPrecipitation;
    property Items[Index: Integer]: IXMLPrecipitation read Get_Item; default;
  end;

{ IXMLDecimalValType }

  IXMLDecimalValType = interface(IXMLNode)
    ['{6B812AA1-D328-4EF3-AB8B-4996C74D4579}']
    { Property Accessors }
    function Get_Upperrange: LongWord;
    function Get_Lowerrange: LongWord;
    function Get_Type_: UnicodeString;
    procedure Set_Upperrange(Value: LongWord);
    procedure Set_Lowerrange(Value: LongWord);
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Upperrange: LongWord read Get_Upperrange write Set_Upperrange;
    property Lowerrange: LongWord read Get_Lowerrange write Set_Lowerrange;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLDecimalValTypeList }

  IXMLDecimalValTypeList = interface(IXMLNodeCollection)
    ['{90C97817-D880-4BA8-A713-7E928718FFD5}']
    { Methods & Properties }
    function Add: IXMLDecimalValType;
    function Insert(const Index: Integer): IXMLDecimalValType;

    function Get_Item(Index: Integer): IXMLDecimalValType;
    property Items[Index: Integer]: IXMLDecimalValType read Get_Item; default;
  end;

{ IXMLProbabilityofprecipitation }

  IXMLProbabilityofprecipitation = interface(IXMLNode)
    ['{9824090F-3202-4A96-AD04-1B22FAD3DC2B}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_LikelihoodUnits: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Applicablecategories: UnicodeString;
    function Get_Probabilitytype: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLPercentageValTypeList;
    function Get_ValueList: IXMLValueListTypeList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_LikelihoodUnits(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Applicablecategories(Value: UnicodeString);
    procedure Set_Probabilitytype(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property LikelihoodUnits: UnicodeString read Get_LikelihoodUnits write Set_LikelihoodUnits;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Applicablecategories: UnicodeString read Get_Applicablecategories write Set_Applicablecategories;
    property Probabilitytype: UnicodeString read Get_Probabilitytype write Set_Probabilitytype;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLPercentageValTypeList read Get_Value;
    property ValueList: IXMLValueListTypeList read Get_ValueList;
  end;

{ IXMLProbabilityofprecipitationList }

  IXMLProbabilityofprecipitationList = interface(IXMLNodeCollection)
    ['{46275599-309E-48FF-90E8-DEB126362061}']
    { Methods & Properties }
    function Add: IXMLProbabilityofprecipitation;
    function Insert(const Index: Integer): IXMLProbabilityofprecipitation;

    function Get_Item(Index: Integer): IXMLProbabilityofprecipitation;
    property Items[Index: Integer]: IXMLProbabilityofprecipitation read Get_Item; default;
  end;

{ IXMLPercentageValType }

  IXMLPercentageValType = interface(IXMLNode)
    ['{2FA7992E-BCC4-466F-8F2D-A7892BA0D107}']
    { Property Accessors }
    function Get_Upperrange: LongWord;
    function Get_Lowerrange: LongWord;
    function Get_Type_: UnicodeString;
    procedure Set_Upperrange(Value: LongWord);
    procedure Set_Lowerrange(Value: LongWord);
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Upperrange: LongWord read Get_Upperrange write Set_Upperrange;
    property Lowerrange: LongWord read Get_Lowerrange write Set_Lowerrange;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLPercentageValTypeList }

  IXMLPercentageValTypeList = interface(IXMLNodeCollection)
    ['{C1203563-393E-49BE-A7CF-21C55EAF55FA}']
    { Methods & Properties }
    function Add: IXMLPercentageValType;
    function Insert(const Index: Integer): IXMLPercentageValType;

    function Get_Item(Index: Integer): IXMLPercentageValType;
    property Items[Index: Integer]: IXMLPercentageValType read Get_Item; default;
  end;

{ IXMLFireweather }

  IXMLFireweather = interface(IXMLNode)
    ['{C7B5959A-CF8D-4212-9C9C-412ECE3C76AA}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLValueList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLValueList read Get_Value;
  end;

{ IXMLFireweatherList }

  IXMLFireweatherList = interface(IXMLNodeCollection)
    ['{B08CCAFC-B134-4F36-9F6E-3B957A431224}']
    { Methods & Properties }
    function Add: IXMLFireweather;
    function Insert(const Index: Integer): IXMLFireweather;

    function Get_Item(Index: Integer): IXMLFireweather;
    property Items[Index: Integer]: IXMLFireweather read Get_Item; default;
  end;

{ IXMLConvectivehazard }

  IXMLConvectivehazard = interface(IXMLNode)
    ['{28901AD9-97C5-47CA-BC52-558D51B5676C}']
    { Property Accessors }
    function Get_Outlook: IXMLOutlook;
    function Get_Severecomponent: IXMLSeverecomponentList;
    { Methods & Properties }
    property Outlook: IXMLOutlook read Get_Outlook;
    property Severecomponent: IXMLSeverecomponentList read Get_Severecomponent;
  end;

{ IXMLConvectivehazardList }

  IXMLConvectivehazardList = interface(IXMLNodeCollection)
    ['{7C2E2EBC-CCEF-4E14-9ECE-12BD87BD2081}']
    { Methods & Properties }
    function Add: IXMLConvectivehazard;
    function Insert(const Index: Integer): IXMLConvectivehazard;

    function Get_Item(Index: Integer): IXMLConvectivehazard;
    property Items[Index: Integer]: IXMLConvectivehazard read Get_Item; default;
  end;

{ IXMLOutlook }

  IXMLOutlook = interface(IXMLNode)
    ['{D96F8826-11E1-4104-B759-7AD99A6FF80C}']
    { Property Accessors }
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLValueList;
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLValueList read Get_Value;
  end;

{ IXMLSeverecomponent }

  IXMLSeverecomponent = interface(IXMLNode)
    ['{45296031-B2C2-4320-B709-8CBB47676BC4}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLValueList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLValueList read Get_Value;
  end;

{ IXMLSeverecomponentList }

  IXMLSeverecomponentList = interface(IXMLNodeCollection)
    ['{07CF13A1-438F-43C1-89EB-FF817D15B0F1}']
    { Methods & Properties }
    function Add: IXMLSeverecomponent;
    function Insert(const Index: Integer): IXMLSeverecomponent;

    function Get_Item(Index: Integer): IXMLSeverecomponent;
    property Items[Index: Integer]: IXMLSeverecomponent read Get_Item; default;
  end;

{ IXMLValue }

  IXMLValue = interface(IXMLNode)
    ['{9928FCE8-328C-4AE4-8955-1F3543274046}']
    { Property Accessors }
    function Get_Upperrange: LongWord;
    function Get_Lowerrange: LongWord;
    procedure Set_Upperrange(Value: LongWord);
    procedure Set_Lowerrange(Value: LongWord);
    { Methods & Properties }
    property Upperrange: LongWord read Get_Upperrange write Set_Upperrange;
    property Lowerrange: LongWord read Get_Lowerrange write Set_Lowerrange;
  end;

{ IXMLValueList }

  IXMLValueList = interface(IXMLNodeCollection)
    ['{56314207-9B68-4E3E-BDB8-F3B14882FD23}']
    { Methods & Properties }
    function Add: IXMLValue;
    function Insert(const Index: Integer): IXMLValue;

    function Get_Item(Index: Integer): IXMLValue;
    property Items[Index: Integer]: IXMLValue read Get_Item; default;
  end;

{ IXMLClimateanomaly }

  IXMLClimateanomaly = interface(IXMLNode)
    ['{415CD271-9278-447A-9875-286ED1C6DB7B}']
    { Property Accessors }
    function Get_Weekly: IXMLAnomalyTypeList;
    function Get_Monthly: IXMLAnomalyTypeList;
    function Get_Seasonal: IXMLAnomalyTypeList;
    { Methods & Properties }
    property Weekly: IXMLAnomalyTypeList read Get_Weekly;
    property Monthly: IXMLAnomalyTypeList read Get_Monthly;
    property Seasonal: IXMLAnomalyTypeList read Get_Seasonal;
  end;

{ IXMLClimateanomalyList }

  IXMLClimateanomalyList = interface(IXMLNodeCollection)
    ['{9397D81D-530E-4F42-84E7-23C9CF582D75}']
    { Methods & Properties }
    function Add: IXMLClimateanomaly;
    function Insert(const Index: Integer): IXMLClimateanomaly;

    function Get_Item(Index: Integer): IXMLClimateanomaly;
    property Items[Index: Integer]: IXMLClimateanomaly read Get_Item; default;
  end;

{ IXMLAnomalyType }

  IXMLAnomalyType = interface(IXMLNode)
    ['{61B5413E-AD00-4713-89C7-BE1D85B7A4FD}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLValueList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLValueList read Get_Value;
  end;

{ IXMLAnomalyTypeList }

  IXMLAnomalyTypeList = interface(IXMLNodeCollection)
    ['{FF1E91A4-E14B-4FF2-9E35-0B9FF36A9C33}']
    { Methods & Properties }
    function Add: IXMLAnomalyType;
    function Insert(const Index: Integer): IXMLAnomalyType;

    function Get_Item(Index: Integer): IXMLAnomalyType;
    property Items[Index: Integer]: IXMLAnomalyType read Get_Item; default;
  end;

{ IXMLWindspeed }

  IXMLWindspeed = interface(IXMLNode)
    ['{C89448E1-1E60-4D7B-B86A-95EEE646ECAE}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLWspdValTypeList;
    function Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLWspdValTypeList read Get_Value;
    property ValueWithUncertainty: IXMLValueWithUncertaintyList read Get_ValueWithUncertainty;
  end;

{ IXMLWindspeedList }

  IXMLWindspeedList = interface(IXMLNodeCollection)
    ['{AC9AE092-553A-4DB6-82E1-BDB386FFD169}']
    { Methods & Properties }
    function Add: IXMLWindspeed;
    function Insert(const Index: Integer): IXMLWindspeed;

    function Get_Item(Index: Integer): IXMLWindspeed;
    property Items[Index: Integer]: IXMLWindspeed read Get_Item; default;
  end;

{ IXMLWspdValType }

  IXMLWspdValType = interface(IXMLNode)
    ['{C635F830-7EE3-4A28-9510-29DDE784887D}']
    { Property Accessors }
    function Get_Upperrange: LongWord;
    function Get_Lowerrange: LongWord;
    function Get_Type_: UnicodeString;
    procedure Set_Upperrange(Value: LongWord);
    procedure Set_Lowerrange(Value: LongWord);
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Upperrange: LongWord read Get_Upperrange write Set_Upperrange;
    property Lowerrange: LongWord read Get_Lowerrange write Set_Lowerrange;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLWspdValTypeList }

  IXMLWspdValTypeList = interface(IXMLNodeCollection)
    ['{D46E873D-0E8B-4B44-B0B9-3F694FAC0D85}']
    { Methods & Properties }
    function Add: IXMLWspdValType;
    function Insert(const Index: Integer): IXMLWspdValType;

    function Get_Item(Index: Integer): IXMLWspdValType;
    property Items[Index: Integer]: IXMLWspdValType read Get_Item; default;
  end;

{ IXMLDirection }

  IXMLDirection = interface(IXMLNode)
    ['{22C14062-95E8-425A-A538-A57B33A36263}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLWdirValTypeList;
    function Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLWdirValTypeList read Get_Value;
    property ValueWithUncertainty: IXMLValueWithUncertaintyList read Get_ValueWithUncertainty;
  end;

{ IXMLDirectionList }

  IXMLDirectionList = interface(IXMLNodeCollection)
    ['{AF4C7566-907F-41E7-B6AD-F1FC56FE5C3A}']
    { Methods & Properties }
    function Add: IXMLDirection;
    function Insert(const Index: Integer): IXMLDirection;

    function Get_Item(Index: Integer): IXMLDirection;
    property Items[Index: Integer]: IXMLDirection read Get_Item; default;
  end;

{ IXMLWdirValType }

  IXMLWdirValType = interface(IXMLNode)
    ['{7027D65B-6FA6-4477-AA74-5BC258A4709A}']
    { Property Accessors }
    function Get_Upperrange: LongWord;
    function Get_Lowerrange: LongWord;
    function Get_Type_: UnicodeString;
    procedure Set_Upperrange(Value: LongWord);
    procedure Set_Lowerrange(Value: LongWord);
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property Upperrange: LongWord read Get_Upperrange write Set_Upperrange;
    property Lowerrange: LongWord read Get_Lowerrange write Set_Lowerrange;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
  end;

{ IXMLWdirValTypeList }

  IXMLWdirValTypeList = interface(IXMLNodeCollection)
    ['{9C68D0BE-2302-4F7C-AF13-833D694D855F}']
    { Methods & Properties }
    function Add: IXMLWdirValType;
    function Insert(const Index: Integer): IXMLWdirValType;

    function Get_Item(Index: Integer): IXMLWdirValType;
    property Items[Index: Integer]: IXMLWdirValType read Get_Item; default;
  end;

{ IXMLCloudamount }

  IXMLCloudamount = interface(IXMLNode)
    ['{79093039-3753-4005-B5B2-FFACE7B0FBB5}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLPercentageValTypeList;
    function Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLPercentageValTypeList read Get_Value;
    property ValueWithUncertainty: IXMLValueWithUncertaintyList read Get_ValueWithUncertainty;
  end;

{ IXMLCloudamountList }

  IXMLCloudamountList = interface(IXMLNodeCollection)
    ['{940FF66D-287A-44F7-9EA3-3D0BFD212287}']
    { Methods & Properties }
    function Add: IXMLCloudamount;
    function Insert(const Index: Integer): IXMLCloudamount;

    function Get_Item(Index: Integer): IXMLCloudamount;
    property Items[Index: Integer]: IXMLCloudamount read Get_Item; default;
  end;

{ IXMLHumidity }

  IXMLHumidity = interface(IXMLNode)
    ['{F4BD6E96-1A83-48A4-83AA-AE333CC2BCCE}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLValueList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLValueList read Get_Value;
  end;

{ IXMLHumidityList }

  IXMLHumidityList = interface(IXMLNodeCollection)
    ['{13113142-81A2-48D9-9D92-2F9E471306D5}']
    { Methods & Properties }
    function Add: IXMLHumidity;
    function Insert(const Index: Integer): IXMLHumidity;

    function Get_Item(Index: Integer): IXMLHumidity;
    property Items[Index: Integer]: IXMLHumidity read Get_Item; default;
  end;

{ IXMLWeather }

  IXMLWeather = interface(IXMLNode)
    ['{727AFD5F-FC92-448D-BD15-FF95CF583354}']
    { Property Accessors }
    function Get_Timelayout: UnicodeString;
    function Get_Name: IXMLString_List;
    function Get_Weatherconditions: IXMLWeatherconditionsList;
    procedure Set_Timelayout(Value: UnicodeString);
    { Methods & Properties }
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Name: IXMLString_List read Get_Name;
    property Weatherconditions: IXMLWeatherconditionsList read Get_Weatherconditions;
  end;

{ IXMLWeatherList }

  IXMLWeatherList = interface(IXMLNodeCollection)
    ['{7CC36A73-67D2-498A-BED8-2B3BD325C0F3}']
    { Methods & Properties }
    function Add: IXMLWeather;
    function Insert(const Index: Integer): IXMLWeather;

    function Get_Item(Index: Integer): IXMLWeather;
    property Items[Index: Integer]: IXMLWeather read Get_Item; default;
  end;

{ IXMLWeatherconditions }

  IXMLWeatherconditions = interface(IXMLNodeCollection)
    ['{61FB88CB-BB11-472A-BF23-86619A7D5CBF}']
    { Property Accessors }
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Weathersummary: UnicodeString;
    function Get_Value(Index: Integer): IXMLValue;
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Weathersummary(Value: UnicodeString);
    { Methods & Properties }
    function Add: IXMLValue;
    function Insert(const Index: Integer): IXMLValue;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Weathersummary: UnicodeString read Get_Weathersummary write Set_Weathersummary;
    property Value[Index: Integer]: IXMLValue read Get_Value; default;
  end;

{ IXMLWeatherconditionsList }

  IXMLWeatherconditionsList = interface(IXMLNodeCollection)
    ['{2FD03FCC-CACF-48A1-82C4-738F438DAE65}']
    { Methods & Properties }
    function Add: IXMLWeatherconditions;
    function Insert(const Index: Integer): IXMLWeatherconditions;

    function Get_Item(Index: Integer): IXMLWeatherconditions;
    property Items[Index: Integer]: IXMLWeatherconditions read Get_Item; default;
  end;

{ IXMLConditionsicon }

  IXMLConditionsicon = interface(IXMLNode)
    ['{666E7483-32C7-44EA-85F4-649AAE92B59F}']
    { Property Accessors }
    function Get_Timelayout: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Iconlink: IXMLAnyURIList;
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Iconlink: IXMLAnyURIList read Get_Iconlink;
  end;

{ IXMLConditionsiconList }

  IXMLConditionsiconList = interface(IXMLNodeCollection)
    ['{D32C960C-D8FA-4C7E-B67C-95231A5F4E6D}']
    { Methods & Properties }
    function Add: IXMLConditionsicon;
    function Insert(const Index: Integer): IXMLConditionsicon;

    function Get_Item(Index: Integer): IXMLConditionsicon;
    property Items[Index: Integer]: IXMLConditionsicon read Get_Item; default;
  end;

{ IXMLHazards }

  IXMLHazards = interface(IXMLNode)
    ['{29533A48-3713-497A-AD33-05A87A65BD3B}']
    { Property Accessors }
    function Get_Timelayout: UnicodeString;
    function Get_Name: IXMLString_List;
    function Get_Hazardconditions: IXMLHazardconditionsList;
    procedure Set_Timelayout(Value: UnicodeString);
    { Methods & Properties }
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Name: IXMLString_List read Get_Name;
    property Hazardconditions: IXMLHazardconditionsList read Get_Hazardconditions;
  end;

{ IXMLHazardsList }

  IXMLHazardsList = interface(IXMLNodeCollection)
    ['{056F7228-7F8E-48E7-ABE8-C3CBA2BD8F67}']
    { Methods & Properties }
    function Add: IXMLHazards;
    function Insert(const Index: Integer): IXMLHazards;

    function Get_Item(Index: Integer): IXMLHazards;
    property Items[Index: Integer]: IXMLHazards read Get_Item; default;
  end;

{ IXMLHazardconditions }

  IXMLHazardconditions = interface(IXMLNodeCollection)
    ['{049B3586-F98F-44A9-98C8-FC3ABACE7973}']
    { Property Accessors }
    function Get_Hazard(Index: Integer): IXMLHazard;
    { Methods & Properties }
    function Add: IXMLHazard;
    function Insert(const Index: Integer): IXMLHazard;
    property Hazard[Index: Integer]: IXMLHazard read Get_Hazard; default;
  end;

{ IXMLHazardconditionsList }

  IXMLHazardconditionsList = interface(IXMLNodeCollection)
    ['{7BBB8DD0-0E3E-4AE8-A5D7-466A2779E060}']
    { Methods & Properties }
    function Add: IXMLHazardconditions;
    function Insert(const Index: Integer): IXMLHazardconditions;

    function Get_Item(Index: Integer): IXMLHazardconditions;
    property Items[Index: Integer]: IXMLHazardconditions read Get_Item; default;
  end;

{ IXMLHazard }

  IXMLHazard = interface(IXMLNode)
    ['{3B9FF185-06CC-4A11-8638-23155D2E6DF1}']
    { Property Accessors }
    function Get_HazardCode: UnicodeString;
    function Get_Phenomena: UnicodeString;
    function Get_Significance: UnicodeString;
    function Get_HazardType: UnicodeString;
    function Get_EventTrackingNumber: Integer;
    function Get_Headline: UnicodeString;
    function Get_HazardTextURL: UnicodeString;
    function Get_HazardIcon: UnicodeString;
    procedure Set_HazardCode(Value: UnicodeString);
    procedure Set_Phenomena(Value: UnicodeString);
    procedure Set_Significance(Value: UnicodeString);
    procedure Set_HazardType(Value: UnicodeString);
    procedure Set_EventTrackingNumber(Value: Integer);
    procedure Set_Headline(Value: UnicodeString);
    procedure Set_HazardTextURL(Value: UnicodeString);
    procedure Set_HazardIcon(Value: UnicodeString);
    { Methods & Properties }
    property HazardCode: UnicodeString read Get_HazardCode write Set_HazardCode;
    property Phenomena: UnicodeString read Get_Phenomena write Set_Phenomena;
    property Significance: UnicodeString read Get_Significance write Set_Significance;
    property HazardType: UnicodeString read Get_HazardType write Set_HazardType;
    property EventTrackingNumber: Integer read Get_EventTrackingNumber write Set_EventTrackingNumber;
    property Headline: UnicodeString read Get_Headline write Set_Headline;
    property HazardTextURL: UnicodeString read Get_HazardTextURL write Set_HazardTextURL;
    property HazardIcon: UnicodeString read Get_HazardIcon write Set_HazardIcon;
  end;

{ IXMLWordedForecast }

  IXMLWordedForecast = interface(IXMLNode)
    ['{4639CEA2-7EC9-474B-8438-EA08B1616F20}']
    { Property Accessors }
    function Get_Timelayout: UnicodeString;
    function Get_DataSource: UnicodeString;
    function Get_WordGenerator: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Text: IXMLString_List;
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_DataSource(Value: UnicodeString);
    procedure Set_WordGenerator(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property DataSource: UnicodeString read Get_DataSource write Set_DataSource;
    property WordGenerator: UnicodeString read Get_WordGenerator write Set_WordGenerator;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Text: IXMLString_List read Get_Text;
  end;

{ IXMLPressure }

  IXMLPressure = interface(IXMLNode)
    ['{1337D4C9-B9D6-4F2F-9F44-5D9C0D730108}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLDecimalValTypeList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLDecimalValTypeList read Get_Value;
  end;

{ IXMLPressureList }

  IXMLPressureList = interface(IXMLNodeCollection)
    ['{6E717E49-F459-4F75-9FC7-65CA4CE8D804}']
    { Methods & Properties }
    function Add: IXMLPressure;
    function Insert(const Index: Integer): IXMLPressure;

    function Get_Item(Index: Integer): IXMLPressure;
    property Items[Index: Integer]: IXMLPressure read Get_Item; default;
  end;

{ IXMLProbabilisticCondition }

  IXMLProbabilisticCondition = interface(IXMLNode)
    ['{584FA26B-10D8-4283-934B-554D33011948}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_LikelihoodUnits: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Applicablecategories: UnicodeString;
    function Get_Probabilitytype: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLPercentageValTypeList;
    function Get_ValueForRange: IXMLValueForRangeTypeList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_LikelihoodUnits(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Applicablecategories(Value: UnicodeString);
    procedure Set_Probabilitytype(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property LikelihoodUnits: UnicodeString read Get_LikelihoodUnits write Set_LikelihoodUnits;
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Applicablecategories: UnicodeString read Get_Applicablecategories write Set_Applicablecategories;
    property Probabilitytype: UnicodeString read Get_Probabilitytype write Set_Probabilitytype;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLPercentageValTypeList read Get_Value;
    property ValueForRange: IXMLValueForRangeTypeList read Get_ValueForRange;
  end;

{ IXMLProbabilisticConditionList }

  IXMLProbabilisticConditionList = interface(IXMLNodeCollection)
    ['{9544F25F-E9AB-4BFE-A1E6-3287A74DBB27}']
    { Methods & Properties }
    function Add: IXMLProbabilisticCondition;
    function Insert(const Index: Integer): IXMLProbabilisticCondition;

    function Get_Item(Index: Integer): IXMLProbabilisticCondition;
    property Items[Index: Integer]: IXMLProbabilisticCondition read Get_Item; default;
  end;

{ IXMLValueForRangeType }

  IXMLValueForRangeType = interface(IXMLNode)
    ['{F3475F4E-0366-4D3D-8551-DB0C9A075D29}']
    { Property Accessors }
    function Get_Value: IXMLPercentageValTypeList;
    function Get_Gt: UnicodeString;
    function Get_Ge: UnicodeString;
    function Get_Lt: UnicodeString;
    function Get_Le: UnicodeString;
    function Get_Eq: UnicodeString;
    procedure Set_Gt(Value: UnicodeString);
    procedure Set_Ge(Value: UnicodeString);
    procedure Set_Lt(Value: UnicodeString);
    procedure Set_Le(Value: UnicodeString);
    procedure Set_Eq(Value: UnicodeString);
    { Methods & Properties }
    property Value: IXMLPercentageValTypeList read Get_Value;
    property Gt: UnicodeString read Get_Gt write Set_Gt;
    property Ge: UnicodeString read Get_Ge write Set_Ge;
    property Lt: UnicodeString read Get_Lt write Set_Lt;
    property Le: UnicodeString read Get_Le write Set_Le;
    property Eq: UnicodeString read Get_Eq write Set_Eq;
  end;

{ IXMLValueForRangeTypeList }

  IXMLValueForRangeTypeList = interface(IXMLNodeCollection)
    ['{24A882FF-0879-401D-A042-4568582C81E9}']
    { Methods & Properties }
    function Add: IXMLValueForRangeType;
    function Insert(const Index: Integer): IXMLValueForRangeType;

    function Get_Item(Index: Integer): IXMLValueForRangeType;
    property Items[Index: Integer]: IXMLValueForRangeType read Get_Item; default;
  end;

{ IXMLWaterstate }

  IXMLWaterstate = interface(IXMLNode)
    ['{4561FD71-9297-45BB-8B96-31FAF9EB03FC}']
    { Property Accessors }
    function Get_Timelayout: UnicodeString;
    function Get_Waves: IXMLWavesList;
    function Get_Swell: IXMLSwellList;
    function Get_Seas: IXMLSeasList;
    function Get_Icecoverage: IXMLNonNegativeIntegerList;
    procedure Set_Timelayout(Value: UnicodeString);
    { Methods & Properties }
    property Timelayout: UnicodeString read Get_Timelayout write Set_Timelayout;
    property Waves: IXMLWavesList read Get_Waves;
    property Swell: IXMLSwellList read Get_Swell;
    property Seas: IXMLSeasList read Get_Seas;
    property Icecoverage: IXMLNonNegativeIntegerList read Get_Icecoverage;
  end;

{ IXMLWaterstateList }

  IXMLWaterstateList = interface(IXMLNodeCollection)
    ['{A0A73533-2413-4D73-A90E-50228A9AFE9D}']
    { Methods & Properties }
    function Add: IXMLWaterstate;
    function Insert(const Index: Integer): IXMLWaterstate;

    function Get_Item(Index: Integer): IXMLWaterstate;
    property Items[Index: Integer]: IXMLWaterstate read Get_Item; default;
  end;

{ IXMLWaves }

  IXMLWaves = interface(IXMLNode)
    ['{99BB2675-9E60-47F4-A150-927CCDC10A57}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Period: LongWord;
    function Get_Steepness: LongWord;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLNonNegativeIntegerList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Period(Value: LongWord);
    procedure Set_Steepness(Value: LongWord);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Period: LongWord read Get_Period write Set_Period;
    property Steepness: LongWord read Get_Steepness write Set_Steepness;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLNonNegativeIntegerList read Get_Value;
  end;

{ IXMLWavesList }

  IXMLWavesList = interface(IXMLNodeCollection)
    ['{106DC785-5795-4EB5-AA69-3CC8AF893093}']
    { Methods & Properties }
    function Add: IXMLWaves;
    function Insert(const Index: Integer): IXMLWaves;

    function Get_Item(Index: Integer): IXMLWaves;
    property Items[Index: Integer]: IXMLWaves read Get_Item; default;
  end;

{ IXMLSwell }

  IXMLSwell = interface(IXMLNode)
    ['{E39E0805-79BF-431E-A453-735E1C28C9F7}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Period: LongWord;
    function Get_Steepness: LongWord;
    function Get_Name: UnicodeString;
    function Get_Value: UnicodeString;
    function Get_Direction: IXMLDirection;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Period(Value: LongWord);
    procedure Set_Steepness(Value: LongWord);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Value(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Period: LongWord read Get_Period write Set_Period;
    property Steepness: LongWord read Get_Steepness write Set_Steepness;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: UnicodeString read Get_Value write Set_Value;
    property Direction: IXMLDirection read Get_Direction;
  end;

{ IXMLSwellList }

  IXMLSwellList = interface(IXMLNodeCollection)
    ['{8417684A-E223-4501-8583-76F67EC69693}']
    { Methods & Properties }
    function Add: IXMLSwell;
    function Insert(const Index: Integer): IXMLSwell;

    function Get_Item(Index: Integer): IXMLSwell;
    property Items[Index: Integer]: IXMLSwell read Get_Item; default;
  end;

{ IXMLSeas }

  IXMLSeas = interface(IXMLNode)
    ['{4E8014FD-BB4A-45CA-BC79-4F58502DA59D}']
    { Property Accessors }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLNonNegativeIntegerList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    { Methods & Properties }
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Units: UnicodeString read Get_Units write Set_Units;
    property Categoricaltable: UnicodeString read Get_Categoricaltable write Set_Categoricaltable;
    property Conversiontable: UnicodeString read Get_Conversiontable write Set_Conversiontable;
    property Name: UnicodeString read Get_Name write Set_Name;
    property Value: IXMLNonNegativeIntegerList read Get_Value;
  end;

{ IXMLSeasList }

  IXMLSeasList = interface(IXMLNodeCollection)
    ['{C2C81026-7BE7-4A43-A431-B83F37D4B4AD}']
    { Methods & Properties }
    function Add: IXMLSeas;
    function Insert(const Index: Integer): IXMLSeas;

    function Get_Item(Index: Integer): IXMLSeas;
    property Items[Index: Integer]: IXMLSeas read Get_Item; default;
  end;

{ IXMLNonNegativeIntegerList }

  IXMLNonNegativeIntegerList = interface(IXMLNodeCollection)
    ['{A5DF5D2E-B247-4AC2-BE1B-9758D06C3C49}']
    { Methods & Properties }
    function Add(const Value: LongWord): IXMLNode;
    function Insert(const Index: Integer; const Value: LongWord): IXMLNode;

    function Get_Item(Index: Integer): LongWord;
    property Items[Index: Integer]: LongWord read Get_Item; default;
  end;

{ IXMLDateTimeList }

  IXMLDateTimeList = interface(IXMLNodeCollection)
    ['{61B62890-013A-4535-99B3-ECACC39D9D20}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read Get_Item; default;
  end;

{ IXMLAnyURIList }

  IXMLAnyURIList = interface(IXMLNodeCollection)
    ['{A2A0B2BF-E82C-4774-B6A1-AD2AB7A679E1}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read Get_Item; default;
  end;


{ IXMLString_List }

  IXMLString_List = interface(IXMLNodeCollection)
    ['{24F8442B-E713-42BC-A4AA-D63E3065F460}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read Get_Item; default;
  end;

{ Forward Decls }

  TXMLDwml = class;
  TXMLHeadType = class;
  TXMLProductType = class;
  TXMLCreationdateType = class;
  TXMLSourceType = class;
  TXMLProductioncenterType = class;
  TXMLDataType = class;
  TXMLDataTypeList = class;
  TXMLLocationType = class;
  TXMLLocationTypeList = class;
  TXMLPointType = class;
  TXMLNwszoneType = class;
  TXMLAreaType = class;
  TXMLCircleType = class;
  TXMLRadiusType = class;
  TXMLRectangleType = class;
  TXMLCityType = class;
  TXMLHeightType = class;
  TXMLLevelType = class;
  TXMLLayerType = class;
  TXMLMoreWeatherInformationType = class;
  TXMLMoreWeatherInformationTypeList = class;
  TXMLTimelayoutElementType = class;
  TXMLTimelayoutElementTypeList = class;
  TXMLStartvalidtimeType = class;
  TXMLStartvalidtimeTypeList = class;
  TXMLParametersType = class;
  TXMLParametersTypeList = class;
  TXMLCategoriesType = class;
  TXMLCategoriesTypeList = class;
  TXMLValueListType = class;
  TXMLValueListTypeList = class;
  TXMLTemperature = class;
  TXMLTemperatureList = class;
  TXMLTempValType = class;
  TXMLTempValTypeList = class;
  TXMLValueWithUncertainty = class;
  TXMLValueWithUncertaintyList = class;
  TXMLUncertaintyType = class;
  TXMLError = class;
  TXMLPrecipitation = class;
  TXMLPrecipitationList = class;
  TXMLDecimalValType = class;
  TXMLDecimalValTypeList = class;
  TXMLProbabilityofprecipitation = class;
  TXMLProbabilityofprecipitationList = class;
  TXMLPercentageValType = class;
  TXMLPercentageValTypeList = class;
  TXMLFireweather = class;
  TXMLFireweatherList = class;
  TXMLConvectivehazard = class;
  TXMLConvectivehazardList = class;
  TXMLOutlook = class;
  TXMLSeverecomponent = class;
  TXMLSeverecomponentList = class;
  TXMLValue = class;
  TXMLValueList = class;
  TXMLClimateanomaly = class;
  TXMLClimateanomalyList = class;
  TXMLAnomalyType = class;
  TXMLAnomalyTypeList = class;
  TXMLWindspeed = class;
  TXMLWindspeedList = class;
  TXMLWspdValType = class;
  TXMLWspdValTypeList = class;
  TXMLDirection = class;
  TXMLDirectionList = class;
  TXMLWdirValType = class;
  TXMLWdirValTypeList = class;
  TXMLCloudamount = class;
  TXMLCloudamountList = class;
  TXMLHumidity = class;
  TXMLHumidityList = class;
  TXMLWeather = class;
  TXMLWeatherList = class;
  TXMLWeatherconditions = class;
  TXMLWeatherconditionsList = class;
  TXMLConditionsicon = class;
  TXMLConditionsiconList = class;
  TXMLHazards = class;
  TXMLHazardsList = class;
  TXMLHazardconditions = class;
  TXMLHazardconditionsList = class;
  TXMLHazard = class;
  TXMLWordedForecast = class;
  TXMLPressure = class;
  TXMLPressureList = class;
  TXMLProbabilisticCondition = class;
  TXMLProbabilisticConditionList = class;
  TXMLValueForRangeType = class;
  TXMLValueForRangeTypeList = class;
  TXMLWaterstate = class;
  TXMLWaterstateList = class;
  TXMLWaves = class;
  TXMLWavesList = class;
  TXMLSwell = class;
  TXMLSwellList = class;
  TXMLSeas = class;
  TXMLSeasList = class;
  TXMLNonNegativeIntegerList = class;
  TXMLDateTimeList = class;
  TXMLAnyURIList = class;
  TXMLString_List = class;

{ TXMLDwml }

  TXMLDwml = class(TXMLNode, IXMLDwml)
  private
    FData: IXMLDataTypeList;
  protected
    { IXMLDwml }
    function Get_Version: UnicodeString;
    function Get_Head: IXMLHeadType;
    function Get_Data: IXMLDataTypeList;
    function Get_MinResolution: UnicodeString;
    function Get_LatLonList: UnicodeString;
    function Get_CityNameList: UnicodeString;
    procedure Set_Version(Value: UnicodeString);
    procedure Set_MinResolution(Value: UnicodeString);
    procedure Set_LatLonList(Value: UnicodeString);
    procedure Set_CityNameList(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLHeadType }

  TXMLHeadType = class(TXMLNode, IXMLHeadType)
  protected
    { IXMLHeadType }
    function Get_Product: IXMLProductType;
    function Get_Source: IXMLSourceType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLProductType }

  TXMLProductType = class(TXMLNode, IXMLProductType)
  protected
    { IXMLProductType }
    function Get_Concisename: UnicodeString;
    function Get_Operationalmode: UnicodeString;
    function Get_SrsName: UnicodeString;
    function Get_Title: UnicodeString;
    function Get_Field: UnicodeString;
    function Get_Category: UnicodeString;
    function Get_Creationdate: IXMLCreationdateType;
    procedure Set_Concisename(Value: UnicodeString);
    procedure Set_Operationalmode(Value: UnicodeString);
    procedure Set_SrsName(Value: UnicodeString);
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Field(Value: UnicodeString);
    procedure Set_Category(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCreationdateType }

  TXMLCreationdateType = class(TXMLNode, IXMLCreationdateType)
  protected
    { IXMLCreationdateType }
    function Get_Refreshfrequency: UnicodeString;
    procedure Set_Refreshfrequency(Value: UnicodeString);
  end;

{ TXMLSourceType }

  TXMLSourceType = class(TXMLNode, IXMLSourceType)
  protected
    { IXMLSourceType }
    function Get_Moreinformation: UnicodeString;
    function Get_Productioncenter: IXMLProductioncenterType;
    function Get_Disclaimer: UnicodeString;
    function Get_Credit: UnicodeString;
    function Get_Creditlogo: UnicodeString;
    function Get_Feedback: UnicodeString;
    procedure Set_Moreinformation(Value: UnicodeString);
    procedure Set_Disclaimer(Value: UnicodeString);
    procedure Set_Credit(Value: UnicodeString);
    procedure Set_Creditlogo(Value: UnicodeString);
    procedure Set_Feedback(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLProductioncenterType }

  TXMLProductioncenterType = class(TXMLNode, IXMLProductioncenterType)
  protected
    { IXMLProductioncenterType }
    function Get_Subcenter: UnicodeString;
    procedure Set_Subcenter(Value: UnicodeString);
  end;

{ TXMLDataType }

  TXMLDataType = class(TXMLNode, IXMLDataType)
  private
    FLocation: IXMLLocationTypeList;
    FMoreWeatherInformation: IXMLMoreWeatherInformationTypeList;
    FTimelayout: IXMLTimelayoutElementTypeList;
    FParameters: IXMLParametersTypeList;
  protected
    { IXMLDataType }
    function Get_Type_: UnicodeString;
    function Get_Location: IXMLLocationTypeList;
    function Get_MoreWeatherInformation: IXMLMoreWeatherInformationTypeList;
    function Get_Timelayout: IXMLTimelayoutElementTypeList;
    function Get_Parameters: IXMLParametersTypeList;
    procedure Set_Type_(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDataTypeList }

  TXMLDataTypeList = class(TXMLNodeCollection, IXMLDataTypeList)
  protected
    { IXMLDataTypeList }
    function Add: IXMLDataType;
    function Insert(const Index: Integer): IXMLDataType;

    function Get_Item(Index: Integer): IXMLDataType;
  end;

{ TXMLLocationType }

  TXMLLocationType = class(TXMLNode, IXMLLocationType)
  protected
    { IXMLLocationType }
    function Get_Locationkey: UnicodeString;
    function Get_Description: UnicodeString;
    function Get_Point: IXMLPointType;
    function Get_Nwszone: IXMLNwszoneType;
    function Get_Area: IXMLAreaType;
    function Get_City: IXMLCityType;
    function Get_Areadescription: UnicodeString;
    function Get_Height: IXMLHeightType;
    function Get_Level: IXMLLevelType;
    function Get_Layer: IXMLLayerType;
    procedure Set_Locationkey(Value: UnicodeString);
    procedure Set_Description(Value: UnicodeString);
    procedure Set_Areadescription(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLLocationTypeList }

  TXMLLocationTypeList = class(TXMLNodeCollection, IXMLLocationTypeList)
  protected
    { IXMLLocationTypeList }
    function Add: IXMLLocationType;
    function Insert(const Index: Integer): IXMLLocationType;

    function Get_Item(Index: Integer): IXMLLocationType;
  end;

{ TXMLPointType }

  TXMLPointType = class(TXMLNode, IXMLPointType)
  protected
    { IXMLPointType }
    function Get_Latitude: UnicodeString;
    function Get_Longitude: UnicodeString;
    function Get_Summarization: UnicodeString;
    procedure Set_Latitude(Value: UnicodeString);
    procedure Set_Longitude(Value: UnicodeString);
    procedure Set_Summarization(Value: UnicodeString);
  end;

{ TXMLNwszoneType }

  TXMLNwszoneType = class(TXMLNode, IXMLNwszoneType)
  protected
    { IXMLNwszoneType }
    function Get_State: UnicodeString;
    function Get_Summarization: UnicodeString;
    procedure Set_State(Value: UnicodeString);
    procedure Set_Summarization(Value: UnicodeString);
  end;

{ TXMLAreaType }

  TXMLAreaType = class(TXMLNode, IXMLAreaType)
  protected
    { IXMLAreaType }
    function Get_Areatype: UnicodeString;
    function Get_Circle: IXMLCircleType;
    function Get_Rectangle: IXMLRectangleType;
    procedure Set_Areatype(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCircleType }

  TXMLCircleType = class(TXMLNode, IXMLCircleType)
  protected
    { IXMLCircleType }
    function Get_Summarization: UnicodeString;
    function Get_Point: IXMLPointType;
    function Get_Radius: IXMLRadiusType;
    procedure Set_Summarization(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRadiusType }

  TXMLRadiusType = class(TXMLNode, IXMLRadiusType)
  protected
    { IXMLRadiusType }
    function Get_Radiusunits: UnicodeString;
    procedure Set_Radiusunits(Value: UnicodeString);
  end;

{ TXMLRectangleType }

  TXMLRectangleType = class(TXMLNodeCollection, IXMLRectangleType)
  protected
    { IXMLRectangleType }
    function Get_Summarization: UnicodeString;
    function Get_Point(Index: Integer): IXMLPointType;
    procedure Set_Summarization(Value: UnicodeString);
    function Add: IXMLPointType;
    function Insert(const Index: Integer): IXMLPointType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCityType }

  TXMLCityType = class(TXMLNode, IXMLCityType)
  protected
    { IXMLCityType }
    function Get_State: UnicodeString;
    function Get_Summarization: UnicodeString;
    procedure Set_State(Value: UnicodeString);
    procedure Set_Summarization(Value: UnicodeString);
  end;

{ TXMLHeightType }

  TXMLHeightType = class(TXMLNode, IXMLHeightType)
  protected
    { IXMLHeightType }
    function Get_Datum: UnicodeString;
    function Get_Heightunits: UnicodeString;
    procedure Set_Datum(Value: UnicodeString);
    procedure Set_Heightunits(Value: UnicodeString);
  end;

{ TXMLLevelType }

  TXMLLevelType = class(TXMLNode, IXMLLevelType)
  protected
    { IXMLLevelType }
    function Get_Verticalcoordinate: UnicodeString;
    procedure Set_Verticalcoordinate(Value: UnicodeString);
  end;

{ TXMLLayerType }

  TXMLLayerType = class(TXMLNode, IXMLLayerType)
  protected
    { IXMLLayerType }
    function Get_Verticalcoordinate: UnicodeString;
    procedure Set_Verticalcoordinate(Value: UnicodeString);
  end;

{ TXMLMoreWeatherInformationType }

  TXMLMoreWeatherInformationType = class(TXMLNode, IXMLMoreWeatherInformationType)
  protected
    { IXMLMoreWeatherInformationType }
    function Get_Applicablelocation: UnicodeString;
    procedure Set_Applicablelocation(Value: UnicodeString);
  end;

{ TXMLMoreWeatherInformationTypeList }

  TXMLMoreWeatherInformationTypeList = class(TXMLNodeCollection, IXMLMoreWeatherInformationTypeList)
  protected
    { IXMLMoreWeatherInformationTypeList }
    function Add: IXMLMoreWeatherInformationType;
    function Insert(const Index: Integer): IXMLMoreWeatherInformationType;

    function Get_Item(Index: Integer): IXMLMoreWeatherInformationType;
  end;

{ TXMLTimelayoutElementType }

  TXMLTimelayoutElementType = class(TXMLNode, IXMLTimelayoutElementType)
  private
    FStartvalidtime: IXMLStartvalidtimeTypeList;
    FEndvalidtime: IXMLDateTimeList;
  protected
    { IXMLTimelayoutElementType }
    function Get_Timecoordinate: UnicodeString;
    function Get_Summarization: UnicodeString;
    function Get_Layoutkey: UnicodeString;
    function Get_Startvalidtime: IXMLStartvalidtimeTypeList;
    function Get_Endvalidtime: IXMLDateTimeList;
    procedure Set_Timecoordinate(Value: UnicodeString);
    procedure Set_Summarization(Value: UnicodeString);
    procedure Set_Layoutkey(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTimelayoutElementTypeList }

  TXMLTimelayoutElementTypeList = class(TXMLNodeCollection, IXMLTimelayoutElementTypeList)
  protected
    { IXMLTimelayoutElementTypeList }
    function Add: IXMLTimelayoutElementType;
    function Insert(const Index: Integer): IXMLTimelayoutElementType;

    function Get_Item(Index: Integer): IXMLTimelayoutElementType;
  end;

{ TXMLStartvalidtimeType }

  TXMLStartvalidtimeType = class(TXMLNode, IXMLStartvalidtimeType)
  protected
    { IXMLStartvalidtimeType }
    function Get_Periodname: UnicodeString;
    procedure Set_Periodname(Value: UnicodeString);
  end;

{ TXMLStartvalidtimeTypeList }

  TXMLStartvalidtimeTypeList = class(TXMLNodeCollection, IXMLStartvalidtimeTypeList)
  protected
    { IXMLStartvalidtimeTypeList }
    function Add: IXMLStartvalidtimeType;
    function Insert(const Index: Integer): IXMLStartvalidtimeType;

    function Get_Item(Index: Integer): IXMLStartvalidtimeType;
  end;

{ TXMLParametersType }

  TXMLParametersType = class(TXMLNode, IXMLParametersType)
  private
    FCategories: IXMLCategoriesTypeList;
    FTemperature: IXMLTemperatureList;
    FPrecipitation: IXMLPrecipitationList;
    FProbabilityofprecipitation: IXMLProbabilityofprecipitationList;
    FFireweather: IXMLFireweatherList;
    FConvectivehazard: IXMLConvectivehazardList;
    FClimateanomaly: IXMLClimateanomalyList;
    FWindspeed: IXMLWindspeedList;
    FDirection: IXMLDirectionList;
    FCloudamount: IXMLCloudamountList;
    FHumidity: IXMLHumidityList;
    FWeather: IXMLWeatherList;
    FConditionsicon: IXMLConditionsiconList;
    FHazards: IXMLHazardsList;
    FPressure: IXMLPressureList;
    FProbabilisticCondition: IXMLProbabilisticConditionList;
    FWaterstate: IXMLWaterstateList;
  protected
    { IXMLParametersType }
    function Get_Applicablelocation: UnicodeString;
    function Get_Categories: IXMLCategoriesTypeList;
    function Get_Temperature: IXMLTemperatureList;
    function Get_Precipitation: IXMLPrecipitationList;
    function Get_Probabilityofprecipitation: IXMLProbabilityofprecipitationList;
    function Get_Fireweather: IXMLFireweatherList;
    function Get_Convectivehazard: IXMLConvectivehazardList;
    function Get_Climateanomaly: IXMLClimateanomalyList;
    function Get_Windspeed: IXMLWindspeedList;
    function Get_Direction: IXMLDirectionList;
    function Get_Cloudamount: IXMLCloudamountList;
    function Get_Humidity: IXMLHumidityList;
    function Get_Weather: IXMLWeatherList;
    function Get_Conditionsicon: IXMLConditionsiconList;
    function Get_Hazards: IXMLHazardsList;
    function Get_WordedForecast: IXMLWordedForecast;
    function Get_Pressure: IXMLPressureList;
    function Get_ProbabilisticCondition: IXMLProbabilisticConditionList;
    function Get_Waterstate: IXMLWaterstateList;
    procedure Set_Applicablelocation(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLParametersTypeList }

  TXMLParametersTypeList = class(TXMLNodeCollection, IXMLParametersTypeList)
  protected
    { IXMLParametersTypeList }
    function Add: IXMLParametersType;
    function Insert(const Index: Integer): IXMLParametersType;

    function Get_Item(Index: Integer): IXMLParametersType;
  end;

{ TXMLCategoriesType }

  TXMLCategoriesType = class(TXMLNode, IXMLCategoriesType)
  protected
    { IXMLCategoriesType }
    function Get_Type_: UnicodeString;
    function Get_Probabilitytype: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Categorieskey: UnicodeString;
    function Get_ValueList: IXMLValueListType;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Probabilitytype(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Categorieskey(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCategoriesTypeList }

  TXMLCategoriesTypeList = class(TXMLNodeCollection, IXMLCategoriesTypeList)
  protected
    { IXMLCategoriesTypeList }
    function Add: IXMLCategoriesType;
    function Insert(const Index: Integer): IXMLCategoriesType;

    function Get_Item(Index: Integer): IXMLCategoriesType;
  end;

{ TXMLValueListType }

  TXMLValueListType = class(TXMLNode, IXMLValueListType)
  protected
    { IXMLValueListType }
    function Get_Median: UnicodeString;
    function Get_ConfidenceInterval50: UnicodeString;
    function Get_ConfidenceInterval80: UnicodeString;
    function Get_Skew80: UnicodeString;
    procedure Set_Median(Value: UnicodeString);
    procedure Set_ConfidenceInterval50(Value: UnicodeString);
    procedure Set_ConfidenceInterval80(Value: UnicodeString);
    procedure Set_Skew80(Value: UnicodeString);
  end;

{ TXMLValueListTypeList }

  TXMLValueListTypeList = class(TXMLNodeCollection, IXMLValueListTypeList)
  protected
    { IXMLValueListTypeList }
    function Add: IXMLValueListType;
    function Insert(const Index: Integer): IXMLValueListType;

    function Get_Item(Index: Integer): IXMLValueListType;
  end;

{ TXMLTemperature }

  TXMLTemperature = class(TXMLNode, IXMLTemperature)
  private
    FValue: IXMLTempValTypeList;
    FValueList: IXMLValueListTypeList;
    FValueWithUncertainty: IXMLValueWithUncertaintyList;
  protected
    { IXMLTemperature }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_LikelihoodUnits: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Applicablecategories: UnicodeString;
    function Get_Probabilitytype: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLTempValTypeList;
    function Get_ValueList: IXMLValueListTypeList;
    function Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_LikelihoodUnits(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Applicablecategories(Value: UnicodeString);
    procedure Set_Probabilitytype(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTemperatureList }

  TXMLTemperatureList = class(TXMLNodeCollection, IXMLTemperatureList)
  protected
    { IXMLTemperatureList }
    function Add: IXMLTemperature;
    function Insert(const Index: Integer): IXMLTemperature;

    function Get_Item(Index: Integer): IXMLTemperature;
  end;

{ TXMLTempValType }

  TXMLTempValType = class(TXMLNode, IXMLTempValType)
  protected
    { IXMLTempValType }
    function Get_Upperrange: Integer;
    function Get_Lowerrange: Integer;
    function Get_Type_: UnicodeString;
    procedure Set_Upperrange(Value: Integer);
    procedure Set_Lowerrange(Value: Integer);
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLTempValTypeList }

  TXMLTempValTypeList = class(TXMLNodeCollection, IXMLTempValTypeList)
  protected
    { IXMLTempValTypeList }
    function Add: IXMLTempValType;
    function Insert(const Index: Integer): IXMLTempValType;

    function Get_Item(Index: Integer): IXMLTempValType;
  end;

{ TXMLValueWithUncertainty }

  TXMLValueWithUncertainty = class(TXMLNode, IXMLValueWithUncertainty)
  protected
    { IXMLValueWithUncertainty }
    function Get_Type_: UnicodeString;
    function Get_Value: IXMLTempValType;
    function Get_Uncertainty: IXMLUncertaintyType;
    function Get_NumberWithEquality: UnicodeString;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_NumberWithEquality(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLValueWithUncertaintyList }

  TXMLValueWithUncertaintyList = class(TXMLNodeCollection, IXMLValueWithUncertaintyList)
  protected
    { IXMLValueWithUncertaintyList }
    function Add: IXMLValueWithUncertainty;
    function Insert(const Index: Integer): IXMLValueWithUncertainty;

    function Get_Item(Index: Integer): IXMLValueWithUncertainty;
  end;

{ TXMLUncertaintyType }

  TXMLUncertaintyType = class(TXMLNode, IXMLUncertaintyType)
  protected
    { IXMLUncertaintyType }
    function Get_Type_: UnicodeString;
    function Get_Error: IXMLError;
    procedure Set_Type_(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLError }

  TXMLError = class(TXMLNode, IXMLError)
  protected
    { IXMLError }
    function Get_Qualifier: UnicodeString;
    procedure Set_Qualifier(Value: UnicodeString);
  end;

{ TXMLPrecipitation }

  TXMLPrecipitation = class(TXMLNode, IXMLPrecipitation)
  private
    FValue: IXMLDecimalValTypeList;
    FValueList: IXMLValueListTypeList;
    FValueWithUncertainty: IXMLValueWithUncertaintyList;
  protected
    { IXMLPrecipitation }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_LikelihoodUnits: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Probabilitytype: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLDecimalValTypeList;
    function Get_ValueList: IXMLValueListTypeList;
    function Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_LikelihoodUnits(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Probabilitytype(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPrecipitationList }

  TXMLPrecipitationList = class(TXMLNodeCollection, IXMLPrecipitationList)
  protected
    { IXMLPrecipitationList }
    function Add: IXMLPrecipitation;
    function Insert(const Index: Integer): IXMLPrecipitation;

    function Get_Item(Index: Integer): IXMLPrecipitation;
  end;

{ TXMLDecimalValType }

  TXMLDecimalValType = class(TXMLNode, IXMLDecimalValType)
  protected
    { IXMLDecimalValType }
    function Get_Upperrange: LongWord;
    function Get_Lowerrange: LongWord;
    function Get_Type_: UnicodeString;
    procedure Set_Upperrange(Value: LongWord);
    procedure Set_Lowerrange(Value: LongWord);
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLDecimalValTypeList }

  TXMLDecimalValTypeList = class(TXMLNodeCollection, IXMLDecimalValTypeList)
  protected
    { IXMLDecimalValTypeList }
    function Add: IXMLDecimalValType;
    function Insert(const Index: Integer): IXMLDecimalValType;

    function Get_Item(Index: Integer): IXMLDecimalValType;
  end;

{ TXMLProbabilityofprecipitation }

  TXMLProbabilityofprecipitation = class(TXMLNode, IXMLProbabilityofprecipitation)
  private
    FValue: IXMLPercentageValTypeList;
    FValueList: IXMLValueListTypeList;
  protected
    { IXMLProbabilityofprecipitation }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_LikelihoodUnits: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Applicablecategories: UnicodeString;
    function Get_Probabilitytype: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLPercentageValTypeList;
    function Get_ValueList: IXMLValueListTypeList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_LikelihoodUnits(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Applicablecategories(Value: UnicodeString);
    procedure Set_Probabilitytype(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLProbabilityofprecipitationList }

  TXMLProbabilityofprecipitationList = class(TXMLNodeCollection, IXMLProbabilityofprecipitationList)
  protected
    { IXMLProbabilityofprecipitationList }
    function Add: IXMLProbabilityofprecipitation;
    function Insert(const Index: Integer): IXMLProbabilityofprecipitation;

    function Get_Item(Index: Integer): IXMLProbabilityofprecipitation;
  end;

{ TXMLPercentageValType }

  TXMLPercentageValType = class(TXMLNode, IXMLPercentageValType)
  protected
    { IXMLPercentageValType }
    function Get_Upperrange: LongWord;
    function Get_Lowerrange: LongWord;
    function Get_Type_: UnicodeString;
    procedure Set_Upperrange(Value: LongWord);
    procedure Set_Lowerrange(Value: LongWord);
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLPercentageValTypeList }

  TXMLPercentageValTypeList = class(TXMLNodeCollection, IXMLPercentageValTypeList)
  protected
    { IXMLPercentageValTypeList }
    function Add: IXMLPercentageValType;
    function Insert(const Index: Integer): IXMLPercentageValType;

    function Get_Item(Index: Integer): IXMLPercentageValType;
  end;

{ TXMLFireweather }

  TXMLFireweather = class(TXMLNode, IXMLFireweather)
  private
    FValue: IXMLValueList;
  protected
    { IXMLFireweather }
    function Get_Type_: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLValueList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFireweatherList }

  TXMLFireweatherList = class(TXMLNodeCollection, IXMLFireweatherList)
  protected
    { IXMLFireweatherList }
    function Add: IXMLFireweather;
    function Insert(const Index: Integer): IXMLFireweather;

    function Get_Item(Index: Integer): IXMLFireweather;
  end;

{ TXMLConvectivehazard }

  TXMLConvectivehazard = class(TXMLNode, IXMLConvectivehazard)
  private
    FSeverecomponent: IXMLSeverecomponentList;
  protected
    { IXMLConvectivehazard }
    function Get_Outlook: IXMLOutlook;
    function Get_Severecomponent: IXMLSeverecomponentList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLConvectivehazardList }

  TXMLConvectivehazardList = class(TXMLNodeCollection, IXMLConvectivehazardList)
  protected
    { IXMLConvectivehazardList }
    function Add: IXMLConvectivehazard;
    function Insert(const Index: Integer): IXMLConvectivehazard;

    function Get_Item(Index: Integer): IXMLConvectivehazard;
  end;

{ TXMLOutlook }

  TXMLOutlook = class(TXMLNode, IXMLOutlook)
  private
    FValue: IXMLValueList;
  protected
    { IXMLOutlook }
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLValueList;
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSeverecomponent }

  TXMLSeverecomponent = class(TXMLNode, IXMLSeverecomponent)
  private
    FValue: IXMLValueList;
  protected
    { IXMLSeverecomponent }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLValueList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSeverecomponentList }

  TXMLSeverecomponentList = class(TXMLNodeCollection, IXMLSeverecomponentList)
  protected
    { IXMLSeverecomponentList }
    function Add: IXMLSeverecomponent;
    function Insert(const Index: Integer): IXMLSeverecomponent;

    function Get_Item(Index: Integer): IXMLSeverecomponent;
  end;

{ TXMLValue }

  TXMLValue = class(TXMLNode, IXMLValue)
  protected
    { IXMLValue }
    function Get_Upperrange: LongWord;
    function Get_Lowerrange: LongWord;
    procedure Set_Upperrange(Value: LongWord);
    procedure Set_Lowerrange(Value: LongWord);
  end;

{ TXMLValueList }

  TXMLValueList = class(TXMLNodeCollection, IXMLValueList)
  protected
    { IXMLValueList }
    function Add: IXMLValue;
    function Insert(const Index: Integer): IXMLValue;

    function Get_Item(Index: Integer): IXMLValue;
  end;

{ TXMLClimateanomaly }

  TXMLClimateanomaly = class(TXMLNode, IXMLClimateanomaly)
  private
    FWeekly: IXMLAnomalyTypeList;
    FMonthly: IXMLAnomalyTypeList;
    FSeasonal: IXMLAnomalyTypeList;
  protected
    { IXMLClimateanomaly }
    function Get_Weekly: IXMLAnomalyTypeList;
    function Get_Monthly: IXMLAnomalyTypeList;
    function Get_Seasonal: IXMLAnomalyTypeList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLClimateanomalyList }

  TXMLClimateanomalyList = class(TXMLNodeCollection, IXMLClimateanomalyList)
  protected
    { IXMLClimateanomalyList }
    function Add: IXMLClimateanomaly;
    function Insert(const Index: Integer): IXMLClimateanomaly;

    function Get_Item(Index: Integer): IXMLClimateanomaly;
  end;

{ TXMLAnomalyType }

  TXMLAnomalyType = class(TXMLNode, IXMLAnomalyType)
  private
    FValue: IXMLValueList;
  protected
    { IXMLAnomalyType }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLValueList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAnomalyTypeList }

  TXMLAnomalyTypeList = class(TXMLNodeCollection, IXMLAnomalyTypeList)
  protected
    { IXMLAnomalyTypeList }
    function Add: IXMLAnomalyType;
    function Insert(const Index: Integer): IXMLAnomalyType;

    function Get_Item(Index: Integer): IXMLAnomalyType;
  end;

{ TXMLWindspeed }

  TXMLWindspeed = class(TXMLNode, IXMLWindspeed)
  private
    FValue: IXMLWspdValTypeList;
    FValueWithUncertainty: IXMLValueWithUncertaintyList;
  protected
    { IXMLWindspeed }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLWspdValTypeList;
    function Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLWindspeedList }

  TXMLWindspeedList = class(TXMLNodeCollection, IXMLWindspeedList)
  protected
    { IXMLWindspeedList }
    function Add: IXMLWindspeed;
    function Insert(const Index: Integer): IXMLWindspeed;

    function Get_Item(Index: Integer): IXMLWindspeed;
  end;

{ TXMLWspdValType }

  TXMLWspdValType = class(TXMLNode, IXMLWspdValType)
  protected
    { IXMLWspdValType }
    function Get_Upperrange: LongWord;
    function Get_Lowerrange: LongWord;
    function Get_Type_: UnicodeString;
    procedure Set_Upperrange(Value: LongWord);
    procedure Set_Lowerrange(Value: LongWord);
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLWspdValTypeList }

  TXMLWspdValTypeList = class(TXMLNodeCollection, IXMLWspdValTypeList)
  protected
    { IXMLWspdValTypeList }
    function Add: IXMLWspdValType;
    function Insert(const Index: Integer): IXMLWspdValType;

    function Get_Item(Index: Integer): IXMLWspdValType;
  end;

{ TXMLDirection }

  TXMLDirection = class(TXMLNode, IXMLDirection)
  private
    FValue: IXMLWdirValTypeList;
    FValueWithUncertainty: IXMLValueWithUncertaintyList;
  protected
    { IXMLDirection }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLWdirValTypeList;
    function Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDirectionList }

  TXMLDirectionList = class(TXMLNodeCollection, IXMLDirectionList)
  protected
    { IXMLDirectionList }
    function Add: IXMLDirection;
    function Insert(const Index: Integer): IXMLDirection;

    function Get_Item(Index: Integer): IXMLDirection;
  end;

{ TXMLWdirValType }

  TXMLWdirValType = class(TXMLNode, IXMLWdirValType)
  protected
    { IXMLWdirValType }
    function Get_Upperrange: LongWord;
    function Get_Lowerrange: LongWord;
    function Get_Type_: UnicodeString;
    procedure Set_Upperrange(Value: LongWord);
    procedure Set_Lowerrange(Value: LongWord);
    procedure Set_Type_(Value: UnicodeString);
  end;

{ TXMLWdirValTypeList }

  TXMLWdirValTypeList = class(TXMLNodeCollection, IXMLWdirValTypeList)
  protected
    { IXMLWdirValTypeList }
    function Add: IXMLWdirValType;
    function Insert(const Index: Integer): IXMLWdirValType;

    function Get_Item(Index: Integer): IXMLWdirValType;
  end;

{ TXMLCloudamount }

  TXMLCloudamount = class(TXMLNode, IXMLCloudamount)
  private
    FValue: IXMLPercentageValTypeList;
    FValueWithUncertainty: IXMLValueWithUncertaintyList;
  protected
    { IXMLCloudamount }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLPercentageValTypeList;
    function Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCloudamountList }

  TXMLCloudamountList = class(TXMLNodeCollection, IXMLCloudamountList)
  protected
    { IXMLCloudamountList }
    function Add: IXMLCloudamount;
    function Insert(const Index: Integer): IXMLCloudamount;

    function Get_Item(Index: Integer): IXMLCloudamount;
  end;

{ TXMLHumidity }

  TXMLHumidity = class(TXMLNode, IXMLHumidity)
  private
    FValue: IXMLValueList;
  protected
    { IXMLHumidity }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLValueList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLHumidityList }

  TXMLHumidityList = class(TXMLNodeCollection, IXMLHumidityList)
  protected
    { IXMLHumidityList }
    function Add: IXMLHumidity;
    function Insert(const Index: Integer): IXMLHumidity;

    function Get_Item(Index: Integer): IXMLHumidity;
  end;

{ TXMLWeather }

  TXMLWeather = class(TXMLNode, IXMLWeather)
  private
    FName: IXMLString_List;
    FWeatherconditions: IXMLWeatherconditionsList;
  protected
    { IXMLWeather }
    function Get_Timelayout: UnicodeString;
    function Get_Name: IXMLString_List;
    function Get_Weatherconditions: IXMLWeatherconditionsList;
    procedure Set_Timelayout(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLWeatherList }

  TXMLWeatherList = class(TXMLNodeCollection, IXMLWeatherList)
  protected
    { IXMLWeatherList }
    function Add: IXMLWeather;
    function Insert(const Index: Integer): IXMLWeather;

    function Get_Item(Index: Integer): IXMLWeather;
  end;

{ TXMLWeatherconditions }

  TXMLWeatherconditions = class(TXMLNodeCollection, IXMLWeatherconditions)
  protected
    { IXMLWeatherconditions }
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Weathersummary: UnicodeString;
    function Get_Value(Index: Integer): IXMLValue;
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Weathersummary(Value: UnicodeString);
    function Add: IXMLValue;
    function Insert(const Index: Integer): IXMLValue;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLWeatherconditionsList }

  TXMLWeatherconditionsList = class(TXMLNodeCollection, IXMLWeatherconditionsList)
  protected
    { IXMLWeatherconditionsList }
    function Add: IXMLWeatherconditions;
    function Insert(const Index: Integer): IXMLWeatherconditions;

    function Get_Item(Index: Integer): IXMLWeatherconditions;
  end;

{ TXMLConditionsicon }

  TXMLConditionsicon = class(TXMLNode, IXMLConditionsicon)
  private
    FIconlink: IXMLAnyURIList;
  protected
    { IXMLConditionsicon }
    function Get_Timelayout: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Iconlink: IXMLAnyURIList;
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLConditionsiconList }

  TXMLConditionsiconList = class(TXMLNodeCollection, IXMLConditionsiconList)
  protected
    { IXMLConditionsiconList }
    function Add: IXMLConditionsicon;
    function Insert(const Index: Integer): IXMLConditionsicon;

    function Get_Item(Index: Integer): IXMLConditionsicon;
  end;

{ TXMLHazards }

  TXMLHazards = class(TXMLNode, IXMLHazards)
  private
    FName: IXMLString_List;
    FHazardconditions: IXMLHazardconditionsList;
  protected
    { IXMLHazards }
    function Get_Timelayout: UnicodeString;
    function Get_Name: IXMLString_List;
    function Get_Hazardconditions: IXMLHazardconditionsList;
    procedure Set_Timelayout(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLHazardsList }

  TXMLHazardsList = class(TXMLNodeCollection, IXMLHazardsList)
  protected
    { IXMLHazardsList }
    function Add: IXMLHazards;
    function Insert(const Index: Integer): IXMLHazards;

    function Get_Item(Index: Integer): IXMLHazards;
  end;

{ TXMLHazardconditions }

  TXMLHazardconditions = class(TXMLNodeCollection, IXMLHazardconditions)
  protected
    { IXMLHazardconditions }
    function Get_Hazard(Index: Integer): IXMLHazard;
    function Add: IXMLHazard;
    function Insert(const Index: Integer): IXMLHazard;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLHazardconditionsList }

  TXMLHazardconditionsList = class(TXMLNodeCollection, IXMLHazardconditionsList)
  protected
    { IXMLHazardconditionsList }
    function Add: IXMLHazardconditions;
    function Insert(const Index: Integer): IXMLHazardconditions;

    function Get_Item(Index: Integer): IXMLHazardconditions;
  end;

{ TXMLHazard }

  TXMLHazard = class(TXMLNode, IXMLHazard)
  protected
    { IXMLHazard }
    function Get_HazardCode: UnicodeString;
    function Get_Phenomena: UnicodeString;
    function Get_Significance: UnicodeString;
    function Get_HazardType: UnicodeString;
    function Get_EventTrackingNumber: Integer;
    function Get_Headline: UnicodeString;
    function Get_HazardTextURL: UnicodeString;
    function Get_HazardIcon: UnicodeString;
    procedure Set_HazardCode(Value: UnicodeString);
    procedure Set_Phenomena(Value: UnicodeString);
    procedure Set_Significance(Value: UnicodeString);
    procedure Set_HazardType(Value: UnicodeString);
    procedure Set_EventTrackingNumber(Value: Integer);
    procedure Set_Headline(Value: UnicodeString);
    procedure Set_HazardTextURL(Value: UnicodeString);
    procedure Set_HazardIcon(Value: UnicodeString);
  end;

{ TXMLWordedForecast }

  TXMLWordedForecast = class(TXMLNode, IXMLWordedForecast)
  private
    FText: IXMLString_List;
  protected
    { IXMLWordedForecast }
    function Get_Timelayout: UnicodeString;
    function Get_DataSource: UnicodeString;
    function Get_WordGenerator: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Text: IXMLString_List;
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_DataSource(Value: UnicodeString);
    procedure Set_WordGenerator(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPressure }

  TXMLPressure = class(TXMLNode, IXMLPressure)
  private
    FValue: IXMLDecimalValTypeList;
  protected
    { IXMLPressure }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLDecimalValTypeList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLPressureList }

  TXMLPressureList = class(TXMLNodeCollection, IXMLPressureList)
  protected
    { IXMLPressureList }
    function Add: IXMLPressure;
    function Insert(const Index: Integer): IXMLPressure;

    function Get_Item(Index: Integer): IXMLPressure;
  end;

{ TXMLProbabilisticCondition }

  TXMLProbabilisticCondition = class(TXMLNode, IXMLProbabilisticCondition)
  private
    FValue: IXMLPercentageValTypeList;
    FValueForRange: IXMLValueForRangeTypeList;
  protected
    { IXMLProbabilisticCondition }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_LikelihoodUnits: UnicodeString;
    function Get_Timelayout: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Applicablecategories: UnicodeString;
    function Get_Probabilitytype: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLPercentageValTypeList;
    function Get_ValueForRange: IXMLValueForRangeTypeList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_LikelihoodUnits(Value: UnicodeString);
    procedure Set_Timelayout(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Applicablecategories(Value: UnicodeString);
    procedure Set_Probabilitytype(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLProbabilisticConditionList }

  TXMLProbabilisticConditionList = class(TXMLNodeCollection, IXMLProbabilisticConditionList)
  protected
    { IXMLProbabilisticConditionList }
    function Add: IXMLProbabilisticCondition;
    function Insert(const Index: Integer): IXMLProbabilisticCondition;

    function Get_Item(Index: Integer): IXMLProbabilisticCondition;
  end;

{ TXMLValueForRangeType }

  TXMLValueForRangeType = class(TXMLNode, IXMLValueForRangeType)
  private
    FValue: IXMLPercentageValTypeList;
  protected
    { IXMLValueForRangeType }
    function Get_Value: IXMLPercentageValTypeList;
    function Get_Gt: UnicodeString;
    function Get_Ge: UnicodeString;
    function Get_Lt: UnicodeString;
    function Get_Le: UnicodeString;
    function Get_Eq: UnicodeString;
    procedure Set_Gt(Value: UnicodeString);
    procedure Set_Ge(Value: UnicodeString);
    procedure Set_Lt(Value: UnicodeString);
    procedure Set_Le(Value: UnicodeString);
    procedure Set_Eq(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLValueForRangeTypeList }

  TXMLValueForRangeTypeList = class(TXMLNodeCollection, IXMLValueForRangeTypeList)
  protected
    { IXMLValueForRangeTypeList }
    function Add: IXMLValueForRangeType;
    function Insert(const Index: Integer): IXMLValueForRangeType;

    function Get_Item(Index: Integer): IXMLValueForRangeType;
  end;

{ TXMLWaterstate }

  TXMLWaterstate = class(TXMLNode, IXMLWaterstate)
  private
    FWaves: IXMLWavesList;
    FSwell: IXMLSwellList;
    FSeas: IXMLSeasList;
    FIcecoverage: IXMLNonNegativeIntegerList;
  protected
    { IXMLWaterstate }
    function Get_Timelayout: UnicodeString;
    function Get_Waves: IXMLWavesList;
    function Get_Swell: IXMLSwellList;
    function Get_Seas: IXMLSeasList;
    function Get_Icecoverage: IXMLNonNegativeIntegerList;
    procedure Set_Timelayout(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLWaterstateList }

  TXMLWaterstateList = class(TXMLNodeCollection, IXMLWaterstateList)
  protected
    { IXMLWaterstateList }
    function Add: IXMLWaterstate;
    function Insert(const Index: Integer): IXMLWaterstate;

    function Get_Item(Index: Integer): IXMLWaterstate;
  end;

{ TXMLWaves }

  TXMLWaves = class(TXMLNode, IXMLWaves)
  private
    FValue: IXMLNonNegativeIntegerList;
  protected
    { IXMLWaves }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Period: LongWord;
    function Get_Steepness: LongWord;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLNonNegativeIntegerList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Period(Value: LongWord);
    procedure Set_Steepness(Value: LongWord);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLWavesList }

  TXMLWavesList = class(TXMLNodeCollection, IXMLWavesList)
  protected
    { IXMLWavesList }
    function Add: IXMLWaves;
    function Insert(const Index: Integer): IXMLWaves;

    function Get_Item(Index: Integer): IXMLWaves;
  end;

{ TXMLSwell }

  TXMLSwell = class(TXMLNode, IXMLSwell)
  protected
    { IXMLSwell }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Period: LongWord;
    function Get_Steepness: LongWord;
    function Get_Name: UnicodeString;
    function Get_Value: UnicodeString;
    function Get_Direction: IXMLDirection;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Period(Value: LongWord);
    procedure Set_Steepness(Value: LongWord);
    procedure Set_Name(Value: UnicodeString);
    procedure Set_Value(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSwellList }

  TXMLSwellList = class(TXMLNodeCollection, IXMLSwellList)
  protected
    { IXMLSwellList }
    function Add: IXMLSwell;
    function Insert(const Index: Integer): IXMLSwell;

    function Get_Item(Index: Integer): IXMLSwell;
  end;

{ TXMLSeas }

  TXMLSeas = class(TXMLNode, IXMLSeas)
  private
    FValue: IXMLNonNegativeIntegerList;
  protected
    { IXMLSeas }
    function Get_Type_: UnicodeString;
    function Get_Units: UnicodeString;
    function Get_Categoricaltable: UnicodeString;
    function Get_Conversiontable: UnicodeString;
    function Get_Name: UnicodeString;
    function Get_Value: IXMLNonNegativeIntegerList;
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_Units(Value: UnicodeString);
    procedure Set_Categoricaltable(Value: UnicodeString);
    procedure Set_Conversiontable(Value: UnicodeString);
    procedure Set_Name(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSeasList }

  TXMLSeasList = class(TXMLNodeCollection, IXMLSeasList)
  protected
    { IXMLSeasList }
    function Add: IXMLSeas;
    function Insert(const Index: Integer): IXMLSeas;

    function Get_Item(Index: Integer): IXMLSeas;
  end;

{ TXMLNonNegativeIntegerList }

  TXMLNonNegativeIntegerList = class(TXMLNodeCollection, IXMLNonNegativeIntegerList)
  protected
    { IXMLNonNegativeIntegerList }
    function Add(const Value: LongWord): IXMLNode;
    function Insert(const Index: Integer; const Value: LongWord): IXMLNode;

    function Get_Item(Index: Integer): LongWord;
  end;

{ TXMLDateTimeList }

  TXMLDateTimeList = class(TXMLNodeCollection, IXMLDateTimeList)
  protected
    { IXMLDateTimeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
  end;

{ TXMLAnyURIList }

  TXMLAnyURIList = class(TXMLNodeCollection, IXMLAnyURIList)
  protected
    { IXMLAnyURIList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
  end;

{ TXMLString_List }

  TXMLString_List = class(TXMLNodeCollection, IXMLString_List)
  protected
    { IXMLString_List }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
  end;

{ Global Functions }

function Getdwml(Doc: IXMLDocument): IXMLDwml;
function Loaddwml(const FileName: string): IXMLDwml;
function Newdwml: IXMLDwml;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getdwml(Doc: IXMLDocument): IXMLDwml;
begin
  Result := Doc.GetDocBinding('dwml', TXMLDwml, TargetNamespace) as IXMLDwml;
end;

function Loaddwml(const FileName: string): IXMLDwml;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('dwml', TXMLDwml, TargetNamespace) as IXMLDwml;
end;

function Newdwml: IXMLDwml;
begin
  Result := NewXMLDocument.GetDocBinding('dwml', TXMLDwml, TargetNamespace) as IXMLDwml;
end;

{ TXMLDwml }

procedure TXMLDwml.AfterConstruction;
begin
  RegisterChildNode('head', TXMLHeadType);
  RegisterChildNode('data', TXMLDataType);
  FData := CreateCollection(TXMLDataTypeList, IXMLDataType, 'data') as IXMLDataTypeList;
  inherited;
end;

function TXMLDwml.Get_Version: UnicodeString;
begin
  Result := AttributeNodes['version'].Text;
end;

procedure TXMLDwml.Set_Version(Value: UnicodeString);
begin
  SetAttribute('version', Value);
end;

function TXMLDwml.Get_Head: IXMLHeadType;
begin
  Result := ChildNodes['head'] as IXMLHeadType;
end;

function TXMLDwml.Get_Data: IXMLDataTypeList;
begin
  Result := FData;
end;

function TXMLDwml.Get_MinResolution: UnicodeString;
begin
  Result := ChildNodes['minResolution'].Text;
end;

procedure TXMLDwml.Set_MinResolution(Value: UnicodeString);
begin
  ChildNodes['minResolution'].NodeValue := Value;
end;

function TXMLDwml.Get_LatLonList: UnicodeString;
begin
  Result := ChildNodes['latLonList'].Text;
end;

procedure TXMLDwml.Set_LatLonList(Value: UnicodeString);
begin
  ChildNodes['latLonList'].NodeValue := Value;
end;

function TXMLDwml.Get_CityNameList: UnicodeString;
begin
  Result := ChildNodes['cityNameList'].Text;
end;

procedure TXMLDwml.Set_CityNameList(Value: UnicodeString);
begin
  ChildNodes['cityNameList'].NodeValue := Value;
end;

{ TXMLHeadType }

procedure TXMLHeadType.AfterConstruction;
begin
  RegisterChildNode('product', TXMLProductType);
  RegisterChildNode('source', TXMLSourceType);
  inherited;
end;

function TXMLHeadType.Get_Product: IXMLProductType;
begin
  Result := ChildNodes['product'] as IXMLProductType;
end;

function TXMLHeadType.Get_Source: IXMLSourceType;
begin
  Result := ChildNodes['source'] as IXMLSourceType;
end;

{ TXMLProductType }

procedure TXMLProductType.AfterConstruction;
begin
  RegisterChildNode('creation-date', TXMLCreationdateType);
  inherited;
end;

function TXMLProductType.Get_Concisename: UnicodeString;
begin
  Result := AttributeNodes['concise-name'].Text;
end;

procedure TXMLProductType.Set_Concisename(Value: UnicodeString);
begin
  SetAttribute('concise-name', Value);
end;

function TXMLProductType.Get_Operationalmode: UnicodeString;
begin
  Result := AttributeNodes['operational-mode'].Text;
end;

procedure TXMLProductType.Set_Operationalmode(Value: UnicodeString);
begin
  SetAttribute('operational-mode', Value);
end;

function TXMLProductType.Get_SrsName: UnicodeString;
begin
  Result := AttributeNodes['srsName'].Text;
end;

procedure TXMLProductType.Set_SrsName(Value: UnicodeString);
begin
  SetAttribute('srsName', Value);
end;

function TXMLProductType.Get_Title: UnicodeString;
begin
  Result := ChildNodes['title'].Text;
end;

procedure TXMLProductType.Set_Title(Value: UnicodeString);
begin
  ChildNodes['title'].NodeValue := Value;
end;

function TXMLProductType.Get_Field: UnicodeString;
begin
  Result := ChildNodes['field'].Text;
end;

procedure TXMLProductType.Set_Field(Value: UnicodeString);
begin
  ChildNodes['field'].NodeValue := Value;
end;

function TXMLProductType.Get_Category: UnicodeString;
begin
  Result := ChildNodes['category'].Text;
end;

procedure TXMLProductType.Set_Category(Value: UnicodeString);
begin
  ChildNodes['category'].NodeValue := Value;
end;

function TXMLProductType.Get_Creationdate: IXMLCreationdateType;
begin
  Result := ChildNodes['creation-date'] as IXMLCreationdateType;
end;

{ TXMLCreationdateType }

function TXMLCreationdateType.Get_Refreshfrequency: UnicodeString;
begin
  Result := AttributeNodes['refresh-frequency'].Text;
end;

procedure TXMLCreationdateType.Set_Refreshfrequency(Value: UnicodeString);
begin
  SetAttribute('refresh-frequency', Value);
end;

{ TXMLSourceType }

procedure TXMLSourceType.AfterConstruction;
begin
  RegisterChildNode('production-center', TXMLProductioncenterType);
  inherited;
end;

function TXMLSourceType.Get_Moreinformation: UnicodeString;
begin
  Result := ChildNodes['more-information'].Text;
end;

procedure TXMLSourceType.Set_Moreinformation(Value: UnicodeString);
begin
  ChildNodes['more-information'].NodeValue := Value;
end;

function TXMLSourceType.Get_Productioncenter: IXMLProductioncenterType;
begin
  Result := ChildNodes['production-center'] as IXMLProductioncenterType;
end;

function TXMLSourceType.Get_Disclaimer: UnicodeString;
begin
  Result := ChildNodes['disclaimer'].Text;
end;

procedure TXMLSourceType.Set_Disclaimer(Value: UnicodeString);
begin
  ChildNodes['disclaimer'].NodeValue := Value;
end;

function TXMLSourceType.Get_Credit: UnicodeString;
begin
  Result := ChildNodes['credit'].Text;
end;

procedure TXMLSourceType.Set_Credit(Value: UnicodeString);
begin
  ChildNodes['credit'].NodeValue := Value;
end;

function TXMLSourceType.Get_Creditlogo: UnicodeString;
begin
  Result := ChildNodes['credit-logo'].Text;
end;

procedure TXMLSourceType.Set_Creditlogo(Value: UnicodeString);
begin
  ChildNodes['credit-logo'].NodeValue := Value;
end;

function TXMLSourceType.Get_Feedback: UnicodeString;
begin
  Result := ChildNodes['feedback'].Text;
end;

procedure TXMLSourceType.Set_Feedback(Value: UnicodeString);
begin
  ChildNodes['feedback'].NodeValue := Value;
end;

{ TXMLProductioncenterType }

function TXMLProductioncenterType.Get_Subcenter: UnicodeString;
begin
  Result := ChildNodes['sub-center'].Text;
end;

procedure TXMLProductioncenterType.Set_Subcenter(Value: UnicodeString);
begin
  ChildNodes['sub-center'].NodeValue := Value;
end;

{ TXMLDataType }

procedure TXMLDataType.AfterConstruction;
begin
  RegisterChildNode('location', TXMLLocationType);
  RegisterChildNode('moreWeatherInformation', TXMLMoreWeatherInformationType);
  RegisterChildNode('time-layout', TXMLTimelayoutElementType);
  RegisterChildNode('parameters', TXMLParametersType);
  FLocation := CreateCollection(TXMLLocationTypeList, IXMLLocationType, 'location') as IXMLLocationTypeList;
  FMoreWeatherInformation := CreateCollection(TXMLMoreWeatherInformationTypeList, IXMLMoreWeatherInformationType, 'moreWeatherInformation') as IXMLMoreWeatherInformationTypeList;
  FTimelayout := CreateCollection(TXMLTimelayoutElementTypeList, IXMLTimelayoutElementType, 'time-layout') as IXMLTimelayoutElementTypeList;
  FParameters := CreateCollection(TXMLParametersTypeList, IXMLParametersType, 'parameters') as IXMLParametersTypeList;
  inherited;
end;

function TXMLDataType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLDataType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLDataType.Get_Location: IXMLLocationTypeList;
begin
  Result := FLocation;
end;

function TXMLDataType.Get_MoreWeatherInformation: IXMLMoreWeatherInformationTypeList;
begin
  Result := FMoreWeatherInformation;
end;

function TXMLDataType.Get_Timelayout: IXMLTimelayoutElementTypeList;
begin
  Result := FTimelayout;
end;

function TXMLDataType.Get_Parameters: IXMLParametersTypeList;
begin
  Result := FParameters;
end;

{ TXMLDataTypeList }

function TXMLDataTypeList.Add: IXMLDataType;
begin
  Result := AddItem(-1) as IXMLDataType;
end;

function TXMLDataTypeList.Insert(const Index: Integer): IXMLDataType;
begin
  Result := AddItem(Index) as IXMLDataType;
end;

function TXMLDataTypeList.Get_Item(Index: Integer): IXMLDataType;
begin
  Result := List[Index] as IXMLDataType;
end;

{ TXMLLocationType }

procedure TXMLLocationType.AfterConstruction;
begin
  RegisterChildNode('point', TXMLPointType);
  RegisterChildNode('nws-zone', TXMLNwszoneType);
  RegisterChildNode('area', TXMLAreaType);
  RegisterChildNode('city', TXMLCityType);
  RegisterChildNode('height', TXMLHeightType);
  RegisterChildNode('level', TXMLLevelType);
  RegisterChildNode('layer', TXMLLayerType);
  inherited;
end;

function TXMLLocationType.Get_Locationkey: UnicodeString;
begin
  Result := ChildNodes['location-key'].Text;
end;

procedure TXMLLocationType.Set_Locationkey(Value: UnicodeString);
begin
  ChildNodes['location-key'].NodeValue := Value;
end;

function TXMLLocationType.Get_Description: UnicodeString;
begin
  Result := ChildNodes['description'].Text;
end;

procedure TXMLLocationType.Set_Description(Value: UnicodeString);
begin
  ChildNodes['description'].NodeValue := Value;
end;

function TXMLLocationType.Get_Point: IXMLPointType;
begin
  Result := ChildNodes['point'] as IXMLPointType;
end;

function TXMLLocationType.Get_Nwszone: IXMLNwszoneType;
begin
  Result := ChildNodes['nws-zone'] as IXMLNwszoneType;
end;

function TXMLLocationType.Get_Area: IXMLAreaType;
begin
  Result := ChildNodes['area'] as IXMLAreaType;
end;

function TXMLLocationType.Get_City: IXMLCityType;
begin
  Result := ChildNodes['city'] as IXMLCityType;
end;

function TXMLLocationType.Get_Areadescription: UnicodeString;
begin
  Result := ChildNodes['area-description'].Text;
end;

procedure TXMLLocationType.Set_Areadescription(Value: UnicodeString);
begin
  ChildNodes['area-description'].NodeValue := Value;
end;

function TXMLLocationType.Get_Height: IXMLHeightType;
begin
  Result := ChildNodes['height'] as IXMLHeightType;
end;

function TXMLLocationType.Get_Level: IXMLLevelType;
begin
  Result := ChildNodes['level'] as IXMLLevelType;
end;

function TXMLLocationType.Get_Layer: IXMLLayerType;
begin
  Result := ChildNodes['layer'] as IXMLLayerType;
end;

{ TXMLLocationTypeList }

function TXMLLocationTypeList.Add: IXMLLocationType;
begin
  Result := AddItem(-1) as IXMLLocationType;
end;

function TXMLLocationTypeList.Insert(const Index: Integer): IXMLLocationType;
begin
  Result := AddItem(Index) as IXMLLocationType;
end;

function TXMLLocationTypeList.Get_Item(Index: Integer): IXMLLocationType;
begin
  Result := List[Index] as IXMLLocationType;
end;

{ TXMLPointType }

function TXMLPointType.Get_Latitude: UnicodeString;
begin
  Result := AttributeNodes['latitude'].Text;
end;

procedure TXMLPointType.Set_Latitude(Value: UnicodeString);
begin
  SetAttribute('latitude', Value);
end;

function TXMLPointType.Get_Longitude: UnicodeString;
begin
  Result := AttributeNodes['longitude'].Text;
end;

procedure TXMLPointType.Set_Longitude(Value: UnicodeString);
begin
  SetAttribute('longitude', Value);
end;

function TXMLPointType.Get_Summarization: UnicodeString;
begin
  Result := AttributeNodes['summarization'].Text;
end;

procedure TXMLPointType.Set_Summarization(Value: UnicodeString);
begin
  SetAttribute('summarization', Value);
end;

{ TXMLNwszoneType }

function TXMLNwszoneType.Get_State: UnicodeString;
begin
  Result := AttributeNodes['state'].Text;
end;

procedure TXMLNwszoneType.Set_State(Value: UnicodeString);
begin
  SetAttribute('state', Value);
end;

function TXMLNwszoneType.Get_Summarization: UnicodeString;
begin
  Result := AttributeNodes['summarization'].Text;
end;

procedure TXMLNwszoneType.Set_Summarization(Value: UnicodeString);
begin
  SetAttribute('summarization', Value);
end;

{ TXMLAreaType }

procedure TXMLAreaType.AfterConstruction;
begin
  RegisterChildNode('circle', TXMLCircleType);
  RegisterChildNode('rectangle', TXMLRectangleType);
  inherited;
end;

function TXMLAreaType.Get_Areatype: UnicodeString;
begin
  Result := AttributeNodes['area-type'].Text;
end;

procedure TXMLAreaType.Set_Areatype(Value: UnicodeString);
begin
  SetAttribute('area-type', Value);
end;

function TXMLAreaType.Get_Circle: IXMLCircleType;
begin
  Result := ChildNodes['circle'] as IXMLCircleType;
end;

function TXMLAreaType.Get_Rectangle: IXMLRectangleType;
begin
  Result := ChildNodes['rectangle'] as IXMLRectangleType;
end;

{ TXMLCircleType }

procedure TXMLCircleType.AfterConstruction;
begin
  RegisterChildNode('point', TXMLPointType);
  RegisterChildNode('radius', TXMLRadiusType);
  inherited;
end;

function TXMLCircleType.Get_Summarization: UnicodeString;
begin
  Result := AttributeNodes['summarization'].Text;
end;

procedure TXMLCircleType.Set_Summarization(Value: UnicodeString);
begin
  SetAttribute('summarization', Value);
end;

function TXMLCircleType.Get_Point: IXMLPointType;
begin
  Result := ChildNodes['point'] as IXMLPointType;
end;

function TXMLCircleType.Get_Radius: IXMLRadiusType;
begin
  Result := ChildNodes['radius'] as IXMLRadiusType;
end;

{ TXMLRadiusType }

function TXMLRadiusType.Get_Radiusunits: UnicodeString;
begin
  Result := AttributeNodes['radius-units'].Text;
end;

procedure TXMLRadiusType.Set_Radiusunits(Value: UnicodeString);
begin
  SetAttribute('radius-units', Value);
end;

{ TXMLRectangleType }

procedure TXMLRectangleType.AfterConstruction;
begin
  RegisterChildNode('point', TXMLPointType);
  ItemTag := 'point';
  ItemInterface := IXMLPointType;
  inherited;
end;

function TXMLRectangleType.Get_Summarization: UnicodeString;
begin
  Result := AttributeNodes['summarization'].Text;
end;

procedure TXMLRectangleType.Set_Summarization(Value: UnicodeString);
begin
  SetAttribute('summarization', Value);
end;

function TXMLRectangleType.Get_Point(Index: Integer): IXMLPointType;
begin
  Result := List[Index] as IXMLPointType;
end;

function TXMLRectangleType.Add: IXMLPointType;
begin
  Result := AddItem(-1) as IXMLPointType;
end;

function TXMLRectangleType.Insert(const Index: Integer): IXMLPointType;
begin
  Result := AddItem(Index) as IXMLPointType;
end;

{ TXMLCityType }

function TXMLCityType.Get_State: UnicodeString;
begin
  Result := AttributeNodes['state'].Text;
end;

procedure TXMLCityType.Set_State(Value: UnicodeString);
begin
  SetAttribute('state', Value);
end;

function TXMLCityType.Get_Summarization: UnicodeString;
begin
  Result := AttributeNodes['summarization'].Text;
end;

procedure TXMLCityType.Set_Summarization(Value: UnicodeString);
begin
  SetAttribute('summarization', Value);
end;

{ TXMLHeightType }

function TXMLHeightType.Get_Datum: UnicodeString;
begin
  Result := AttributeNodes['datum'].Text;
end;

procedure TXMLHeightType.Set_Datum(Value: UnicodeString);
begin
  SetAttribute('datum', Value);
end;

function TXMLHeightType.Get_Heightunits: UnicodeString;
begin
  Result := AttributeNodes['height-units'].Text;
end;

procedure TXMLHeightType.Set_Heightunits(Value: UnicodeString);
begin
  SetAttribute('height-units', Value);
end;

{ TXMLLevelType }

function TXMLLevelType.Get_Verticalcoordinate: UnicodeString;
begin
  Result := AttributeNodes['vertical-coordinate'].Text;
end;

procedure TXMLLevelType.Set_Verticalcoordinate(Value: UnicodeString);
begin
  SetAttribute('vertical-coordinate', Value);
end;

{ TXMLLayerType }

function TXMLLayerType.Get_Verticalcoordinate: UnicodeString;
begin
  Result := AttributeNodes['vertical-coordinate'].Text;
end;

procedure TXMLLayerType.Set_Verticalcoordinate(Value: UnicodeString);
begin
  SetAttribute('vertical-coordinate', Value);
end;

{ TXMLMoreWeatherInformationType }

function TXMLMoreWeatherInformationType.Get_Applicablelocation: UnicodeString;
begin
  Result := AttributeNodes['applicable-location'].Text;
end;

procedure TXMLMoreWeatherInformationType.Set_Applicablelocation(Value: UnicodeString);
begin
  SetAttribute('applicable-location', Value);
end;

{ TXMLMoreWeatherInformationTypeList }

function TXMLMoreWeatherInformationTypeList.Add: IXMLMoreWeatherInformationType;
begin
  Result := AddItem(-1) as IXMLMoreWeatherInformationType;
end;

function TXMLMoreWeatherInformationTypeList.Insert(const Index: Integer): IXMLMoreWeatherInformationType;
begin
  Result := AddItem(Index) as IXMLMoreWeatherInformationType;
end;

function TXMLMoreWeatherInformationTypeList.Get_Item(Index: Integer): IXMLMoreWeatherInformationType;
begin
  Result := List[Index] as IXMLMoreWeatherInformationType;
end;

{ TXMLTimelayoutElementType }

procedure TXMLTimelayoutElementType.AfterConstruction;
begin
  RegisterChildNode('start-valid-time', TXMLStartvalidtimeType);
  FStartvalidtime := CreateCollection(TXMLStartvalidtimeTypeList, IXMLStartvalidtimeType, 'start-valid-time') as IXMLStartvalidtimeTypeList;
  FEndvalidtime := CreateCollection(TXMLDateTimeList, IXMLNode, 'end-valid-time') as IXMLDateTimeList;
  inherited;
end;

function TXMLTimelayoutElementType.Get_Timecoordinate: UnicodeString;
begin
  Result := AttributeNodes['time-coordinate'].Text;
end;

procedure TXMLTimelayoutElementType.Set_Timecoordinate(Value: UnicodeString);
begin
  SetAttribute('time-coordinate', Value);
end;

function TXMLTimelayoutElementType.Get_Summarization: UnicodeString;
begin
  Result := AttributeNodes['summarization'].Text;
end;

procedure TXMLTimelayoutElementType.Set_Summarization(Value: UnicodeString);
begin
  SetAttribute('summarization', Value);
end;

function TXMLTimelayoutElementType.Get_Layoutkey: UnicodeString;
begin
  Result := ChildNodes['layout-key'].Text;
end;

procedure TXMLTimelayoutElementType.Set_Layoutkey(Value: UnicodeString);
begin
  ChildNodes['layout-key'].NodeValue := Value;
end;

function TXMLTimelayoutElementType.Get_Startvalidtime: IXMLStartvalidtimeTypeList;
begin
  Result := FStartvalidtime;
end;

function TXMLTimelayoutElementType.Get_Endvalidtime: IXMLDateTimeList;
begin
  Result := FEndvalidtime;
end;

{ TXMLTimelayoutElementTypeList }

function TXMLTimelayoutElementTypeList.Add: IXMLTimelayoutElementType;
begin
  Result := AddItem(-1) as IXMLTimelayoutElementType;
end;

function TXMLTimelayoutElementTypeList.Insert(const Index: Integer): IXMLTimelayoutElementType;
begin
  Result := AddItem(Index) as IXMLTimelayoutElementType;
end;

function TXMLTimelayoutElementTypeList.Get_Item(Index: Integer): IXMLTimelayoutElementType;
begin
  Result := List[Index] as IXMLTimelayoutElementType;
end;

{ TXMLStartvalidtimeType }

function TXMLStartvalidtimeType.Get_Periodname: UnicodeString;
begin
  Result := AttributeNodes['period-name'].Text;
end;

procedure TXMLStartvalidtimeType.Set_Periodname(Value: UnicodeString);
begin
  SetAttribute('period-name', Value);
end;

{ TXMLStartvalidtimeTypeList }

function TXMLStartvalidtimeTypeList.Add: IXMLStartvalidtimeType;
begin
  Result := AddItem(-1) as IXMLStartvalidtimeType;
end;

function TXMLStartvalidtimeTypeList.Insert(const Index: Integer): IXMLStartvalidtimeType;
begin
  Result := AddItem(Index) as IXMLStartvalidtimeType;
end;

function TXMLStartvalidtimeTypeList.Get_Item(Index: Integer): IXMLStartvalidtimeType;
begin
  Result := List[Index] as IXMLStartvalidtimeType;
end;

{ TXMLParametersType }

procedure TXMLParametersType.AfterConstruction;
begin
  RegisterChildNode('categories', TXMLCategoriesType);
  RegisterChildNode('temperature', TXMLTemperature);
  RegisterChildNode('precipitation', TXMLPrecipitation);
  RegisterChildNode('probability-of-precipitation', TXMLProbabilityofprecipitation);
  RegisterChildNode('fire-weather', TXMLFireweather);
  RegisterChildNode('convective-hazard', TXMLConvectivehazard);
  RegisterChildNode('climate-anomaly', TXMLClimateanomaly);
  RegisterChildNode('wind-speed', TXMLWindspeed);
  RegisterChildNode('direction', TXMLDirection);
  RegisterChildNode('cloud-amount', TXMLCloudamount);
  RegisterChildNode('humidity', TXMLHumidity);
  RegisterChildNode('weather', TXMLWeather);
  RegisterChildNode('conditions-icon', TXMLConditionsicon);
  RegisterChildNode('hazards', TXMLHazards);
  RegisterChildNode('wordedForecast', TXMLWordedForecast);
  RegisterChildNode('pressure', TXMLPressure);
  RegisterChildNode('probabilisticCondition', TXMLProbabilisticCondition);
  RegisterChildNode('water-state', TXMLWaterstate);
  FCategories := CreateCollection(TXMLCategoriesTypeList, IXMLCategoriesType, 'categories') as IXMLCategoriesTypeList;
  FTemperature := CreateCollection(TXMLTemperatureList, IXMLTemperature, 'temperature') as IXMLTemperatureList;
  FPrecipitation := CreateCollection(TXMLPrecipitationList, IXMLPrecipitation, 'precipitation') as IXMLPrecipitationList;
  FProbabilityofprecipitation := CreateCollection(TXMLProbabilityofprecipitationList, IXMLProbabilityofprecipitation, 'probability-of-precipitation') as IXMLProbabilityofprecipitationList;
  FFireweather := CreateCollection(TXMLFireweatherList, IXMLFireweather, 'fire-weather') as IXMLFireweatherList;
  FConvectivehazard := CreateCollection(TXMLConvectivehazardList, IXMLConvectivehazard, 'convective-hazard') as IXMLConvectivehazardList;
  FClimateanomaly := CreateCollection(TXMLClimateanomalyList, IXMLClimateanomaly, 'climate-anomaly') as IXMLClimateanomalyList;
  FWindspeed := CreateCollection(TXMLWindspeedList, IXMLWindspeed, 'wind-speed') as IXMLWindspeedList;
  FDirection := CreateCollection(TXMLDirectionList, IXMLDirection, 'direction') as IXMLDirectionList;
  FCloudamount := CreateCollection(TXMLCloudamountList, IXMLCloudamount, 'cloud-amount') as IXMLCloudamountList;
  FHumidity := CreateCollection(TXMLHumidityList, IXMLHumidity, 'humidity') as IXMLHumidityList;
  FWeather := CreateCollection(TXMLWeatherList, IXMLWeather, 'weather') as IXMLWeatherList;
  FConditionsicon := CreateCollection(TXMLConditionsiconList, IXMLConditionsicon, 'conditions-icon') as IXMLConditionsiconList;
  FHazards := CreateCollection(TXMLHazardsList, IXMLHazards, 'hazards') as IXMLHazardsList;
  FPressure := CreateCollection(TXMLPressureList, IXMLPressure, 'pressure') as IXMLPressureList;
  FProbabilisticCondition := CreateCollection(TXMLProbabilisticConditionList, IXMLProbabilisticCondition, 'probabilisticCondition') as IXMLProbabilisticConditionList;
  FWaterstate := CreateCollection(TXMLWaterstateList, IXMLWaterstate, 'water-state') as IXMLWaterstateList;
  inherited;
end;

function TXMLParametersType.Get_Applicablelocation: UnicodeString;
begin
  Result := AttributeNodes['applicable-location'].Text;
end;

procedure TXMLParametersType.Set_Applicablelocation(Value: UnicodeString);
begin
  SetAttribute('applicable-location', Value);
end;

function TXMLParametersType.Get_Categories: IXMLCategoriesTypeList;
begin
  Result := FCategories;
end;

function TXMLParametersType.Get_Temperature: IXMLTemperatureList;
begin
  Result := FTemperature;
end;

function TXMLParametersType.Get_Precipitation: IXMLPrecipitationList;
begin
  Result := FPrecipitation;
end;

function TXMLParametersType.Get_Probabilityofprecipitation: IXMLProbabilityofprecipitationList;
begin
  Result := FProbabilityofprecipitation;
end;

function TXMLParametersType.Get_Fireweather: IXMLFireweatherList;
begin
  Result := FFireweather;
end;

function TXMLParametersType.Get_Convectivehazard: IXMLConvectivehazardList;
begin
  Result := FConvectivehazard;
end;

function TXMLParametersType.Get_Climateanomaly: IXMLClimateanomalyList;
begin
  Result := FClimateanomaly;
end;

function TXMLParametersType.Get_Windspeed: IXMLWindspeedList;
begin
  Result := FWindspeed;
end;

function TXMLParametersType.Get_Direction: IXMLDirectionList;
begin
  Result := FDirection;
end;

function TXMLParametersType.Get_Cloudamount: IXMLCloudamountList;
begin
  Result := FCloudamount;
end;

function TXMLParametersType.Get_Humidity: IXMLHumidityList;
begin
  Result := FHumidity;
end;

function TXMLParametersType.Get_Weather: IXMLWeatherList;
begin
  Result := FWeather;
end;

function TXMLParametersType.Get_Conditionsicon: IXMLConditionsiconList;
begin
  Result := FConditionsicon;
end;

function TXMLParametersType.Get_Hazards: IXMLHazardsList;
begin
  Result := FHazards;
end;

function TXMLParametersType.Get_WordedForecast: IXMLWordedForecast;
begin
  Result := ChildNodes['wordedForecast'] as IXMLWordedForecast;
end;

function TXMLParametersType.Get_Pressure: IXMLPressureList;
begin
  Result := FPressure;
end;

function TXMLParametersType.Get_ProbabilisticCondition: IXMLProbabilisticConditionList;
begin
  Result := FProbabilisticCondition;
end;

function TXMLParametersType.Get_Waterstate: IXMLWaterstateList;
begin
  Result := FWaterstate;
end;

{ TXMLParametersTypeList }

function TXMLParametersTypeList.Add: IXMLParametersType;
begin
  Result := AddItem(-1) as IXMLParametersType;
end;

function TXMLParametersTypeList.Insert(const Index: Integer): IXMLParametersType;
begin
  Result := AddItem(Index) as IXMLParametersType;
end;

function TXMLParametersTypeList.Get_Item(Index: Integer): IXMLParametersType;
begin
  Result := List[Index] as IXMLParametersType;
end;

{ TXMLCategoriesType }

procedure TXMLCategoriesType.AfterConstruction;
begin
  RegisterChildNode('valueList', TXMLValueListType);
  inherited;
end;

function TXMLCategoriesType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLCategoriesType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLCategoriesType.Get_Probabilitytype: UnicodeString;
begin
  Result := AttributeNodes['probability-type'].Text;
end;

procedure TXMLCategoriesType.Set_Probabilitytype(Value: UnicodeString);
begin
  SetAttribute('probability-type', Value);
end;

function TXMLCategoriesType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLCategoriesType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLCategoriesType.Get_Categorieskey: UnicodeString;
begin
  Result := ChildNodes['categories-key'].Text;
end;

procedure TXMLCategoriesType.Set_Categorieskey(Value: UnicodeString);
begin
  ChildNodes['categories-key'].NodeValue := Value;
end;

function TXMLCategoriesType.Get_ValueList: IXMLValueListType;
begin
  Result := ChildNodes['valueList'] as IXMLValueListType;
end;

{ TXMLCategoriesTypeList }

function TXMLCategoriesTypeList.Add: IXMLCategoriesType;
begin
  Result := AddItem(-1) as IXMLCategoriesType;
end;

function TXMLCategoriesTypeList.Insert(const Index: Integer): IXMLCategoriesType;
begin
  Result := AddItem(Index) as IXMLCategoriesType;
end;

function TXMLCategoriesTypeList.Get_Item(Index: Integer): IXMLCategoriesType;
begin
  Result := List[Index] as IXMLCategoriesType;
end;

{ TXMLValueListType }

function TXMLValueListType.Get_Median: UnicodeString;
begin
  Result := AttributeNodes['median'].Text;
end;

procedure TXMLValueListType.Set_Median(Value: UnicodeString);
begin
  SetAttribute('median', Value);
end;

function TXMLValueListType.Get_ConfidenceInterval50: UnicodeString;
begin
  Result := AttributeNodes['confidenceInterval50'].Text;
end;

procedure TXMLValueListType.Set_ConfidenceInterval50(Value: UnicodeString);
begin
  SetAttribute('confidenceInterval50', Value);
end;

function TXMLValueListType.Get_ConfidenceInterval80: UnicodeString;
begin
  Result := AttributeNodes['confidenceInterval80'].Text;
end;

procedure TXMLValueListType.Set_ConfidenceInterval80(Value: UnicodeString);
begin
  SetAttribute('confidenceInterval80', Value);
end;

function TXMLValueListType.Get_Skew80: UnicodeString;
begin
  Result := AttributeNodes['skew80'].Text;
end;

procedure TXMLValueListType.Set_Skew80(Value: UnicodeString);
begin
  SetAttribute('skew80', Value);
end;

{ TXMLValueListTypeList }

function TXMLValueListTypeList.Add: IXMLValueListType;
begin
  Result := AddItem(-1) as IXMLValueListType;
end;

function TXMLValueListTypeList.Insert(const Index: Integer): IXMLValueListType;
begin
  Result := AddItem(Index) as IXMLValueListType;
end;

function TXMLValueListTypeList.Get_Item(Index: Integer): IXMLValueListType;
begin
  Result := List[Index] as IXMLValueListType;
end;

{ TXMLTemperature }

procedure TXMLTemperature.AfterConstruction;
begin
  RegisterChildNode('value', TXMLTempValType);
  RegisterChildNode('valueList', TXMLValueListType);
  RegisterChildNode('valueWithUncertainty', TXMLValueWithUncertainty);
  FValue := CreateCollection(TXMLTempValTypeList, IXMLTempValType, 'value') as IXMLTempValTypeList;
  FValueList := CreateCollection(TXMLValueListTypeList, IXMLValueListType, 'valueList') as IXMLValueListTypeList;
  FValueWithUncertainty := CreateCollection(TXMLValueWithUncertaintyList, IXMLValueWithUncertainty, 'valueWithUncertainty') as IXMLValueWithUncertaintyList;
  inherited;
end;

function TXMLTemperature.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLTemperature.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLTemperature.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLTemperature.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLTemperature.Get_LikelihoodUnits: UnicodeString;
begin
  Result := AttributeNodes['likelihoodUnits'].Text;
end;

procedure TXMLTemperature.Set_LikelihoodUnits(Value: UnicodeString);
begin
  SetAttribute('likelihoodUnits', Value);
end;

function TXMLTemperature.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLTemperature.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLTemperature.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLTemperature.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLTemperature.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLTemperature.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLTemperature.Get_Applicablecategories: UnicodeString;
begin
  Result := AttributeNodes['applicable-categories'].Text;
end;

procedure TXMLTemperature.Set_Applicablecategories(Value: UnicodeString);
begin
  SetAttribute('applicable-categories', Value);
end;

function TXMLTemperature.Get_Probabilitytype: UnicodeString;
begin
  Result := AttributeNodes['probability-type'].Text;
end;

procedure TXMLTemperature.Set_Probabilitytype(Value: UnicodeString);
begin
  SetAttribute('probability-type', Value);
end;

function TXMLTemperature.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLTemperature.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLTemperature.Get_Value: IXMLTempValTypeList;
begin
  Result := FValue;
end;

function TXMLTemperature.Get_ValueList: IXMLValueListTypeList;
begin
  Result := FValueList;
end;

function TXMLTemperature.Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
begin
  Result := FValueWithUncertainty;
end;

{ TXMLTemperatureList }

function TXMLTemperatureList.Add: IXMLTemperature;
begin
  Result := AddItem(-1) as IXMLTemperature;
end;

function TXMLTemperatureList.Insert(const Index: Integer): IXMLTemperature;
begin
  Result := AddItem(Index) as IXMLTemperature;
end;

function TXMLTemperatureList.Get_Item(Index: Integer): IXMLTemperature;
begin
  Result := List[Index] as IXMLTemperature;
end;

{ TXMLTempValType }

function TXMLTempValType.Get_Upperrange: Integer;
begin
  Result := AttributeNodes['upper-range'].NodeValue;
end;

procedure TXMLTempValType.Set_Upperrange(Value: Integer);
begin
  SetAttribute('upper-range', Value);
end;

function TXMLTempValType.Get_Lowerrange: Integer;
begin
  Result := AttributeNodes['lower-range'].NodeValue;
end;

procedure TXMLTempValType.Set_Lowerrange(Value: Integer);
begin
  SetAttribute('lower-range', Value);
end;

function TXMLTempValType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLTempValType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

{ TXMLTempValTypeList }

function TXMLTempValTypeList.Add: IXMLTempValType;
begin
  Result := AddItem(-1) as IXMLTempValType;
end;

function TXMLTempValTypeList.Insert(const Index: Integer): IXMLTempValType;
begin
  Result := AddItem(Index) as IXMLTempValType;
end;

function TXMLTempValTypeList.Get_Item(Index: Integer): IXMLTempValType;
begin
  Result := List[Index] as IXMLTempValType;
end;

{ TXMLValueWithUncertainty }

procedure TXMLValueWithUncertainty.AfterConstruction;
begin
  RegisterChildNode('value', TXMLTempValType);
  RegisterChildNode('uncertainty', TXMLUncertaintyType);
  inherited;
end;

function TXMLValueWithUncertainty.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLValueWithUncertainty.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLValueWithUncertainty.Get_Value: IXMLTempValType;
begin
  Result := ChildNodes['value'] as IXMLTempValType;
end;

function TXMLValueWithUncertainty.Get_Uncertainty: IXMLUncertaintyType;
begin
  Result := ChildNodes['uncertainty'] as IXMLUncertaintyType;
end;

function TXMLValueWithUncertainty.Get_NumberWithEquality: UnicodeString;
begin
  Result := ChildNodes['numberWithEquality'].Text;
end;

procedure TXMLValueWithUncertainty.Set_NumberWithEquality(Value: UnicodeString);
begin
  ChildNodes['numberWithEquality'].NodeValue := Value;
end;

{ TXMLValueWithUncertaintyList }

function TXMLValueWithUncertaintyList.Add: IXMLValueWithUncertainty;
begin
  Result := AddItem(-1) as IXMLValueWithUncertainty;
end;

function TXMLValueWithUncertaintyList.Insert(const Index: Integer): IXMLValueWithUncertainty;
begin
  Result := AddItem(Index) as IXMLValueWithUncertainty;
end;

function TXMLValueWithUncertaintyList.Get_Item(Index: Integer): IXMLValueWithUncertainty;
begin
  Result := List[Index] as IXMLValueWithUncertainty;
end;

{ TXMLUncertaintyType }

procedure TXMLUncertaintyType.AfterConstruction;
begin
  RegisterChildNode('error', TXMLError);
  inherited;
end;

function TXMLUncertaintyType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLUncertaintyType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLUncertaintyType.Get_Error: IXMLError;
begin
  Result := ChildNodes['error'] as IXMLError;
end;

{ TXMLError }

function TXMLError.Get_Qualifier: UnicodeString;
begin
  Result := AttributeNodes['qualifier'].Text;
end;

procedure TXMLError.Set_Qualifier(Value: UnicodeString);
begin
  SetAttribute('qualifier', Value);
end;

{ TXMLPrecipitation }

procedure TXMLPrecipitation.AfterConstruction;
begin
  RegisterChildNode('value', TXMLDecimalValType);
  RegisterChildNode('valueList', TXMLValueListType);
  RegisterChildNode('valueWithUncertainty', TXMLValueWithUncertainty);
  FValue := CreateCollection(TXMLDecimalValTypeList, IXMLDecimalValType, 'value') as IXMLDecimalValTypeList;
  FValueList := CreateCollection(TXMLValueListTypeList, IXMLValueListType, 'valueList') as IXMLValueListTypeList;
  FValueWithUncertainty := CreateCollection(TXMLValueWithUncertaintyList, IXMLValueWithUncertainty, 'valueWithUncertainty') as IXMLValueWithUncertaintyList;
  inherited;
end;

function TXMLPrecipitation.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLPrecipitation.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLPrecipitation.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLPrecipitation.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLPrecipitation.Get_LikelihoodUnits: UnicodeString;
begin
  Result := AttributeNodes['likelihoodUnits'].Text;
end;

procedure TXMLPrecipitation.Set_LikelihoodUnits(Value: UnicodeString);
begin
  SetAttribute('likelihoodUnits', Value);
end;

function TXMLPrecipitation.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLPrecipitation.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLPrecipitation.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLPrecipitation.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLPrecipitation.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLPrecipitation.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLPrecipitation.Get_Probabilitytype: UnicodeString;
begin
  Result := AttributeNodes['probability-type'].Text;
end;

procedure TXMLPrecipitation.Set_Probabilitytype(Value: UnicodeString);
begin
  SetAttribute('probability-type', Value);
end;

function TXMLPrecipitation.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLPrecipitation.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLPrecipitation.Get_Value: IXMLDecimalValTypeList;
begin
  Result := FValue;
end;

function TXMLPrecipitation.Get_ValueList: IXMLValueListTypeList;
begin
  Result := FValueList;
end;

function TXMLPrecipitation.Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
begin
  Result := FValueWithUncertainty;
end;

{ TXMLPrecipitationList }

function TXMLPrecipitationList.Add: IXMLPrecipitation;
begin
  Result := AddItem(-1) as IXMLPrecipitation;
end;

function TXMLPrecipitationList.Insert(const Index: Integer): IXMLPrecipitation;
begin
  Result := AddItem(Index) as IXMLPrecipitation;
end;

function TXMLPrecipitationList.Get_Item(Index: Integer): IXMLPrecipitation;
begin
  Result := List[Index] as IXMLPrecipitation;
end;

{ TXMLDecimalValType }

function TXMLDecimalValType.Get_Upperrange: LongWord;
begin
  Result := AttributeNodes['upper-range'].NodeValue;
end;

procedure TXMLDecimalValType.Set_Upperrange(Value: LongWord);
begin
  SetAttribute('upper-range', Value);
end;

function TXMLDecimalValType.Get_Lowerrange: LongWord;
begin
  Result := AttributeNodes['lower-range'].NodeValue;
end;

procedure TXMLDecimalValType.Set_Lowerrange(Value: LongWord);
begin
  SetAttribute('lower-range', Value);
end;

function TXMLDecimalValType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLDecimalValType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

{ TXMLDecimalValTypeList }

function TXMLDecimalValTypeList.Add: IXMLDecimalValType;
begin
  Result := AddItem(-1) as IXMLDecimalValType;
end;

function TXMLDecimalValTypeList.Insert(const Index: Integer): IXMLDecimalValType;
begin
  Result := AddItem(Index) as IXMLDecimalValType;
end;

function TXMLDecimalValTypeList.Get_Item(Index: Integer): IXMLDecimalValType;
begin
  Result := List[Index] as IXMLDecimalValType;
end;

{ TXMLProbabilityofprecipitation }

procedure TXMLProbabilityofprecipitation.AfterConstruction;
begin
  RegisterChildNode('value', TXMLPercentageValType);
  RegisterChildNode('valueList', TXMLValueListType);
  FValue := CreateCollection(TXMLPercentageValTypeList, IXMLPercentageValType, 'value') as IXMLPercentageValTypeList;
  FValueList := CreateCollection(TXMLValueListTypeList, IXMLValueListType, 'valueList') as IXMLValueListTypeList;
  inherited;
end;

function TXMLProbabilityofprecipitation.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLProbabilityofprecipitation.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLProbabilityofprecipitation.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLProbabilityofprecipitation.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLProbabilityofprecipitation.Get_LikelihoodUnits: UnicodeString;
begin
  Result := AttributeNodes['likelihoodUnits'].Text;
end;

procedure TXMLProbabilityofprecipitation.Set_LikelihoodUnits(Value: UnicodeString);
begin
  SetAttribute('likelihoodUnits', Value);
end;

function TXMLProbabilityofprecipitation.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLProbabilityofprecipitation.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLProbabilityofprecipitation.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLProbabilityofprecipitation.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLProbabilityofprecipitation.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLProbabilityofprecipitation.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLProbabilityofprecipitation.Get_Applicablecategories: UnicodeString;
begin
  Result := AttributeNodes['applicable-categories'].Text;
end;

procedure TXMLProbabilityofprecipitation.Set_Applicablecategories(Value: UnicodeString);
begin
  SetAttribute('applicable-categories', Value);
end;

function TXMLProbabilityofprecipitation.Get_Probabilitytype: UnicodeString;
begin
  Result := AttributeNodes['probability-type'].Text;
end;

procedure TXMLProbabilityofprecipitation.Set_Probabilitytype(Value: UnicodeString);
begin
  SetAttribute('probability-type', Value);
end;

function TXMLProbabilityofprecipitation.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLProbabilityofprecipitation.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLProbabilityofprecipitation.Get_Value: IXMLPercentageValTypeList;
begin
  Result := FValue;
end;

function TXMLProbabilityofprecipitation.Get_ValueList: IXMLValueListTypeList;
begin
  Result := FValueList;
end;

{ TXMLProbabilityofprecipitationList }

function TXMLProbabilityofprecipitationList.Add: IXMLProbabilityofprecipitation;
begin
  Result := AddItem(-1) as IXMLProbabilityofprecipitation;
end;

function TXMLProbabilityofprecipitationList.Insert(const Index: Integer): IXMLProbabilityofprecipitation;
begin
  Result := AddItem(Index) as IXMLProbabilityofprecipitation;
end;

function TXMLProbabilityofprecipitationList.Get_Item(Index: Integer): IXMLProbabilityofprecipitation;
begin
  Result := List[Index] as IXMLProbabilityofprecipitation;
end;

{ TXMLPercentageValType }

function TXMLPercentageValType.Get_Upperrange: LongWord;
begin
  Result := AttributeNodes['upper-range'].NodeValue;
end;

procedure TXMLPercentageValType.Set_Upperrange(Value: LongWord);
begin
  SetAttribute('upper-range', Value);
end;

function TXMLPercentageValType.Get_Lowerrange: LongWord;
begin
  Result := AttributeNodes['lower-range'].NodeValue;
end;

procedure TXMLPercentageValType.Set_Lowerrange(Value: LongWord);
begin
  SetAttribute('lower-range', Value);
end;

function TXMLPercentageValType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLPercentageValType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

{ TXMLPercentageValTypeList }

function TXMLPercentageValTypeList.Add: IXMLPercentageValType;
begin
  Result := AddItem(-1) as IXMLPercentageValType;
end;

function TXMLPercentageValTypeList.Insert(const Index: Integer): IXMLPercentageValType;
begin
  Result := AddItem(Index) as IXMLPercentageValType;
end;

function TXMLPercentageValTypeList.Get_Item(Index: Integer): IXMLPercentageValType;
begin
  Result := List[Index] as IXMLPercentageValType;
end;

{ TXMLFireweather }

procedure TXMLFireweather.AfterConstruction;
begin
  FValue := CreateCollection(TXMLValueList, IXMLNode, 'value') as IXMLValueList;
  inherited;
end;

function TXMLFireweather.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLFireweather.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLFireweather.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLFireweather.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLFireweather.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLFireweather.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLFireweather.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLFireweather.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLFireweather.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLFireweather.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLFireweather.Get_Value: IXMLValueList;
begin
  Result := FValue;
end;

{ TXMLFireweatherList }

function TXMLFireweatherList.Add: IXMLFireweather;
begin
  Result := AddItem(-1) as IXMLFireweather;
end;

function TXMLFireweatherList.Insert(const Index: Integer): IXMLFireweather;
begin
  Result := AddItem(Index) as IXMLFireweather;
end;

function TXMLFireweatherList.Get_Item(Index: Integer): IXMLFireweather;
begin
  Result := List[Index] as IXMLFireweather;
end;

{ TXMLConvectivehazard }

procedure TXMLConvectivehazard.AfterConstruction;
begin
  RegisterChildNode('outlook', TXMLOutlook);
  RegisterChildNode('severe-component', TXMLSeverecomponent);
  FSeverecomponent := CreateCollection(TXMLSeverecomponentList, IXMLSeverecomponent, 'severe-component') as IXMLSeverecomponentList;
  inherited;
end;

function TXMLConvectivehazard.Get_Outlook: IXMLOutlook;
begin
  Result := ChildNodes['outlook'] as IXMLOutlook;
end;

function TXMLConvectivehazard.Get_Severecomponent: IXMLSeverecomponentList;
begin
  Result := FSeverecomponent;
end;

{ TXMLConvectivehazardList }

function TXMLConvectivehazardList.Add: IXMLConvectivehazard;
begin
  Result := AddItem(-1) as IXMLConvectivehazard;
end;

function TXMLConvectivehazardList.Insert(const Index: Integer): IXMLConvectivehazard;
begin
  Result := AddItem(Index) as IXMLConvectivehazard;
end;

function TXMLConvectivehazardList.Get_Item(Index: Integer): IXMLConvectivehazard;
begin
  Result := List[Index] as IXMLConvectivehazard;
end;

{ TXMLOutlook }

procedure TXMLOutlook.AfterConstruction;
begin
  FValue := CreateCollection(TXMLValueList, IXMLNode, 'value') as IXMLValueList;
  inherited;
end;

function TXMLOutlook.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLOutlook.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLOutlook.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLOutlook.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLOutlook.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLOutlook.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLOutlook.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLOutlook.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLOutlook.Get_Value: IXMLValueList;
begin
  Result := FValue;
end;

{ TXMLSeverecomponent }

procedure TXMLSeverecomponent.AfterConstruction;
begin
  RegisterChildNode('value', TXMLValue);
  FValue := CreateCollection(TXMLValueList, IXMLValue, 'value') as IXMLValueList;
  inherited;
end;

function TXMLSeverecomponent.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLSeverecomponent.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLSeverecomponent.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLSeverecomponent.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLSeverecomponent.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLSeverecomponent.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLSeverecomponent.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLSeverecomponent.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLSeverecomponent.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLSeverecomponent.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLSeverecomponent.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLSeverecomponent.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLSeverecomponent.Get_Value: IXMLValueList;
begin
  Result := FValue;
end;

{ TXMLSeverecomponentList }

function TXMLSeverecomponentList.Add: IXMLSeverecomponent;
begin
  Result := AddItem(-1) as IXMLSeverecomponent;
end;

function TXMLSeverecomponentList.Insert(const Index: Integer): IXMLSeverecomponent;
begin
  Result := AddItem(Index) as IXMLSeverecomponent;
end;

function TXMLSeverecomponentList.Get_Item(Index: Integer): IXMLSeverecomponent;
begin
  Result := List[Index] as IXMLSeverecomponent;
end;

{ TXMLValue }

function TXMLValue.Get_Upperrange: LongWord;
begin
  Result := AttributeNodes['upper-range'].NodeValue;
end;

procedure TXMLValue.Set_Upperrange(Value: LongWord);
begin
  SetAttribute('upper-range', Value);
end;

function TXMLValue.Get_Lowerrange: LongWord;
begin
  Result := AttributeNodes['lower-range'].NodeValue;
end;

procedure TXMLValue.Set_Lowerrange(Value: LongWord);
begin
  SetAttribute('lower-range', Value);
end;

{ TXMLValueList }

function TXMLValueList.Add: IXMLValue;
begin
  Result := AddItem(-1) as IXMLValue;
end;

function TXMLValueList.Insert(const Index: Integer): IXMLValue;
begin
  Result := AddItem(Index) as IXMLValue;
end;

function TXMLValueList.Get_Item(Index: Integer): IXMLValue;
begin
  Result := List[Index] as IXMLValue;
end;

{ TXMLClimateanomaly }

procedure TXMLClimateanomaly.AfterConstruction;
begin
  RegisterChildNode('weekly', TXMLAnomalyType);
  RegisterChildNode('monthly', TXMLAnomalyType);
  RegisterChildNode('seasonal', TXMLAnomalyType);
  FWeekly := CreateCollection(TXMLAnomalyTypeList, IXMLAnomalyType, 'weekly') as IXMLAnomalyTypeList;
  FMonthly := CreateCollection(TXMLAnomalyTypeList, IXMLAnomalyType, 'monthly') as IXMLAnomalyTypeList;
  FSeasonal := CreateCollection(TXMLAnomalyTypeList, IXMLAnomalyType, 'seasonal') as IXMLAnomalyTypeList;
  inherited;
end;

function TXMLClimateanomaly.Get_Weekly: IXMLAnomalyTypeList;
begin
  Result := FWeekly;
end;

function TXMLClimateanomaly.Get_Monthly: IXMLAnomalyTypeList;
begin
  Result := FMonthly;
end;

function TXMLClimateanomaly.Get_Seasonal: IXMLAnomalyTypeList;
begin
  Result := FSeasonal;
end;

{ TXMLClimateanomalyList }

function TXMLClimateanomalyList.Add: IXMLClimateanomaly;
begin
  Result := AddItem(-1) as IXMLClimateanomaly;
end;

function TXMLClimateanomalyList.Insert(const Index: Integer): IXMLClimateanomaly;
begin
  Result := AddItem(Index) as IXMLClimateanomaly;
end;

function TXMLClimateanomalyList.Get_Item(Index: Integer): IXMLClimateanomaly;
begin
  Result := List[Index] as IXMLClimateanomaly;
end;

{ TXMLAnomalyType }

procedure TXMLAnomalyType.AfterConstruction;
begin
  RegisterChildNode('value', TXMLValue);
  FValue := CreateCollection(TXMLValueList, IXMLValue, 'value') as IXMLValueList;
  inherited;
end;

function TXMLAnomalyType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLAnomalyType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLAnomalyType.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLAnomalyType.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLAnomalyType.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLAnomalyType.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLAnomalyType.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLAnomalyType.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLAnomalyType.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLAnomalyType.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLAnomalyType.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLAnomalyType.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLAnomalyType.Get_Value: IXMLValueList;
begin
  Result := FValue;
end;

{ TXMLAnomalyTypeList }

function TXMLAnomalyTypeList.Add: IXMLAnomalyType;
begin
  Result := AddItem(-1) as IXMLAnomalyType;
end;

function TXMLAnomalyTypeList.Insert(const Index: Integer): IXMLAnomalyType;
begin
  Result := AddItem(Index) as IXMLAnomalyType;
end;

function TXMLAnomalyTypeList.Get_Item(Index: Integer): IXMLAnomalyType;
begin
  Result := List[Index] as IXMLAnomalyType;
end;

{ TXMLWindspeed }

procedure TXMLWindspeed.AfterConstruction;
begin
  RegisterChildNode('value', TXMLWspdValType);
  RegisterChildNode('valueWithUncertainty', TXMLValueWithUncertainty);
  FValue := CreateCollection(TXMLWspdValTypeList, IXMLWspdValType, 'value') as IXMLWspdValTypeList;
  FValueWithUncertainty := CreateCollection(TXMLValueWithUncertaintyList, IXMLValueWithUncertainty, 'valueWithUncertainty') as IXMLValueWithUncertaintyList;
  inherited;
end;

function TXMLWindspeed.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLWindspeed.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLWindspeed.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLWindspeed.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLWindspeed.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLWindspeed.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLWindspeed.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLWindspeed.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLWindspeed.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLWindspeed.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLWindspeed.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLWindspeed.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLWindspeed.Get_Value: IXMLWspdValTypeList;
begin
  Result := FValue;
end;

function TXMLWindspeed.Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
begin
  Result := FValueWithUncertainty;
end;

{ TXMLWindspeedList }

function TXMLWindspeedList.Add: IXMLWindspeed;
begin
  Result := AddItem(-1) as IXMLWindspeed;
end;

function TXMLWindspeedList.Insert(const Index: Integer): IXMLWindspeed;
begin
  Result := AddItem(Index) as IXMLWindspeed;
end;

function TXMLWindspeedList.Get_Item(Index: Integer): IXMLWindspeed;
begin
  Result := List[Index] as IXMLWindspeed;
end;

{ TXMLWspdValType }

function TXMLWspdValType.Get_Upperrange: LongWord;
begin
  Result := AttributeNodes['upper-range'].NodeValue;
end;

procedure TXMLWspdValType.Set_Upperrange(Value: LongWord);
begin
  SetAttribute('upper-range', Value);
end;

function TXMLWspdValType.Get_Lowerrange: LongWord;
begin
  Result := AttributeNodes['lower-range'].NodeValue;
end;

procedure TXMLWspdValType.Set_Lowerrange(Value: LongWord);
begin
  SetAttribute('lower-range', Value);
end;

function TXMLWspdValType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLWspdValType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

{ TXMLWspdValTypeList }

function TXMLWspdValTypeList.Add: IXMLWspdValType;
begin
  Result := AddItem(-1) as IXMLWspdValType;
end;

function TXMLWspdValTypeList.Insert(const Index: Integer): IXMLWspdValType;
begin
  Result := AddItem(Index) as IXMLWspdValType;
end;

function TXMLWspdValTypeList.Get_Item(Index: Integer): IXMLWspdValType;
begin
  Result := List[Index] as IXMLWspdValType;
end;

{ TXMLDirection }

procedure TXMLDirection.AfterConstruction;
begin
  RegisterChildNode('value', TXMLWdirValType);
  RegisterChildNode('valueWithUncertainty', TXMLValueWithUncertainty);
  FValue := CreateCollection(TXMLWdirValTypeList, IXMLWdirValType, 'value') as IXMLWdirValTypeList;
  FValueWithUncertainty := CreateCollection(TXMLValueWithUncertaintyList, IXMLValueWithUncertainty, 'valueWithUncertainty') as IXMLValueWithUncertaintyList;
  inherited;
end;

function TXMLDirection.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLDirection.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLDirection.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLDirection.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLDirection.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLDirection.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLDirection.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLDirection.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLDirection.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLDirection.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLDirection.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLDirection.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLDirection.Get_Value: IXMLWdirValTypeList;
begin
  Result := FValue;
end;

function TXMLDirection.Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
begin
  Result := FValueWithUncertainty;
end;

{ TXMLDirectionList }

function TXMLDirectionList.Add: IXMLDirection;
begin
  Result := AddItem(-1) as IXMLDirection;
end;

function TXMLDirectionList.Insert(const Index: Integer): IXMLDirection;
begin
  Result := AddItem(Index) as IXMLDirection;
end;

function TXMLDirectionList.Get_Item(Index: Integer): IXMLDirection;
begin
  Result := List[Index] as IXMLDirection;
end;

{ TXMLWdirValType }

function TXMLWdirValType.Get_Upperrange: LongWord;
begin
  Result := AttributeNodes['upper-range'].NodeValue;
end;

procedure TXMLWdirValType.Set_Upperrange(Value: LongWord);
begin
  SetAttribute('upper-range', Value);
end;

function TXMLWdirValType.Get_Lowerrange: LongWord;
begin
  Result := AttributeNodes['lower-range'].NodeValue;
end;

procedure TXMLWdirValType.Set_Lowerrange(Value: LongWord);
begin
  SetAttribute('lower-range', Value);
end;

function TXMLWdirValType.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLWdirValType.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

{ TXMLWdirValTypeList }

function TXMLWdirValTypeList.Add: IXMLWdirValType;
begin
  Result := AddItem(-1) as IXMLWdirValType;
end;

function TXMLWdirValTypeList.Insert(const Index: Integer): IXMLWdirValType;
begin
  Result := AddItem(Index) as IXMLWdirValType;
end;

function TXMLWdirValTypeList.Get_Item(Index: Integer): IXMLWdirValType;
begin
  Result := List[Index] as IXMLWdirValType;
end;

{ TXMLCloudamount }

procedure TXMLCloudamount.AfterConstruction;
begin
  RegisterChildNode('value', TXMLPercentageValType);
  RegisterChildNode('valueWithUncertainty', TXMLValueWithUncertainty);
  FValue := CreateCollection(TXMLPercentageValTypeList, IXMLPercentageValType, 'value') as IXMLPercentageValTypeList;
  FValueWithUncertainty := CreateCollection(TXMLValueWithUncertaintyList, IXMLValueWithUncertainty, 'valueWithUncertainty') as IXMLValueWithUncertaintyList;
  inherited;
end;

function TXMLCloudamount.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLCloudamount.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLCloudamount.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLCloudamount.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLCloudamount.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLCloudamount.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLCloudamount.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLCloudamount.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLCloudamount.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLCloudamount.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLCloudamount.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLCloudamount.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLCloudamount.Get_Value: IXMLPercentageValTypeList;
begin
  Result := FValue;
end;

function TXMLCloudamount.Get_ValueWithUncertainty: IXMLValueWithUncertaintyList;
begin
  Result := FValueWithUncertainty;
end;

{ TXMLCloudamountList }

function TXMLCloudamountList.Add: IXMLCloudamount;
begin
  Result := AddItem(-1) as IXMLCloudamount;
end;

function TXMLCloudamountList.Insert(const Index: Integer): IXMLCloudamount;
begin
  Result := AddItem(Index) as IXMLCloudamount;
end;

function TXMLCloudamountList.Get_Item(Index: Integer): IXMLCloudamount;
begin
  Result := List[Index] as IXMLCloudamount;
end;

{ TXMLHumidity }

procedure TXMLHumidity.AfterConstruction;
begin
  RegisterChildNode('value', TXMLValue);
  FValue := CreateCollection(TXMLValueList, IXMLValue, 'value') as IXMLValueList;
  inherited;
end;

function TXMLHumidity.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLHumidity.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLHumidity.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLHumidity.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLHumidity.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLHumidity.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLHumidity.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLHumidity.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLHumidity.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLHumidity.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLHumidity.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLHumidity.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLHumidity.Get_Value: IXMLValueList;
begin
  Result := FValue;
end;

{ TXMLHumidityList }

function TXMLHumidityList.Add: IXMLHumidity;
begin
  Result := AddItem(-1) as IXMLHumidity;
end;

function TXMLHumidityList.Insert(const Index: Integer): IXMLHumidity;
begin
  Result := AddItem(Index) as IXMLHumidity;
end;

function TXMLHumidityList.Get_Item(Index: Integer): IXMLHumidity;
begin
  Result := List[Index] as IXMLHumidity;
end;

{ TXMLWeather }

procedure TXMLWeather.AfterConstruction;
begin
  RegisterChildNode('weather-conditions', TXMLWeatherconditions);
  FName := CreateCollection(TXMLString_List, IXMLNode, 'name') as IXMLString_List;
  FWeatherconditions := CreateCollection(TXMLWeatherconditionsList, IXMLWeatherconditions, 'weather-conditions') as IXMLWeatherconditionsList;
  inherited;
end;

function TXMLWeather.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLWeather.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLWeather.Get_Name: IXMLString_List;
begin
  Result := FName;
end;

function TXMLWeather.Get_Weatherconditions: IXMLWeatherconditionsList;
begin
  Result := FWeatherconditions;
end;

{ TXMLWeatherList }

function TXMLWeatherList.Add: IXMLWeather;
begin
  Result := AddItem(-1) as IXMLWeather;
end;

function TXMLWeatherList.Insert(const Index: Integer): IXMLWeather;
begin
  Result := AddItem(Index) as IXMLWeather;
end;

function TXMLWeatherList.Get_Item(Index: Integer): IXMLWeather;
begin
  Result := List[Index] as IXMLWeather;
end;

{ TXMLWeatherconditions }

procedure TXMLWeatherconditions.AfterConstruction;
begin
  RegisterChildNode('value', TXMLValue);
  ItemTag := 'value';
  ItemInterface := IXMLValue;
  inherited;
end;

function TXMLWeatherconditions.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLWeatherconditions.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLWeatherconditions.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLWeatherconditions.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLWeatherconditions.Get_Weathersummary: UnicodeString;
begin
  Result := AttributeNodes['weather-summary'].Text;
end;

procedure TXMLWeatherconditions.Set_Weathersummary(Value: UnicodeString);
begin
  SetAttribute('weather-summary', Value);
end;

function TXMLWeatherconditions.Get_Value(Index: Integer): IXMLValue;
begin
  Result := List[Index] as IXMLValue;
end;

function TXMLWeatherconditions.Add: IXMLValue;
begin
  Result := AddItem(-1) as IXMLValue;
end;

function TXMLWeatherconditions.Insert(const Index: Integer): IXMLValue;
begin
  Result := AddItem(Index) as IXMLValue;
end;

{ TXMLWeatherconditionsList }

function TXMLWeatherconditionsList.Add: IXMLWeatherconditions;
begin
  Result := AddItem(-1) as IXMLWeatherconditions;
end;

function TXMLWeatherconditionsList.Insert(const Index: Integer): IXMLWeatherconditions;
begin
  Result := AddItem(Index) as IXMLWeatherconditions;
end;

function TXMLWeatherconditionsList.Get_Item(Index: Integer): IXMLWeatherconditions;
begin
  Result := List[Index] as IXMLWeatherconditions;
end;

{ TXMLConditionsicon }

procedure TXMLConditionsicon.AfterConstruction;
begin
  FIconlink := CreateCollection(TXMLAnyURIList, IXMLNode, 'icon-link') as IXMLAnyURIList;
  inherited;
end;

function TXMLConditionsicon.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLConditionsicon.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLConditionsicon.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLConditionsicon.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLConditionsicon.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLConditionsicon.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLConditionsicon.Get_Iconlink: IXMLAnyURIList;
begin
  Result := FIconlink;
end;

{ TXMLConditionsiconList }

function TXMLConditionsiconList.Add: IXMLConditionsicon;
begin
  Result := AddItem(-1) as IXMLConditionsicon;
end;

function TXMLConditionsiconList.Insert(const Index: Integer): IXMLConditionsicon;
begin
  Result := AddItem(Index) as IXMLConditionsicon;
end;

function TXMLConditionsiconList.Get_Item(Index: Integer): IXMLConditionsicon;
begin
  Result := List[Index] as IXMLConditionsicon;
end;

{ TXMLHazards }

procedure TXMLHazards.AfterConstruction;
begin
  RegisterChildNode('hazard-conditions', TXMLHazardconditions);
  FName := CreateCollection(TXMLString_List, IXMLNode, 'name') as IXMLString_List;
  FHazardconditions := CreateCollection(TXMLHazardconditionsList, IXMLHazardconditions, 'hazard-conditions') as IXMLHazardconditionsList;
  inherited;
end;

function TXMLHazards.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLHazards.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLHazards.Get_Name: IXMLString_List;
begin
  Result := FName;
end;

function TXMLHazards.Get_Hazardconditions: IXMLHazardconditionsList;
begin
  Result := FHazardconditions;
end;

{ TXMLHazardsList }

function TXMLHazardsList.Add: IXMLHazards;
begin
  Result := AddItem(-1) as IXMLHazards;
end;

function TXMLHazardsList.Insert(const Index: Integer): IXMLHazards;
begin
  Result := AddItem(Index) as IXMLHazards;
end;

function TXMLHazardsList.Get_Item(Index: Integer): IXMLHazards;
begin
  Result := List[Index] as IXMLHazards;
end;

{ TXMLHazardconditions }

procedure TXMLHazardconditions.AfterConstruction;
begin
  RegisterChildNode('hazard', TXMLHazard);
  ItemTag := 'hazard';
  ItemInterface := IXMLHazard;
  inherited;
end;

function TXMLHazardconditions.Get_Hazard(Index: Integer): IXMLHazard;
begin
  Result := List[Index] as IXMLHazard;
end;

function TXMLHazardconditions.Add: IXMLHazard;
begin
  Result := AddItem(-1) as IXMLHazard;
end;

function TXMLHazardconditions.Insert(const Index: Integer): IXMLHazard;
begin
  Result := AddItem(Index) as IXMLHazard;
end;

{ TXMLHazardconditionsList }

function TXMLHazardconditionsList.Add: IXMLHazardconditions;
begin
  Result := AddItem(-1) as IXMLHazardconditions;
end;

function TXMLHazardconditionsList.Insert(const Index: Integer): IXMLHazardconditions;
begin
  Result := AddItem(Index) as IXMLHazardconditions;
end;

function TXMLHazardconditionsList.Get_Item(Index: Integer): IXMLHazardconditions;
begin
  Result := List[Index] as IXMLHazardconditions;
end;

{ TXMLHazard }

function TXMLHazard.Get_HazardCode: UnicodeString;
begin
  Result := AttributeNodes['hazardCode'].Text;
end;

procedure TXMLHazard.Set_HazardCode(Value: UnicodeString);
begin
  SetAttribute('hazardCode', Value);
end;

function TXMLHazard.Get_Phenomena: UnicodeString;
begin
  Result := AttributeNodes['phenomena'].Text;
end;

procedure TXMLHazard.Set_Phenomena(Value: UnicodeString);
begin
  SetAttribute('phenomena', Value);
end;

function TXMLHazard.Get_Significance: UnicodeString;
begin
  Result := AttributeNodes['significance'].Text;
end;

procedure TXMLHazard.Set_Significance(Value: UnicodeString);
begin
  SetAttribute('significance', Value);
end;

function TXMLHazard.Get_HazardType: UnicodeString;
begin
  Result := AttributeNodes['hazardType'].Text;
end;

procedure TXMLHazard.Set_HazardType(Value: UnicodeString);
begin
  SetAttribute('hazardType', Value);
end;

function TXMLHazard.Get_EventTrackingNumber: Integer;
begin
  Result := AttributeNodes['eventTrackingNumber'].NodeValue;
end;

procedure TXMLHazard.Set_EventTrackingNumber(Value: Integer);
begin
  SetAttribute('eventTrackingNumber', Value);
end;

function TXMLHazard.Get_Headline: UnicodeString;
begin
  Result := AttributeNodes['headline'].Text;
end;

procedure TXMLHazard.Set_Headline(Value: UnicodeString);
begin
  SetAttribute('headline', Value);
end;

function TXMLHazard.Get_HazardTextURL: UnicodeString;
begin
  Result := ChildNodes['hazardTextURL'].Text;
end;

procedure TXMLHazard.Set_HazardTextURL(Value: UnicodeString);
begin
  ChildNodes['hazardTextURL'].NodeValue := Value;
end;

function TXMLHazard.Get_HazardIcon: UnicodeString;
begin
  Result := ChildNodes['hazardIcon'].Text;
end;

procedure TXMLHazard.Set_HazardIcon(Value: UnicodeString);
begin
  ChildNodes['hazardIcon'].NodeValue := Value;
end;

{ TXMLWordedForecast }

procedure TXMLWordedForecast.AfterConstruction;
begin
  FText := CreateCollection(TXMLString_List, IXMLNode, 'text') as IXMLString_List;
  inherited;
end;

function TXMLWordedForecast.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLWordedForecast.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLWordedForecast.Get_DataSource: UnicodeString;
begin
  Result := AttributeNodes['dataSource'].Text;
end;

procedure TXMLWordedForecast.Set_DataSource(Value: UnicodeString);
begin
  SetAttribute('dataSource', Value);
end;

function TXMLWordedForecast.Get_WordGenerator: UnicodeString;
begin
  Result := AttributeNodes['wordGenerator'].Text;
end;

procedure TXMLWordedForecast.Set_WordGenerator(Value: UnicodeString);
begin
  SetAttribute('wordGenerator', Value);
end;

function TXMLWordedForecast.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLWordedForecast.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLWordedForecast.Get_Text: IXMLString_List;
begin
  Result := FText;
end;

{ TXMLPressure }

procedure TXMLPressure.AfterConstruction;
begin
  RegisterChildNode('value', TXMLDecimalValType);
  FValue := CreateCollection(TXMLDecimalValTypeList, IXMLDecimalValType, 'value') as IXMLDecimalValTypeList;
  inherited;
end;

function TXMLPressure.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLPressure.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLPressure.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLPressure.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLPressure.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLPressure.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLPressure.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLPressure.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLPressure.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLPressure.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLPressure.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLPressure.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLPressure.Get_Value: IXMLDecimalValTypeList;
begin
  Result := FValue;
end;

{ TXMLPressureList }

function TXMLPressureList.Add: IXMLPressure;
begin
  Result := AddItem(-1) as IXMLPressure;
end;

function TXMLPressureList.Insert(const Index: Integer): IXMLPressure;
begin
  Result := AddItem(Index) as IXMLPressure;
end;

function TXMLPressureList.Get_Item(Index: Integer): IXMLPressure;
begin
  Result := List[Index] as IXMLPressure;
end;

{ TXMLProbabilisticCondition }

procedure TXMLProbabilisticCondition.AfterConstruction;
begin
  RegisterChildNode('value', TXMLPercentageValType);
  RegisterChildNode('valueForRange', TXMLValueForRangeType);
  FValue := CreateCollection(TXMLPercentageValTypeList, IXMLPercentageValType, 'value') as IXMLPercentageValTypeList;
  FValueForRange := CreateCollection(TXMLValueForRangeTypeList, IXMLValueForRangeType, 'valueForRange') as IXMLValueForRangeTypeList;
  inherited;
end;

function TXMLProbabilisticCondition.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLProbabilisticCondition.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLProbabilisticCondition.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLProbabilisticCondition.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLProbabilisticCondition.Get_LikelihoodUnits: UnicodeString;
begin
  Result := AttributeNodes['likelihoodUnits'].Text;
end;

procedure TXMLProbabilisticCondition.Set_LikelihoodUnits(Value: UnicodeString);
begin
  SetAttribute('likelihoodUnits', Value);
end;

function TXMLProbabilisticCondition.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLProbabilisticCondition.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLProbabilisticCondition.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLProbabilisticCondition.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLProbabilisticCondition.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLProbabilisticCondition.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLProbabilisticCondition.Get_Applicablecategories: UnicodeString;
begin
  Result := AttributeNodes['applicable-categories'].Text;
end;

procedure TXMLProbabilisticCondition.Set_Applicablecategories(Value: UnicodeString);
begin
  SetAttribute('applicable-categories', Value);
end;

function TXMLProbabilisticCondition.Get_Probabilitytype: UnicodeString;
begin
  Result := AttributeNodes['probability-type'].Text;
end;

procedure TXMLProbabilisticCondition.Set_Probabilitytype(Value: UnicodeString);
begin
  SetAttribute('probability-type', Value);
end;

function TXMLProbabilisticCondition.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLProbabilisticCondition.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLProbabilisticCondition.Get_Value: IXMLPercentageValTypeList;
begin
  Result := FValue;
end;

function TXMLProbabilisticCondition.Get_ValueForRange: IXMLValueForRangeTypeList;
begin
  Result := FValueForRange;
end;

{ TXMLProbabilisticConditionList }

function TXMLProbabilisticConditionList.Add: IXMLProbabilisticCondition;
begin
  Result := AddItem(-1) as IXMLProbabilisticCondition;
end;

function TXMLProbabilisticConditionList.Insert(const Index: Integer): IXMLProbabilisticCondition;
begin
  Result := AddItem(Index) as IXMLProbabilisticCondition;
end;

function TXMLProbabilisticConditionList.Get_Item(Index: Integer): IXMLProbabilisticCondition;
begin
  Result := List[Index] as IXMLProbabilisticCondition;
end;

{ TXMLValueForRangeType }

procedure TXMLValueForRangeType.AfterConstruction;
begin
  RegisterChildNode('value', TXMLPercentageValType);
  FValue := CreateCollection(TXMLPercentageValTypeList, IXMLPercentageValType, 'value') as IXMLPercentageValTypeList;
  inherited;
end;

function TXMLValueForRangeType.Get_Value: IXMLPercentageValTypeList;
begin
  Result := FValue;
end;

function TXMLValueForRangeType.Get_Gt: UnicodeString;
begin
  Result := ChildNodes['gt'].Text;
end;

procedure TXMLValueForRangeType.Set_Gt(Value: UnicodeString);
begin
  ChildNodes['gt'].NodeValue := Value;
end;

function TXMLValueForRangeType.Get_Ge: UnicodeString;
begin
  Result := ChildNodes['ge'].Text;
end;

procedure TXMLValueForRangeType.Set_Ge(Value: UnicodeString);
begin
  ChildNodes['ge'].NodeValue := Value;
end;

function TXMLValueForRangeType.Get_Lt: UnicodeString;
begin
  Result := ChildNodes['lt'].Text;
end;

procedure TXMLValueForRangeType.Set_Lt(Value: UnicodeString);
begin
  ChildNodes['lt'].NodeValue := Value;
end;

function TXMLValueForRangeType.Get_Le: UnicodeString;
begin
  Result := ChildNodes['le'].Text;
end;

procedure TXMLValueForRangeType.Set_Le(Value: UnicodeString);
begin
  ChildNodes['le'].NodeValue := Value;
end;

function TXMLValueForRangeType.Get_Eq: UnicodeString;
begin
  Result := ChildNodes['eq'].Text;
end;

procedure TXMLValueForRangeType.Set_Eq(Value: UnicodeString);
begin
  ChildNodes['eq'].NodeValue := Value;
end;

{ TXMLValueForRangeTypeList }

function TXMLValueForRangeTypeList.Add: IXMLValueForRangeType;
begin
  Result := AddItem(-1) as IXMLValueForRangeType;
end;

function TXMLValueForRangeTypeList.Insert(const Index: Integer): IXMLValueForRangeType;
begin
  Result := AddItem(Index) as IXMLValueForRangeType;
end;

function TXMLValueForRangeTypeList.Get_Item(Index: Integer): IXMLValueForRangeType;
begin
  Result := List[Index] as IXMLValueForRangeType;
end;

{ TXMLWaterstate }

procedure TXMLWaterstate.AfterConstruction;
begin
  RegisterChildNode('waves', TXMLWaves);
  RegisterChildNode('swell', TXMLSwell);
  RegisterChildNode('seas', TXMLSeas);
  FWaves := CreateCollection(TXMLWavesList, IXMLWaves, 'waves') as IXMLWavesList;
  FSwell := CreateCollection(TXMLSwellList, IXMLSwell, 'swell') as IXMLSwellList;
  FSeas := CreateCollection(TXMLSeasList, IXMLSeas, 'seas') as IXMLSeasList;
  FIcecoverage := CreateCollection(TXMLNonNegativeIntegerList, IXMLNode, 'ice-coverage') as IXMLNonNegativeIntegerList;
  inherited;
end;

function TXMLWaterstate.Get_Timelayout: UnicodeString;
begin
  Result := AttributeNodes['time-layout'].Text;
end;

procedure TXMLWaterstate.Set_Timelayout(Value: UnicodeString);
begin
  SetAttribute('time-layout', Value);
end;

function TXMLWaterstate.Get_Waves: IXMLWavesList;
begin
  Result := FWaves;
end;

function TXMLWaterstate.Get_Swell: IXMLSwellList;
begin
  Result := FSwell;
end;

function TXMLWaterstate.Get_Seas: IXMLSeasList;
begin
  Result := FSeas;
end;

function TXMLWaterstate.Get_Icecoverage: IXMLNonNegativeIntegerList;
begin
  Result := FIcecoverage;
end;

{ TXMLWaterstateList }

function TXMLWaterstateList.Add: IXMLWaterstate;
begin
  Result := AddItem(-1) as IXMLWaterstate;
end;

function TXMLWaterstateList.Insert(const Index: Integer): IXMLWaterstate;
begin
  Result := AddItem(Index) as IXMLWaterstate;
end;

function TXMLWaterstateList.Get_Item(Index: Integer): IXMLWaterstate;
begin
  Result := List[Index] as IXMLWaterstate;
end;

{ TXMLWaves }

procedure TXMLWaves.AfterConstruction;
begin
  FValue := CreateCollection(TXMLNonNegativeIntegerList, IXMLNode, 'value') as IXMLNonNegativeIntegerList;
  inherited;
end;

function TXMLWaves.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLWaves.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLWaves.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLWaves.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLWaves.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLWaves.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLWaves.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLWaves.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLWaves.Get_Period: LongWord;
begin
  Result := AttributeNodes['period'].NodeValue;
end;

procedure TXMLWaves.Set_Period(Value: LongWord);
begin
  SetAttribute('period', Value);
end;

function TXMLWaves.Get_Steepness: LongWord;
begin
  Result := AttributeNodes['steepness'].NodeValue;
end;

procedure TXMLWaves.Set_Steepness(Value: LongWord);
begin
  SetAttribute('steepness', Value);
end;

function TXMLWaves.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLWaves.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLWaves.Get_Value: IXMLNonNegativeIntegerList;
begin
  Result := FValue;
end;

{ TXMLWavesList }

function TXMLWavesList.Add: IXMLWaves;
begin
  Result := AddItem(-1) as IXMLWaves;
end;

function TXMLWavesList.Insert(const Index: Integer): IXMLWaves;
begin
  Result := AddItem(Index) as IXMLWaves;
end;

function TXMLWavesList.Get_Item(Index: Integer): IXMLWaves;
begin
  Result := List[Index] as IXMLWaves;
end;

{ TXMLSwell }

procedure TXMLSwell.AfterConstruction;
begin
  RegisterChildNode('direction', TXMLDirection);
  inherited;
end;

function TXMLSwell.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLSwell.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLSwell.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLSwell.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLSwell.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLSwell.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLSwell.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLSwell.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLSwell.Get_Period: LongWord;
begin
  Result := AttributeNodes['period'].NodeValue;
end;

procedure TXMLSwell.Set_Period(Value: LongWord);
begin
  SetAttribute('period', Value);
end;

function TXMLSwell.Get_Steepness: LongWord;
begin
  Result := AttributeNodes['steepness'].NodeValue;
end;

procedure TXMLSwell.Set_Steepness(Value: LongWord);
begin
  SetAttribute('steepness', Value);
end;

function TXMLSwell.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLSwell.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLSwell.Get_Value: UnicodeString;
begin
  Result := ChildNodes['value'].Text;
end;

procedure TXMLSwell.Set_Value(Value: UnicodeString);
begin
  ChildNodes['value'].NodeValue := Value;
end;

function TXMLSwell.Get_Direction: IXMLDirection;
begin
  Result := ChildNodes['direction'] as IXMLDirection;
end;

{ TXMLSwellList }

function TXMLSwellList.Add: IXMLSwell;
begin
  Result := AddItem(-1) as IXMLSwell;
end;

function TXMLSwellList.Insert(const Index: Integer): IXMLSwell;
begin
  Result := AddItem(Index) as IXMLSwell;
end;

function TXMLSwellList.Get_Item(Index: Integer): IXMLSwell;
begin
  Result := List[Index] as IXMLSwell;
end;

{ TXMLSeas }

procedure TXMLSeas.AfterConstruction;
begin
  FValue := CreateCollection(TXMLNonNegativeIntegerList, IXMLNode, 'value') as IXMLNonNegativeIntegerList;
  inherited;
end;

function TXMLSeas.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['type'].Text;
end;

procedure TXMLSeas.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('type', Value);
end;

function TXMLSeas.Get_Units: UnicodeString;
begin
  Result := AttributeNodes['units'].Text;
end;

procedure TXMLSeas.Set_Units(Value: UnicodeString);
begin
  SetAttribute('units', Value);
end;

function TXMLSeas.Get_Categoricaltable: UnicodeString;
begin
  Result := AttributeNodes['categorical-table'].Text;
end;

procedure TXMLSeas.Set_Categoricaltable(Value: UnicodeString);
begin
  SetAttribute('categorical-table', Value);
end;

function TXMLSeas.Get_Conversiontable: UnicodeString;
begin
  Result := AttributeNodes['conversion-table'].Text;
end;

procedure TXMLSeas.Set_Conversiontable(Value: UnicodeString);
begin
  SetAttribute('conversion-table', Value);
end;

function TXMLSeas.Get_Name: UnicodeString;
begin
  Result := ChildNodes['name'].Text;
end;

procedure TXMLSeas.Set_Name(Value: UnicodeString);
begin
  ChildNodes['name'].NodeValue := Value;
end;

function TXMLSeas.Get_Value: IXMLNonNegativeIntegerList;
begin
  Result := FValue;
end;

{ TXMLSeasList }

function TXMLSeasList.Add: IXMLSeas;
begin
  Result := AddItem(-1) as IXMLSeas;
end;

function TXMLSeasList.Insert(const Index: Integer): IXMLSeas;
begin
  Result := AddItem(Index) as IXMLSeas;
end;

function TXMLSeasList.Get_Item(Index: Integer): IXMLSeas;
begin
  Result := List[Index] as IXMLSeas;
end;

{ TXMLNonNegativeIntegerList }

function TXMLNonNegativeIntegerList.Add(const Value: LongWord): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLNonNegativeIntegerList.Insert(const Index: Integer; const Value: LongWord): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLNonNegativeIntegerList.Get_Item(Index: Integer): LongWord;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLDateTimeList }

function TXMLDateTimeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLDateTimeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLDateTimeList.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLAnyURIList }

function TXMLAnyURIList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLAnyURIList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLAnyURIList.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLString_List }

function TXMLString_List.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLString_List.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLString_List.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

end.