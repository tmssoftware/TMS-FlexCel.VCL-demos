unit UMainForm;
{*This program is inspired on the progam by Mikhail Arkhipov
 * at http://blogs.msdn.com/mikhailarkhipov/archive/2004/08/12/213963.aspx
 * Thanks!
 */

/* UPDATE: This was patched with the info on
 * http://weblogs.asp.net/jan/archive/2004/01/28/63771.aspx
 * to make it work.
 *
 * Thanks again...
 *
 * UPDATE 2!
 * The NOAA broke the service again, and it has not fixed it for more than a year.
 * I give up. We will use http://www.webservicex.net/WeatherForecast.asmx instead.
 * The code for NOAA is still there on the SetupNOAA method, just not used so you can see it (and try it if it ever starts working again)
 *
 * UPDATE 3!
 * Now WebserviceX is not working, going back to NOAA. As you can see, it isn't very trustable that a webservice will be there in the
 * future, so this demo might not work in online mode when you try it. But you can always look at in in offline mode.
 * *}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  XMLDoc, XMLIntf, Generics.Collections, ULatLong, Types,
  UDataModel,
  Controls, Forms, Dialogs, StdCtrls;

type
  TMainForm = class(TForm)
    edCity: TComboBox;
    lblCity: TLabel;
    cbOffline: TCheckBox;
    btnExportPdf: TButton;
    btnCancel: TButton;
    btnExportExcel: TButton;
    SaveDialogExcel: TSaveDialog;
    SaveDialogPdf: TSaveDialog;
    procedure btnExportExcelClick(Sender: TObject);
    procedure btnExportPdfClick(Sender: TObject);
    procedure edCityKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Cities: TDictionary<string, TLatLong>;
    procedure LoadCities;
    procedure Export(const SaveDialog: TSaveDialog; const ToPdf: boolean);
    function DataPath: string;
    function ReadData(const CityCoords: TLatLong; const OnLine: Boolean): string;
    function ReadOnlineData(const CityCoords: TLatLong): string;
    function GetCity(const Cities: TDictionary<string, TLatLong>; const CityName: string): TLatLong;
    function ReadOfflineData: string;
    function GetWeatherList(const dtStart: TDateTime; const xml: string): TWeatherList;
    function GetIcon(const Url: string; const UseOfflineData: boolean): TBytes;
    function LoadFileIcon(const FileName: string): TBytes;
    function LoadWebIcon(const Url: string): TBytes;
    function GetInvariantFormat: TFormatSettings;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  ndfdXML, XSBuiltIns, DateUtils,
  IdHTTP, IdComponent,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  IOUtils, StrUtils, ShellApi, XMLMapping;

{$R *.dfm}

procedure TMainForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnExportExcelClick(Sender: TObject);
begin
  Export(SaveDialogExcel, false);
end;

procedure TMainForm.btnExportPdfClick(Sender: TObject);
begin
  Export(SaveDialogPdf, true);
end;

procedure TMainForm.edCityKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edCity.DroppedDown := false;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  LoadCities;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Cities.Free;
end;

function TMainForm.DataPath: string;
begin
  Result := TPath.Combine(TPath.Combine(TPath.GetDirectoryName(ParamStr(0)),'..'),'..') + TPath.DirectorySeparatorChar;

end;

function TMainForm.GetInvariantFormat: TFormatSettings;
begin
  Result := TFormatSettings.Create('en-US');
end;

procedure TMainForm.LoadCities;
var
  xml: IXmlDocument;
  latLonList,
  cityNameList: IXMLNode;
  lats, cits: string;
  latsparsed,
  citsParsed,
  ll: TStringDynArray;
  i: Integer;
  Invariant: TFormatSettings;
begin
  Cities := TDictionary<string, TLatLong>.Create;
  Invariant := GetInvariantFormat;
  xml := TXmlDocument.Create(nil);

    xml.LoadFromFile(TPath.Combine(DataPath, 'cities.xml'));
    latLonList := xml.DocumentElement.ChildNodes.FindNode('latLonList');
    cityNameList := xml.DocumentElement.ChildNodes.FindNode('cityNameList');

    lats := latLonList.Text;
    cits := cityNameList.Text;

    latsParsed := SplitString(lats, ' ');
    citsParsed := SplitString(cits, '|');

    if Length(citsParsed) <> Length(latsParsed) then raise Exception.Create('Invalid city list');

    for i := 0 to Length(citsParsed) - 1 do
    begin
      ll := SplitString(latsParsed[i], ',');
      if (Length(ll) <> 2) then raise Exception.Create('Invalid city list');

      Cities.Add(citsParsed[i], TLatLong.Create(StrToCurr(ll[0], Invariant), StrToCurr(ll[1], Invariant)));
      edcity.Items.Add(citsParsed[i]);
    end;

    edCity.Text := 'New York,NY';

end;

function TMainForm.GetCity(const Cities: TDictionary<string, TLatLong>; const CityName: string): TLatLong;
begin
  if (not Cities.TryGetValue(CityName, Result)) then raise Exception.Create('Can''t find the city ' + CityName);
end;

function TMainForm.LoadFileIcon(const FileName: string): TBytes;
var
  fs: TFileStream;
begin
  fs := TFileStream.Create(FileName, fmOpenRead);
  try
    SetLength(Result, fs.Size);
    if (Length(Result) > 0) then fs.Read(Result[0], Length(Result));
  finally
    fs.Free;
  end;
end;

function TMainForm.LoadWebIcon(const Url: string): TBytes;
var
  Http: TIdHTTP;
  ms: TMemoryStream;
begin
  Http := TIdHTTP.Create(nil);
  try
    ms := TMemoryStream.Create;
    try
      Http.Get(Url, ms);
      SetLength(Result, ms.Size);
      ms.Position := 0;
      ms.Read(Result[0], Length(Result));
    finally
      ms.Free;
    end;
  finally
    Http.Free;
  end;
end;

function TMainForm.GetIcon(const Url: string; const UseOfflineData: boolean): TBytes;
begin
  if (Trim(url) = '') then exit(nil); //no image
  if UseOfflineData then Result := LoadFileIcon(TPath.Combine(DataPath, TPath.GetFileName(url)))
  else Result := LoadWebIcon(Url);

end;

function TMainForm.GetWeatherList(const dtStart: TDateTime; const xml: string): TWeatherList;
var
  doc: IXMLDocument;
  dwml: IXMLDwml;
  LowList,
  HighList: IXmlTempValTypeList;
  MinTemp, MaxTemp: double;
  Url: string;
  i, j, k, z: Integer;
  Invariant: TFormatSettings;

begin
  Invariant := GetInvariantFormat;

  doc := TXMLDocument.Create(nil);
  doc.LoadFromXML(xml);
  dwml := Getdwml(doc);
  Result := TWeatherList.Create();
  try
    for i := 0 to dwml.Data.Count - 1 do
    begin
      for j := 0 to dwml.Data[i].Parameters.Count - 1 do
      begin
        LowList := nil;
        HighList := nil;
        for k := 0 to dwml.Data[i].Parameters[j].Temperature.Count - 1 do
        begin
          if dwml.Data[i].Parameters[j].Temperature[k].Type_ = 'minimum'
            then LowList := dwml.Data[i].Parameters[j].Temperature[k].Value;
          if dwml.Data[i].Parameters[j].Temperature[k].Type_ = 'maximum'
            then HighList := dwml.Data[i].Parameters[j].Temperature[k].Value;

        end;

        if (LowList = nil) or (HighList = nil) then exit;

        for k := 0 to dwml.Data[i].Parameters[j].Conditionsicon.Count - 1 do
        begin
          for z := 0 to dwml.Data[i].Parameters[j].Conditionsicon[k].Iconlink.Count - 1 do
          begin
            if (z >= LowList.Count) or (z >= HighList.Count) then exit;

            MinTemp := 0;
            MaxTemp := 0;
            Url := dwml.Data[i].Parameters[j].Conditionsicon[k].Iconlink[z];
            if Trim(LowList[z].Text) <> '' then MinTemp := StrToFloat(LowList[z].Text, Invariant);
            if Trim(HighList[z].Text) <> '' then MaxTemp := StrToFloat(HighList[z].Text, Invariant);
            Result.Add(TWeather.Create(IncDay(dtStart, i),
                                       MinTemp,
                                       MaxTemp,
                                       GetIcon(Url, cbOffline.Checked)));
          end;
        end;

      end;
    end;
  Except
    Result.Free;
    raise;
  end;
end;

procedure TMainForm.Export(const SaveDialog: TSaveDialog; const ToPdf: boolean);
var
  Xls: TExcelFile;
  Pdf: TFlexCelPdfExport;
  Report: TFlexCelReport;
  CityCoords: TLatLong;
  Data: String;
  CityName: String;
  Weather: TWeatherList;
begin
  CityName := edCity.Text;
  CityCoords := GetCity(Cities, CityName);
  Data := ReadData(CityCoords, not cbOffline.Checked);

  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    Report.SetValue('Latitude', CityCoords.Latitude);
    Report.SetValue('Longitude', CityCoords.Longitude);
    Report.SetValue('Place', CityName);

    Weather := GetWeatherList(now, Data);
    try
      Report.AddTable<TWeather>('weather', Weather, TDisposeMode.DoNotDispose);
      if (ToPdf) then
      begin
        Xls := TXlsFile.Create(DataPath + 'Exporting Web Services.template.xls');
        try
          Report.Run(Xls);
          Pdf := TFlexCelPdfExport.Create(Xls, true);
          try
            Pdf.Export(SaveDialog.FileName);
          finally
            Pdf.Free;
          end;
        finally
          Xls.Free;
        end;
      end else
      begin
        Report.Run(DataPath + 'Exporting Web Services.template.xls', SaveDialog.FileName);
      end;
    finally
      Weather.Free;
    end;
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;

end;

function TMainForm.ReadData(const CityCoords: TLatLong;
  const OnLine: Boolean): string;
begin
  if Online then Result := ReadOnlineData(CityCoords)
  else Result := ReadOfflineData;
end;

function TMainForm.ReadOfflineData: string;
var
  fs: TFileStream;
  b: TBytes;
begin
  fs := TFileStream.Create(DataPath + 'OfflineData.xml', fmOpenRead);
  try
    SetLength(b, fs.Size);
    fs.Read(b[0], Length(b));
    Result := TEncoding.UTF8.GetString(b);
  finally
    fs.Free;
  end;

end;

function TMainForm.ReadOnlineData(const CityCoords: TLatLong): string;
var
  nf: ndfdXMLPortType;
  dtNow: TDateTime;
  dtStart, dtEnd: TXSDateTime;
  wp: weatherParametersType;
  Lat, Long: TXSDecimal;
  Invariant: TFormatSettings;
begin
  Invariant := GetInvariantFormat;
  dtNow := now;
  dtStart := nil;
  dtEnd := nil;
  Lat := nil;
  Long := nil;
  try
    dtStart := TXSDateTime.Create;
    dtStart.AsDateTime := dtNow;
    dtEnd := TXSDateTime.Create;
    dtEnd.AsDateTime := IncDay(dtNow, 7);


    Lat := TXSDecimal.Create;
    Lat.XSToNative(CurrToStr(CityCoords.Latitude, Invariant));

    Long := TXSDecimal.Create;
    Long.XSToNative(CurrToStr(CityCoords.Longitude, Invariant));

    nf := GetndfdXMLPortType;
    wp := weatherParametersType.Create;
    try
      Result := nf.NDFDgen(Lat, Long, productType.glance, dtStart, dtEnd, unitType.m, wp);
    finally
      wp.Free;
    end;
  finally
    dtStart.Free;
    dtEnd.Free;
    Lat.Free;
    Long.Free;
  end;
end;

end.
