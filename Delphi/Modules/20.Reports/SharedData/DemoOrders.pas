unit DemoOrders;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  TDemoTables = class(TDataModule)
    ADOConnection: TADOConnection;
    Orders: TADODataSet;
    Customers: TADODataSet;
    Employees: TADODataSet;
    Shippers: TADODataSet;
    OrderDetails: TADODataSet;
    Products: TADODataSet;
    Suppliers: TADODataSet;
    Categories: TADODataSet;
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
var
  i: integer;
begin
  ADOConnection.ConnectionString := StringReplace(ADOConnection.ConnectionString, 'Northwind.mdb', DbFile, []);

  //Ado datasets are slower when controls are enabled.
  //In this case there are no TDataSources, so we can disable them all.
  for i := 0 to ComponentCount - 1 do if Components[i] is TDataSet then TDataSet(Components[i]).DisableControls;


end;

end.
