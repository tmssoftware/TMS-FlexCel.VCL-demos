unit MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient,
  Data.DBXJSON, System.JSON, ZLib,
  DataModel, Generics.Defaults,
  FlexCel.FMXSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render, FlexCel.Pdf,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, FMX.StdCtrls,
  FMX.WebBrowser, FMX.FlexCel.DocExport, REST.Types, FMX.Controls.Presentation;

type
  TFMainForm = class(TForm)
    SORESTClient: TRESTClient;
    SORESTRequest: TRESTRequest;
    SORESTResponse: TRESTResponse;
    ToolBar1: TToolBar;
    btnRun: TButton;
    Viewer: TWebBrowser;
    btnShare: TButton;
    FlexCelDocExport: TFlexCelDocExport;
    btnOffline: TButton;
    procedure btnRunClick(Sender: TObject);
    procedure btnShareClick(Sender: TObject);
  private
    PdfPath: string;
    function LoadData(ResponseStr: string): TVersionList;
    function CreateReport(const Versions: TVersionList): TExcelFile;
    function ExportToHtml(const Xls: TExcelFile): string;
    procedure Run;
    function ExportToPdf(const Xls: TExcelFile): string;
    function GetOfflineData: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMainForm: TFMainForm;

implementation
  uses IOUtils, System.Threading;

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}

function TFMainForm.LoadData(ResponseStr: string): TVersionList;
var
  Response: TJSONValue;
  Entries: TJSONArray;
  Item: TJSONValue;
  Name: string;
  Count: Integer;
  VersionComparer: IComparer<TVersion>;
begin
  Result := TVersionList.Create;
  try
    Response := TJSONObject.ParseJSONValue(ResponseStr);
    Entries := Response.GetValue<TJsonArray>('items');
    for Item in Entries do
    begin
      Name := Item.GetValue<string>('name');
      Name := Name.Substring('delphi-'.Length);
      if not (Name.StartsWith('XE', true)) and not (Name.StartsWith('10.', true)) then
        continue;
      if (Result.Count > 10) then break;

      Count := Item.GetValue<integer>('count');
      Result.Add(TVersion.Create(Name, Count));
    end;

    VersionComparer := TVersionComparer.Create;
    Result.Sort(VersionComparer);
  except
    Result.Free;
    raise;
  end;
end;

function TFMainForm.GetOfflineData: string;
var
  OfflineStream: TResourceStream;
  OfflineBytes: TBytes;
begin
  OfflineStream := TResourceStream.Create(hinstance, 'OFFLINE_DATA', RT_RCDATA);
  try
    SetLength(OfflineBytes, OfflineStream.Size);
    OfflineStream.Read(OfflineBytes[0], Length(OfflineBytes));
  finally
    OfflineStream.Free;
  end;

  Result := TEncoding.UTF8.GetString(OfflineBytes);
end;

procedure TFMainForm.Run;
var
  ResponseStr: string;
  Versions: TVersionList;
  Xls: TExcelFile;
  Url: string;
begin
  if btnOffline.IsPressed then
  begin
    ResponseStr := GetOfflineData;
  end else
  begin
    SORESTRequest.Execute;
    ResponseStr := SORESTResponse.Content;
  end;

  Versions := LoadData(ResponseStr);
  try
    Xls := CreateReport(Versions);
    try
      Url := ExportToHtml(Xls);
      PdfPath := ExportToPdf(Xls); //for sharing and printing.
    finally
      Xls.Free;
    end;
  finally
    Versions.Free;
  end;
  Viewer.LoadFromStrings(TFile.ReadAllText(Url), '');
end;

procedure TFMainForm.btnRunClick(Sender: TObject);
begin
  Run;
end;

procedure TFMainForm.btnShareClick(Sender: TObject);
begin
  if (PdfPath = '') then
  begin
    ShowMessage('Please run the app first');
    exit;
  end;

  // To send the file, we need to define a file provider in AndroidManifest.xml
  // See https://doc.tmssoftware.com/flexcel/vcl/guides/android-guide.html#sharing-files
  FlexCelDocExport.ExportFile(btnShare, PdfPath);
end;

function TFMainForm.CreateReport(const Versions: TVersionList): TExcelFile;
var
  Report: TFlexCelReport;
  Template: TResourceStream;
begin
  Template := TResourceStream.Create(hinstance, 'REPORT_TEMPLATE', RT_RCDATA);
  Result := TXlsFile.Create;
  try
    Result.Open(Template);

    Report := TFlexCelReport.Create;
    Report.AddTable<TVersion>('Version', Versions, TDisposeMode.DoNotDispose);
    Report.Run(Result);
  except
    Result.Free;
    raise;
  end;
end;

function TFMainForm.ExportToHtml(const Xls: TExcelFile): string;
var
  Html: TFlexCelHtmlExport;
  Meta: TArray<string>;
begin
  Html := TFlexCelHtmlExport.Create(Xls, true);
  try
    //We will use SVG, which is vectorial to export the chart, so it looks nice no matter the resolution of the phone
    Html.HtmlVersion := THtmlVersion.Html_5; //Needed to support SVG and embedded images.
    Html.SavedImagesFormat := THtmlImageFormat.Svg;
    Html.EmbedImages := true; //Embedding the chart in the html avoids the issue with managing multiple files.

    SetLength(Meta, 1);
    Meta[0] := '<meta name="viewport" content="width=device-width" />'; //To have the web page zoom to the display
    html.ExtraInfo.Meta := Meta;

    Result := TPath.Combine(TPath.GetDocumentsPath, 'versions.html');
    Html.Export(Result, '.');
  finally
    Html.Free;
  end;
end;

function TFMainForm.ExportToPdf(const Xls: TExcelFile): string;
var
  Pdf: TFlexCelPdfExport;
begin
  Pdf := TFlexCelPdfExport.Create(Xls, true);
  try
    Pdf.FontEmbed := TFontEmbed.None;
    Pdf.FontMapping := TFontMapping.ReplaceAllFonts;

    Result := TPath.Combine(TPath.GetDocumentsPath, 'delphiversions.pdf');
    Pdf.Export(Result);
  finally
    Pdf.Free;
  end;
end;

end.
