unit Queries;

interface
uses Generics.Collections, DataModel,
     Aurelius.Drivers.Interfaces, Aurelius.Drivers.dbGo,
     Aurelius.Sql.MSSQL,
     Aurelius.Engine.ObjectManager,
     ADODb,
     Aurelius.Criteria.Base, Aurelius.Criteria.Linq;

type
  TAureliusQuery = class
  private
    ADOConnection: TADOConnection;
    Connection: IDBConnection;
    Manager: TObjectManager;
    FEmployees: TObjectList<TEmployees>;
    FOrders: TObjectList<TOrders>;
  public
    constructor Create(const DBFile: string);
    destructor Destroy; override;
    function GetEmployees: TList<TEmployees>;
    function GetOrders: TList<TOrders>;

  end;

implementation
uses SysUtils;

const BAseConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Northwind.mdb;Persist Security Info=False;';

constructor TAureliusQuery.Create(const DBFile: string);
begin
  ADOConnection := TADOConnection.Create(nil);
  ADOConnection.ConnectionString := StringReplace(BaseConnectionString, 'Northwind.mdb', DbFile, []);
  Connection := TDbGoConnectionAdapter.Create(ADOConnection, false);
  Manager := TObjectManager.Create(Connection);
end;

destructor TAureliusQuery.Destroy;
begin
  FOrders.Free;
  FEmployees.Free;
  Manager.Free;
  Connection := nil;
  ADOConnection.Free;
  inherited;
end;

function TAureliusQuery.GetEmployees: TList<TEmployees>;
begin
  FEmployees.Free;
  FEmployees := Manager.Find<TEmployees>
            .List;
  Result := FEmployees;
end;

function TAureliusQuery.GetOrders: TList<TOrders>;
begin
  FOrders.Free;
  FOrders := Manager.Find<TOrders>
            .List;
  Result := FOrders;
end;

end.
