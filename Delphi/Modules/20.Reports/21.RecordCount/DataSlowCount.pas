unit DataSlowCount;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TTablesSlowCount = class(TDataModule)
    ADOConnection: TADOConnection;
    Categories: TADODataSet;
    Products: TADODataSet;
    DsCategories: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TablesSlowCount: TTablesSlowCount;

implementation
uses IOUtils;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function DBFile: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\..\SharedData\Northwind.mdb');
end;

procedure TTablesSlowCount.DataModuleCreate(Sender: TObject);
begin
  ADOConnection.ConnectionString := StringReplace(ADOConnection.ConnectionString, 'Northwind.mdb', DbFile, []);
end;

end.
