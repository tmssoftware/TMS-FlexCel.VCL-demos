unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi, DataModel, Generics.Collections,
  XMLDoc, XMLIntf,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    btnCancel: TButton;
    btnGo: TButton;
    SaveDialog: TSaveDialog;
    cbFeeds: TComboBox;
    cbOffline: TCheckBox;
    cbShowFeedCount: TCheckBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Feeds: TArray<TFeedData>;

    procedure RunReport;
    function GetDataPath: string;
    function GetLogo: TBytes;
    function CurrentFeed: TFeedData;
    function GetFeedContents: TArray<TFeedContent>;
    function GetFeedContentsEx: TArray<TFeedContentEx>;
    function GetOfflineData: IXmlDocument;
    procedure LoadFeeds(node: IXmlNode; const FeedList: TList<TFeedContent>);
    procedure LoadFeedsEx(node: IXmlNode;
      const FeedList: TList<TFeedContentEx>);
    function GetOnlineData: IXmlDocument;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils, IdHTTP, IdComponent;

{$R *.dfm}

procedure TMainForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnGoClick(Sender: TObject);
begin
  RunReport;

end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  Feeds := GetFeeds;
  for i := 0 to High(Feeds) do
  begin
    cbFeeds.Items.Add(Feeds[i].Name);
  end;
  cbFeeds.ItemIndex := 0;
end;

function TMainForm.GetDataPath: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..');
end;

function TMainForm.GetLogo: TBytes;
var
  fs: TFileStream;
begin
  fs := TFileStream.Create(
    TPath.Combine(TPath.Combine(GetDataPath, 'logos'), CurrentFeed.Logo), fmOpenRead);
  try
    SetLength(Result, fs.Size);
    if (Length(Result) > 0) then fs.Read(Result[0], Length(Result));
  finally
    fs.Free;
  end;
end;

function TMainForm.CurrentFeed: TFeedData;
begin
  if (cbFeeds.ItemIndex < 0) or (cbFeeds.ItemIndex >= Length(Feeds)) then exit(Feeds[0]);
  Result := Feeds[cbFeeds.ItemIndex];
end;

function TMainForm.GetOfflineData: IXmlDocument;
begin
  Result := TXMLDocument.Create(
            TPath.Combine(TPath.Combine(GetDataPath, 'data'), CurrentFeed.Name + '.xml'));
end;

function TMainForm.GetOnlineData: IXmlDocument;
var
  Http: TIdHTTP;
  ms: TMemoryStream;
begin
  Http := TIdHTTP.Create(nil);
  try
    ms := TMemoryStream.Create;
    try
      Http.Get(CurrentFeed.Url, ms);
      Result := TXMLDocument.Create(nil);
      Result.LoadFromStream(ms);
    finally
      ms.Free;
    end;
  finally
    Http.Free;
  end;

end;

procedure TMainForm.LoadFeeds(node: IXmlNode; const FeedList: TList<TFeedContent>);
var
  i: Integer;
begin
  if (node.LocalName = 'item') then
  begin
    FeedList.Add(TFeedContent.Create(node.ChildValues['title'], node.ChildValues['description'], node.ChildValues['link']));
    exit;
  end;

  for i := 0 to node.ChildNodes.Count - 1 do
  begin
    LoadFeeds(node.ChildNodes[i], FeedList);
  end;
end;

function TMainForm.GetFeedContents: TArray<TFeedContent>;
var
  doc: IXmlDocument;
  FeedList: TList<TFeedContent>;
begin
  if cbOffline.Checked then doc := GetOfflineData else doc := GetOnlineData;
  FeedList := TList<TFeedContent>.Create;
  try
     LoadFeeds(doc.DocumentElement, FeedList);
     Result := FeedList.ToArray;
  finally
    FeedList.Free;
  end;

end;

procedure TMainForm.LoadFeedsEx(node: IXmlNode; const FeedList: TList<TFeedContentEx>);
var
  i: Integer;
begin
  if (node.LocalName = 'item') then
  begin
    FeedList.Add(TFeedContentEx.Create(node.ChildValues['title'], node.ChildValues['description'], node.ChildValues['link'], node.ChildValues['pubDate']));
    exit;
  end;

  for i := 0 to node.ChildNodes.Count - 1 do
  begin
    LoadFeedsEx(node.ChildNodes[i], FeedList);
  end;
end;

function TMainForm.GetFeedContentsEx: TArray<TFeedContentEx>;
var
  doc: IXmlDocument;
  FeedList: TList<TFeedContentEx>;
begin
  if cbOffline.Checked then doc := GetOfflineData else doc := GetOnlineData;
  FeedList := TList<TFeedContentEx>.Create;
  try
     LoadFeedsEx(doc.DocumentElement, FeedList);
     Result := FeedList.ToArray;
  finally
    FeedList.Free;
  end;

end;

procedure TMainForm.RunReport;
var
  Report: TFlexCelReport;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    if not CurrentFeed.HasPubDate
      then Report.AddTable<TFeedContent>('item', GetFeedContents)
      else Report.AddTable<TFeedContentEx>('item', GetFeedContentsEx);

    Report.SetValue('FeedName', CurrentFeed.Name);
    Report.SetValue('FeedUrl', CurrentFeed.Url);
    Report.SetValue('ShowCount', cbShowFeedCount.Checked);

    Report.SetValue('Logo', GetLogo);

    Report.Run(
      TPath.Combine(GetDataPath, 'Meta Templates.template.xls'),
      SaveDialog.FileName);
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

end.
