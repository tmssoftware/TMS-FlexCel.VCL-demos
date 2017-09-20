unit DemoData;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDemoTables = class(TDataModule)
    ADOConnection: TADOConnection;
    Categories: TADODataSet;
    Products: TADODataSet;
    DsCategories: TDataSource;
    OrderDetails: TADODataSet;
    DsProducts: TDataSource;
    Employees: TADODataSet;
    Orders: TADODataSet;
    DsEmployees: TDataSource;
    Suppliers: TADODataSet;
    Shippers: TADODataSet;
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
