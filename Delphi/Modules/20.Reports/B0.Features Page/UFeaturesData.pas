unit UFeaturesData;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TFeaturesDataModule = class(TDataModule)
    Categories: TADODataSet;
    ADOConnection: TADOConnection;
    Features: TADODataSet;
    Hyperlinks: TADODataSet;
    DsCategories: TDataSource;
    DsFeatures: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FeaturesDataModule: TFeaturesDataModule;

implementation
uses IOUtils;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

function DBFile: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\features.mdb');
end;

procedure TFeaturesDataModule.DataModuleCreate(Sender: TObject);
begin
  ADOConnection.ConnectionString := StringReplace(ADOConnection.ConnectionString, 'features.mdb', DbFile, []);
end;

end.
