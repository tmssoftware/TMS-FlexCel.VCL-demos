unit DemoCustomers;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDemoTables = class(TDataModule)
    ADOConnection: TADOConnection;
    Customers: TADODataSet;
    Orders: TADODataSet;
    DsCustomers: TDataSource;
    Employees: TADODataSet;
    CustomersCustomerID: TWideStringField;
    CustomersCompanyName: TWideMemoField;
    CustomersContactName: TWideMemoField;
    CustomersContactTitle: TWideMemoField;
    CustomersAddress: TWideMemoField;
    CustomersCity: TWideMemoField;
    CustomersRegion: TWideMemoField;
    CustomersPostalCode: TWideMemoField;
    CustomersCountry: TWideMemoField;
    CustomersPhone: TWideMemoField;
    CustomersFax: TWideMemoField;
    OrdersOrderID: TIntegerField;
    OrdersCustomerID: TWideStringField;
    OrdersEmployeeID: TIntegerField;
    OrdersOrderDate: TDateTimeField;
    OrdersRequiredDate: TDateTimeField;
    OrdersShippedDate: TDateTimeField;
    OrdersShipVia: TIntegerField;
    OrdersFreight: TBCDField;
    OrdersShipName: TWideMemoField;
    OrdersShipAddress: TWideMemoField;
    OrdersShipCity: TWideMemoField;
    OrdersShipRegion: TWideMemoField;
    OrdersShipPostalCode: TWideMemoField;
    OrdersShipCountry: TWideMemoField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DemoTables: TDemoTables;

implementation
uses IOUtils;

{$R *.dfm}

function DBFile: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\..\SharedData\Northwind.mdb');
end;

procedure TDemoTables.DataModuleCreate(Sender: TObject);
begin
  ADOConnection.ConnectionString := StringReplace(ADOConnection.ConnectionString, 'Northwind.mdb', DbFile, []);
end;

end.
