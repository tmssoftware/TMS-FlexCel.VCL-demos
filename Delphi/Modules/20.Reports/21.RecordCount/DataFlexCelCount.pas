unit DataFlexCelCount;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TTablesFlexCelCount = class(TDataModule)
    ADOConnection: TADOConnection;
    Categories: TADODataSet;
    Products: TADODataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TablesFlexCelCount: TTablesFlexCelCount;

implementation
uses IOUtils;
{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function DBFile: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\..\SharedData\Northwind.mdb');
end;

procedure TTablesFlexCelCount.DataModuleCreate(Sender: TObject);
begin
  ADOConnection.ConnectionString := StringReplace(ADOConnection.ConnectionString, 'Northwind.mdb', DbFile, []);
end;

end.
