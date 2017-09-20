
{***********************************************************************************************************************}
{                                                                                                                       }
{                                                   XML Data Binding                                                    }
{                                                                                                                       }
{         Generated on: 27/09/2014 17:55:45                                                                             }
{       Generated from: \Modules\20.Reports\83.HTML\OfflineData\OfflineData.xml   }
{                                                                                                                       }
{***********************************************************************************************************************}

unit TripSearchResponse;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLNewDataSetType = interface;
  IXMLResultSetType = interface;
  IXMLResultType = interface;
  IXMLImageType = interface;
  IXMLGeocodeType = interface;

{ IXMLNewDataSetType }

  IXMLNewDataSetType = interface(IXMLNode)
    ['{A20F7A18-B05F-4A11-89BB-0F3C2EE023ED}']
    { Property Accessors }
    function Get_Xmlns: UnicodeString;
    function Get_ResultSet: IXMLResultSetType;
    procedure Set_Xmlns(Value: UnicodeString);
    { Methods & Properties }
    property Xmlns: UnicodeString read Get_Xmlns write Set_Xmlns;
    property ResultSet: IXMLResultSetType read Get_ResultSet;
  end;

{ IXMLResultSetType }

  IXMLResultSetType = interface(IXMLNodeCollection)
    ['{C75C878E-C014-44DD-9DAC-DDD082484592}']
    { Property Accessors }
    function Get_TotalResultsAvailable: Integer;
    function Get_TotalResultsReturned: Integer;
    function Get_FirstResultPosition: Integer;
    function Get_Result(Index: Integer): IXMLResultType;
    procedure Set_TotalResultsAvailable(Value: Integer);
    procedure Set_TotalResultsReturned(Value: Integer);
    procedure Set_FirstResultPosition(Value: Integer);
    { Methods & Properties }
    function Add: IXMLResultType;
    function Insert(const Index: Integer): IXMLResultType;
    property TotalResultsAvailable: Integer read Get_TotalResultsAvailable write Set_TotalResultsAvailable;
    property TotalResultsReturned: Integer read Get_TotalResultsReturned write Set_TotalResultsReturned;
    property FirstResultPosition: Integer read Get_FirstResultPosition write Set_FirstResultPosition;
    property Result[Index: Integer]: IXMLResultType read Get_Result; default;
  end;

{ IXMLResultType }

  IXMLResultType = interface(IXMLNode)
    ['{FFF9EAEE-9172-41B2-88F7-BBABFF59856B}']
    { Property Accessors }
    function Get_Id: Integer;
    function Get_Title: UnicodeString;
    function Get_Summary: UnicodeString;
    function Get_Destinations: UnicodeString;
    function Get_CreateDate: UnicodeString;
    function Get_Duration: Integer;
    function Get_Url: UnicodeString;
    function Get_ImageData: UnicodeString;
    function Get_Image: IXMLImageType;
    function Get_Geocode: IXMLGeocodeType;
    procedure Set_Id(Value: Integer);
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Summary(Value: UnicodeString);
    procedure Set_Destinations(Value: UnicodeString);
    procedure Set_CreateDate(Value: UnicodeString);
    procedure Set_Duration(Value: Integer);
    procedure Set_Url(Value: UnicodeString);
    procedure Set_ImageData(Value: UnicodeString);
    { Methods & Properties }
    property Id: Integer read Get_Id write Set_Id;
    property Title: UnicodeString read Get_Title write Set_Title;
    property Summary: UnicodeString read Get_Summary write Set_Summary;
    property Destinations: UnicodeString read Get_Destinations write Set_Destinations;
    property CreateDate: UnicodeString read Get_CreateDate write Set_CreateDate;
    property Duration: Integer read Get_Duration write Set_Duration;
    property Url: UnicodeString read Get_Url write Set_Url;
    property ImageData: UnicodeString read Get_ImageData write Set_ImageData;
    property Image: IXMLImageType read Get_Image;
    property Geocode: IXMLGeocodeType read Get_Geocode;
  end;

{ IXMLImageType }

  IXMLImageType = interface(IXMLNode)
    ['{1E1E3824-927A-4F1D-93BC-899E4014624A}']
    { Property Accessors }
    function Get_Url: UnicodeString;
    function Get_Height: Integer;
    function Get_Width: Integer;
    procedure Set_Url(Value: UnicodeString);
    procedure Set_Height(Value: Integer);
    procedure Set_Width(Value: Integer);
    { Methods & Properties }
    property Url: UnicodeString read Get_Url write Set_Url;
    property Height: Integer read Get_Height write Set_Height;
    property Width: Integer read Get_Width write Set_Width;
  end;

{ IXMLGeocodeType }

  IXMLGeocodeType = interface(IXMLNode)
    ['{718AD5DF-D0F0-4793-B836-F5ECABE3FB61}']
    { Property Accessors }
    function Get_Longitude: UnicodeString;
    procedure Set_Longitude(Value: UnicodeString);
    { Methods & Properties }
    property Longitude: UnicodeString read Get_Longitude write Set_Longitude;
  end;

