unit DataModel;

interface

uses
  SysUtils, Generics.Collections, Aurelius.Mapping.Attributes, Aurelius.Types.Blob, Aurelius.Types.DynamicProperties, Aurelius.Types.Nullable, Aurelius.Types.Proxy, Aurelius.Criteria.Dictionary;

type
  TEmployees = class;
  TOrders = class;
  TShippers = class;
  TEmployeesTableDictionary = class;
  TOrdersTableDictionary = class;
  TShippersTableDictionary = class;

  [Entity]
  [Table('Employees')]
  [Id('FEmployeeID', TIdGenerator.IdentityOrSequence)]
  TEmployees = class
  private
    [Column('EmployeeID', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FEmployeeID: integer;

    [Column('LastName', [TColumnProp.Required], 20)]
    FLastName: string;

    [Column('FirstName', [TColumnProp.Required], 10)]
    FFirstName: string;

    [Column('Title', [], 30)]
    FTitle: Nullable<string>;

    [Column('TitleOfCourtesy', [], 25)]
    FTitleOfCourtesy: Nullable<string>;

    [Column('BirthDate', [])]
    FBirthDate: Nullable<TDateTime>;

    [Column('HireDate', [])]
    FHireDate: Nullable<TDateTime>;

    [Column('Address', [], 60)]
    FAddress: Nullable<string>;

    [Column('City', [], 15)]
    FCity: Nullable<string>;

    [Column('Region', [], 15)]
    FRegion: Nullable<string>;

    [Column('PostalCode', [], 10)]
    FPostalCode: Nullable<string>;

    [Column('Country', [], 15)]
    FCountry: Nullable<string>;

    [Column('HomePhone', [], 24)]
    FHomePhone: Nullable<string>;

    [Column('Extension', [], 4)]
    FExtension: Nullable<string>;

    [Column('Photo', [TColumnProp.Lazy])]
    FPhoto: TBlob;

    [Column('Notes', [TColumnProp.Lazy])]
    FNotes: TBlob;

    [Column('PhotoPath', [], 255)]
    FPhotoPath: Nullable<string>;

    [Association([TAssociationProp.Lazy], [])]
    [JoinColumn('ReportsTo', [], 'EmployeeID')]
    FReportsTo: Proxy<TEmployees>;
    function GetReportsTo: TEmployees;
    procedure SetReportsTo(const Value: TEmployees);
  public
    property EmployeeID: integer read FEmployeeID write FEmployeeID;
    property LastName: string read FLastName write FLastName;
    property FirstName: string read FFirstName write FFirstName;
    property Title: Nullable<string> read FTitle write FTitle;
    property TitleOfCourtesy: Nullable<string> read FTitleOfCourtesy write FTitleOfCourtesy;
    property BirthDate: Nullable<TDateTime> read FBirthDate write FBirthDate;
    property HireDate: Nullable<TDateTime> read FHireDate write FHireDate;
    property Address: Nullable<string> read FAddress write FAddress;
    property City: Nullable<string> read FCity write FCity;
    property Region: Nullable<string> read FRegion write FRegion;
    property PostalCode: Nullable<string> read FPostalCode write FPostalCode;
    property Country: Nullable<string> read FCountry write FCountry;
    property HomePhone: Nullable<string> read FHomePhone write FHomePhone;
    property Extension: Nullable<string> read FExtension write FExtension;
    property Photo: TBlob read FPhoto write FPhoto;
    property Notes: TBlob read FNotes write FNotes;
    property PhotoPath: Nullable<string> read FPhotoPath write FPhotoPath;
    property ReportsTo: TEmployees read GetReportsTo write SetReportsTo;
  end;

  [Entity]
  [Table('Orders')]
  [Id('FOrderID', TIdGenerator.IdentityOrSequence)]
  TOrders = class
  private
    [Column('OrderID', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FOrderID: integer;

    [Column('OrderDate', [])]
    FOrderDate: Nullable<TDateTime>;

    [Column('RequiredDate', [])]
    FRequiredDate: Nullable<TDateTime>;

    [Column('ShippedDate', [])]
    FShippedDate: Nullable<TDateTime>;

    [Column('Freight', [])]
    FFreight: Nullable<double>;

    [Column('ShipName', [], 40)]
    FShipName: Nullable<string>;

    [Column('ShipAddress', [], 60)]
    FShipAddress: Nullable<string>;

    [Column('ShipCity', [], 15)]
    FShipCity: Nullable<string>;

    [Column('ShipRegion', [], 15)]
    FShipRegion: Nullable<string>;

    [Column('ShipPostalCode', [], 10)]
    FShipPostalCode: Nullable<string>;

    [Column('ShipCountry', [], 15)]
    FShipCountry: Nullable<string>;

    [Column('EmployeeID', [])]
    FEmployeeID: Integer;

    [Association([TAssociationProp.Lazy], [])]
    [JoinColumn('ShipVia', [], 'ShipperID')]
    FShipVia: Proxy<TShippers>;
    function GetShipVia: TShippers;
    procedure SetShipVia(const Value: TShippers);
  public
    property OrderID: integer read FOrderID write FOrderID;
    property OrderDate: Nullable<TDateTime> read FOrderDate write FOrderDate;
    property RequiredDate: Nullable<TDateTime> read FRequiredDate write FRequiredDate;
    property ShippedDate: Nullable<TDateTime> read FShippedDate write FShippedDate;
    property Freight: Nullable<double> read FFreight write FFreight;
    property ShipName: Nullable<string> read FShipName write FShipName;
    property ShipAddress: Nullable<string> read FShipAddress write FShipAddress;
    property ShipCity: Nullable<string> read FShipCity write FShipCity;
    property ShipRegion: Nullable<string> read FShipRegion write FShipRegion;
    property ShipPostalCode: Nullable<string> read FShipPostalCode write FShipPostalCode;
    property ShipCountry: Nullable<string> read FShipCountry write FShipCountry;
    property EmployeeID: integer read FEmployeeID write FEmployeeID;
    property ShipVia: TShippers read GetShipVia write SetShipVia;
  end;

  [Entity]
  [Table('Shippers')]
  [Id('FShipperID', TIdGenerator.IdentityOrSequence)]
  TShippers = class
  private
    [Column('ShipperID', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    FShipperID: integer;

    [Column('CompanyName', [TColumnProp.Required], 40)]
    FCompanyName: string;

    [Column('Phone', [], 24)]
    FPhone: Nullable<string>;
  public
    property ShipperID: integer read FShipperID write FShipperID;
    property CompanyName: string read FCompanyName write FCompanyName;
    property Phone: Nullable<string> read FPhone write FPhone;
  end;

  TDicDictionary = class
  private
    FEmployees: TEmployeesTableDictionary;
    FOrders: TOrdersTableDictionary;
    FShippers: TShippersTableDictionary;
    function GetEmployees: TEmployeesTableDictionary;
    function GetOrders: TOrdersTableDictionary;
    function GetShippers: TShippersTableDictionary;
  public
    destructor Destroy; override;
    property Employees: TEmployeesTableDictionary read GetEmployees;
    property Orders: TOrdersTableDictionary read GetOrders;
    property Shippers: TShippersTableDictionary read GetShippers;
  end;

  TEmployeesTableDictionary = class
  private
    FEmployeeID: TDictionaryAttribute;
    FLastName: TDictionaryAttribute;
    FFirstName: TDictionaryAttribute;
    FTitle: TDictionaryAttribute;
    FTitleOfCourtesy: TDictionaryAttribute;
    FBirthDate: TDictionaryAttribute;
    FHireDate: TDictionaryAttribute;
    FAddress: TDictionaryAttribute;
    FCity: TDictionaryAttribute;
    FRegion: TDictionaryAttribute;
    FPostalCode: TDictionaryAttribute;
    FCountry: TDictionaryAttribute;
    FHomePhone: TDictionaryAttribute;
    FExtension: TDictionaryAttribute;
    FPhoto: TDictionaryAttribute;
    FNotes: TDictionaryAttribute;
    FPhotoPath: TDictionaryAttribute;
    FReportsTo: TDictionaryAssociation;
  public
    constructor Create;
    property EmployeeID: TDictionaryAttribute read FEmployeeID;
    property LastName: TDictionaryAttribute read FLastName;
    property FirstName: TDictionaryAttribute read FFirstName;
    property Title: TDictionaryAttribute read FTitle;
    property TitleOfCourtesy: TDictionaryAttribute read FTitleOfCourtesy;
    property BirthDate: TDictionaryAttribute read FBirthDate;
    property HireDate: TDictionaryAttribute read FHireDate;
    property Address: TDictionaryAttribute read FAddress;
    property City: TDictionaryAttribute read FCity;
    property Region: TDictionaryAttribute read FRegion;
    property PostalCode: TDictionaryAttribute read FPostalCode;
    property Country: TDictionaryAttribute read FCountry;
    property HomePhone: TDictionaryAttribute read FHomePhone;
    property Extension: TDictionaryAttribute read FExtension;
    property Photo: TDictionaryAttribute read FPhoto;
    property Notes: TDictionaryAttribute read FNotes;
    property PhotoPath: TDictionaryAttribute read FPhotoPath;
    property ReportsTo: TDictionaryAssociation read FReportsTo;
  end;

  TOrdersTableDictionary = class
  private
    FOrderID: TDictionaryAttribute;
    FOrderDate: TDictionaryAttribute;
    FRequiredDate: TDictionaryAttribute;
    FShippedDate: TDictionaryAttribute;
    FFreight: TDictionaryAttribute;
    FShipName: TDictionaryAttribute;
    FShipAddress: TDictionaryAttribute;
    FShipCity: TDictionaryAttribute;
    FShipRegion: TDictionaryAttribute;
    FShipPostalCode: TDictionaryAttribute;
    FShipCountry: TDictionaryAttribute;
    FEmployeeID: TDictionaryAssociation;
    FShipVia: TDictionaryAssociation;
  public
    constructor Create;
    property OrderID: TDictionaryAttribute read FOrderID;
    property OrderDate: TDictionaryAttribute read FOrderDate;
    property RequiredDate: TDictionaryAttribute read FRequiredDate;
    property ShippedDate: TDictionaryAttribute read FShippedDate;
    property Freight: TDictionaryAttribute read FFreight;
    property ShipName: TDictionaryAttribute read FShipName;
    property ShipAddress: TDictionaryAttribute read FShipAddress;
    property ShipCity: TDictionaryAttribute read FShipCity;
    property ShipRegion: TDictionaryAttribute read FShipRegion;
    property ShipPostalCode: TDictionaryAttribute read FShipPostalCode;
    property ShipCountry: TDictionaryAttribute read FShipCountry;
    property EmployeeID: TDictionaryAssociation read FEmployeeID;
    property ShipVia: TDictionaryAssociation read FShipVia;
  end;

  TShippersTableDictionary = class
  private
    FShipperID: TDictionaryAttribute;
    FCompanyName: TDictionaryAttribute;
    FPhone: TDictionaryAttribute;
  public
    constructor Create;
    property ShipperID: TDictionaryAttribute read FShipperID;
    property CompanyName: TDictionaryAttribute read FCompanyName;
    property Phone: TDictionaryAttribute read FPhone;
  end;

function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ TEmployees}

function TEmployees.GetReportsTo: TEmployees;
begin
  result := FReportsTo.Value;
end;

procedure TEmployees.SetReportsTo(const Value: TEmployees);
begin
  FReportsTo.Value := Value;
end;

{ TOrders}

function TOrders.GetShipVia: TShippers;
begin
  result := FShipVia.Value;
end;

procedure TOrders.SetShipVia(const Value: TShippers);
begin
  FShipVia.Value := Value;
end;

{ TDicDictionary}

destructor TDicDictionary.Destroy;
begin
  inherited;
  if FEmployees <> nil then FEmployees.Free;
  if FOrders <> nil then FOrders.Free;
  if FShippers <> nil then FShippers.Free;
end;

function TDicDictionary.GetEmployees: TEmployeesTableDictionary;
begin
  if FEmployees = nil then FEmployees := TEmployeesTableDictionary.Create;
  result := FEmployees;
end;

function TDicDictionary.GetOrders: TOrdersTableDictionary;
begin
  if FOrders = nil then FOrders := TOrdersTableDictionary.Create;
  result := FOrders;
end;

function TDicDictionary.GetShippers: TShippersTableDictionary;
begin
  if FShippers = nil then FShippers := TShippersTableDictionary.Create;
  result := FShippers;
end;

{ TEmployeesTableDictionary}

constructor TEmployeesTableDictionary.Create;
begin
  FEmployeeID := TDictionaryAttribute.Create('EmployeeID');
  FLastName := TDictionaryAttribute.Create('LastName');
  FFirstName := TDictionaryAttribute.Create('FirstName');
  FTitle := TDictionaryAttribute.Create('Title');
  FTitleOfCourtesy := TDictionaryAttribute.Create('TitleOfCourtesy');
  FBirthDate := TDictionaryAttribute.Create('BirthDate');
  FHireDate := TDictionaryAttribute.Create('HireDate');
  FAddress := TDictionaryAttribute.Create('Address');
  FCity := TDictionaryAttribute.Create('City');
  FRegion := TDictionaryAttribute.Create('Region');
  FPostalCode := TDictionaryAttribute.Create('PostalCode');
  FCountry := TDictionaryAttribute.Create('Country');
  FHomePhone := TDictionaryAttribute.Create('HomePhone');
  FExtension := TDictionaryAttribute.Create('Extension');
  FPhoto := TDictionaryAttribute.Create('Photo');
  FNotes := TDictionaryAttribute.Create('Notes');
  FPhotoPath := TDictionaryAttribute.Create('PhotoPath');
  FReportsTo := TDictionaryAssociation.Create('ReportsTo');
end;

{ TOrdersTableDictionary}

constructor TOrdersTableDictionary.Create;
begin
  FOrderID := TDictionaryAttribute.Create('OrderID');
  FOrderDate := TDictionaryAttribute.Create('OrderDate');
  FRequiredDate := TDictionaryAttribute.Create('RequiredDate');
  FShippedDate := TDictionaryAttribute.Create('ShippedDate');
  FFreight := TDictionaryAttribute.Create('Freight');
  FShipName := TDictionaryAttribute.Create('ShipName');
  FShipAddress := TDictionaryAttribute.Create('ShipAddress');
  FShipCity := TDictionaryAttribute.Create('ShipCity');
  FShipRegion := TDictionaryAttribute.Create('ShipRegion');
  FShipPostalCode := TDictionaryAttribute.Create('ShipPostalCode');
  FShipCountry := TDictionaryAttribute.Create('ShipCountry');
  FEmployeeID := TDictionaryAssociation.Create('EmployeeID');
  FShipVia := TDictionaryAssociation.Create('ShipVia');
end;

{ TShippersTableDictionary}

constructor TShippersTableDictionary.Create;
begin
  FShipperID := TDictionaryAttribute.Create('ShipperID');
  FCompanyName := TDictionaryAttribute.Create('CompanyName');
  FPhone := TDictionaryAttribute.Create('Phone');
end;

initialization

finalization
  if __Dic <> nil then __Dic.Free

end.

