unit DemoProducts;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDemoTables = class(TDataModule)
    ADOConnection: TADOConnection;
    Products: TADODataSet;
    OrderDetails: TADODataSet;
    DsProducts: TDataSource;
    ProductsProductID: TIntegerField;
    ProductsProductName: TWideMemoField;
    ProductsSupplierID: TIntegerField;
    ProductsCategoryID: TIntegerField;
    ProductsQuantityPerUnit: TWideMemoField;
    ProductsUnitPrice: TBCDField;
    ProductsUnitsInStock: TSmallintField;
    ProductsUnitsOnOrder: TSmallintField;
    ProductsReorderLevel: TSmallintField;
    ProductsDiscontinued: TBooleanField;
    OrderDetailsOrderID: TIntegerField;
    OrderDetailsProductID: TIntegerField;
    OrderDetailsUnitPrice: TBCDField;
    OrderDetailsQuantity: TSmallintField;
    OrderDetailsDiscount: TFloatField;
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