{ Forward Decls }

  TXMLNewDataSetType = class;
  TXMLResultSetType = class;
  TXMLResultType = class;
  TXMLImageType = class;
  TXMLGeocodeType = class;

{ TXMLNewDataSetType }

  TXMLNewDataSetType = class(TXMLNode, IXMLNewDataSetType)
  protected
    { IXMLNewDataSetType }
    function Get_Xmlns: UnicodeString;
    function Get_ResultSet: IXMLResultSetType;
    procedure Set_Xmlns(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLResultSetType }

  TXMLResultSetType = class(TXMLNodeCollection, IXMLResultSetType)
  protected
    { IXMLResultSetType }
    function Get_TotalResultsAvailable: Integer;
    function Get_TotalResultsReturned: Integer;
    function Get_FirstResultPosition: Integer;
    function Get_Result(Index: Integer): IXMLResultType;
    procedure Set_TotalResultsAvailable(Value: Integer);
    procedure Set_TotalResultsReturned(Value: Integer);
    procedure Set_FirstResultPosition(Value: Integer);
    function Add: IXMLResultType;
    function Insert(const Index: Integer): IXMLResultType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLResultType }

  TXMLResultType = class(TXMLNode, IXMLResultType)
  protected
    { IXMLResultType }
    function Get_Id: Integer;
    function Get_Title: UnicodeString;
    function Get_Summary: UnicodeString;
    function Get_Destinations: UnicodeString;
    function Get_CreateDate: UnicodeString;
    function Get_Duration: Integer;
    function Get_Url: UnicodeString;
    function Get_ImageData: UnicodeString;
    function Get_Image: IXMLImageType;
    function Get_Geocode: IXMLGeocodeType;
    procedure Set_Id(Value: Integer);
    procedure Set_Title(Value: UnicodeString);
    procedure Set_Summary(Value: UnicodeString);
    procedure Set_Destinations(Value: UnicodeString);
    procedure Set_CreateDate(Value: UnicodeString);
    procedure Set_Duration(Value: Integer);
    procedure Set_Url(Value: UnicodeString);
    procedure Set_ImageData(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLImageType }

  TXMLImageType = class(TXMLNode, IXMLImageType)
  protected
    { IXMLImageType }
    function Get_Url: UnicodeString;
    function Get_Height: Integer;
    function Get_Width: Integer;
    procedure Set_Url(Value: UnicodeString);
    procedure Set_Height(Value: Integer);
    procedure Set_Width(Value: Integer);
  end;

{ TXMLGeocodeType }

  TXMLGeocodeType = class(TXMLNode, IXMLGeocodeType)
  protected
    { IXMLGeocodeType }
    function Get_Longitude: UnicodeString;
    procedure Set_Longitude(Value: UnicodeString);
  end;

{ Global Functions }

function GetNewDataSet(Doc: IXMLDocument): IXMLNewDataSetType;
function LoadNewDataSet(const FileName: string): IXMLNewDataSetType;
function NewNewDataSet: IXMLNewDataSetType;

const
  TargetNamespace = 'urn:yahoo:travel';

implementation

{ Global Functions }

function GetNewDataSet(Doc: IXMLDocument): IXMLNewDataSetType;
begin
  Result := Doc.GetDocBinding('NewDataSet', TXMLNewDataSetType, TargetNamespace) as IXMLNewDataSetType;
end;

function LoadNewDataSet(const FileName: string): IXMLNewDataSetType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('NewDataSet', TXMLNewDataSetType, TargetNamespace) as IXMLNewDataSetType;
end;

function NewNewDataSet: IXMLNewDataSetType;
begin
  Result := NewXMLDocument.GetDocBinding('NewDataSet', TXMLNewDataSetType, TargetNamespace) as IXMLNewDataSetType;
end;

{ TXMLNewDataSetType }

procedure TXMLNewDataSetType.AfterConstruction;
begin
  RegisterChildNode('ResultSet', TXMLResultSetType);
  inherited;
end;

function TXMLNewDataSetType.Get_Xmlns: UnicodeString;
begin
  Result := AttributeNodes['xmlns'].Text;
end;

procedure TXMLNewDataSetType.Set_Xmlns(Value: UnicodeString);
begin
  SetAttribute('xmlns', Value);
end;

function TXMLNewDataSetType.Get_ResultSet: IXMLResultSetType;
begin
  Result := ChildNodes['ResultSet'] as IXMLResultSetType;
end;

{ TXMLResultSetType }

procedure TXMLResultSetType.AfterConstruction;
begin
  RegisterChildNode('Result', TXMLResultType);
  ItemTag := 'Result';
  ItemInterface := IXMLResultType;
  inherited;
end;

function TXMLResultSetType.Get_TotalResultsAvailable: Integer;
begin
  Result := AttributeNodes['totalResultsAvailable'].NodeValue;
end;

procedure TXMLResultSetType.Set_TotalResultsAvailable(Value: Integer);
begin
  SetAttribute('totalResultsAvailable', Value);
end;

function TXMLResultSetType.Get_TotalResultsReturned: Integer;
begin
  Result := AttributeNodes['totalResultsReturned'].NodeValue;
end;

procedure TXMLResultSetType.Set_TotalResultsReturned(Value: Integer);
begin
  SetAttribute('totalResultsReturned', Value);
end;

function TXMLResultSetType.Get_FirstResultPosition: Integer;
begin
  Result := AttributeNodes['firstResultPosition'].NodeValue;
end;

procedure TXMLResultSetType.Set_FirstResultPosition(Value: Integer);
begin
  SetAttribute('firstResultPosition', Value);
end;

function TXMLResultSetType.Get_Result(Index: Integer): IXMLResultType;
begin
  Result := List[Index] as IXMLResultType;
end;

function TXMLResultSetType.Add: IXMLResultType;
begin
  Result := AddItem(-1) as IXMLResultType;
end;

function TXMLResultSetType.Insert(const Index: Integer): IXMLResultType;
begin
  Result := AddItem(Index) as IXMLResultType;
end;

{ TXMLResultType }

procedure TXMLResultType.AfterConstruction;
begin
  RegisterChildNode('Image', TXMLImageType);
  RegisterChildNode('Geocode', TXMLGeocodeType);
  inherited;
end;

function TXMLResultType.Get_Id: Integer;
begin
  Result := AttributeNodes['id'].NodeValue;
end;

procedure TXMLResultType.Set_Id(Value: Integer);
begin
  SetAttribute('id', Value);
end;

function TXMLResultType.Get_Title: UnicodeString;
begin
  Result := ChildNodes['Title'].Text;
end;

procedure TXMLResultType.Set_Title(Value: UnicodeString);
begin
  ChildNodes['Title'].NodeValue := Value;
end;

function TXMLResultType.Get_Summary: UnicodeString;
begin
  Result := ChildNodes['Summary'].Text;
end;

procedure TXMLResultType.Set_Summary(Value: UnicodeString);
begin
  ChildNodes['Summary'].NodeValue := Value;
end;

function TXMLResultType.Get_Destinations: UnicodeString;
begin
  Result := ChildNodes['Destinations'].Text;
end;

procedure TXMLResultType.Set_Destinations(Value: UnicodeString);
begin
  ChildNodes['Destinations'].NodeValue := Value;
end;

function TXMLResultType.Get_CreateDate: UnicodeString;
begin
  Result := ChildNodes['CreateDate'].Text;
end;

procedure TXMLResultType.Set_CreateDate(Value: UnicodeString);
begin
  ChildNodes['CreateDate'].NodeValue := Value;
end;

function TXMLResultType.Get_Duration: Integer;
begin
  Result := ChildNodes['Duration'].NodeValue;
end;

procedure TXMLResultType.Set_Duration(Value: Integer);
begin
  ChildNodes['Duration'].NodeValue := Value;
end;

function TXMLResultType.Get_Url: UnicodeString;
begin
  Result := ChildNodes['Url'].Text;
end;

procedure TXMLResultType.Set_Url(Value: UnicodeString);
begin
  ChildNodes['Url'].NodeValue := Value;
end;

function TXMLResultType.Get_ImageData: UnicodeString;
begin
  Result := ChildNodes['ImageData'].Text;
end;

procedure TXMLResultType.Set_ImageData(Value: UnicodeString);
begin
  ChildNodes['ImageData'].NodeValue := Value;
end;

function TXMLResultType.Get_Image: IXMLImageType;
begin
  Result := ChildNodes['Image'] as IXMLImageType;
end;

function TXMLResultType.Get_Geocode: IXMLGeocodeType;
begin
  Result := ChildNodes['Geocode'] as IXMLGeocodeType;
end;

{ TXMLImageType }

function TXMLImageType.Get_Url: UnicodeString;
begin
  Result := ChildNodes['Url'].Text;
end;

procedure TXMLImageType.Set_Url(Value: UnicodeString);
begin
  ChildNodes['Url'].NodeValue := Value;
end;

function TXMLImageType.Get_Height: Integer;
begin
  Result := ChildNodes['Height'].NodeValue;
end;

procedure TXMLImageType.Set_Height(Value: Integer);
begin
  ChildNodes['Height'].NodeValue := Value;
end;

function TXMLImageType.Get_Width: Integer;
begin
  Result := ChildNodes['Width'].NodeValue;
end;

procedure TXMLImageType.Set_Width(Value: Integer);
begin
  ChildNodes['Width'].NodeValue := Value;
end;

{ TXMLGeocodeType }

function TXMLGeocodeType.Get_Longitude: UnicodeString;
begin
  Result := ChildNodes['Longitude'].Text;
end;

procedure TXMLGeocodeType.Set_Longitude(Value: UnicodeString);
begin
  ChildNodes['Longitude'].NodeValue := Value;
end;

end.