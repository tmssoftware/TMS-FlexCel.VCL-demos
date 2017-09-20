unit UExportHTML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, StdCtrls,
  Tabs, Grids,ExtCtrls, ComCtrls, ToolWin,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellAPI, UMailDialog,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render;

type
  TFExportHTML = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    Actions: TActionList;
    ActionOpen: TAction;
    ActionExportAsHTML: TAction;
    ActionExportAsMHTML: TAction;
    ActionClose: TAction;
    OpenDialog: TOpenDialog;
    ToolbarImages: TImageList;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    cbExportObject: TComboBox;
    cbSheet: TComboBox;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    chGridLines: TCheckBox;
    chPrintHeadings: TCheckBox;
    Panel3: TPanel;
    Label4: TLabel;
    cbImages: TCheckBox;
    cbComments: TCheckBox;
    cbHyperlinks: TCheckBox;
    cbHeadersFooters: TCheckBox;
    Panel4: TPanel;
    Label5: TLabel;
    cbOutlook2007: TCheckBox;
    cbIe6Png: TCheckBox;
    Panel5: TPanel;
    Label6: TLabel;
    cbLeft: TCheckBox;
    cbTop: TCheckBox;
    cbRight: TCheckBox;
    cbBottom: TCheckBox;
    Panel6: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    cbHtmlVersion: TComboBox;
    cbFileFormat: TComboBox;
    Panel7: TPanel;
    Label9: TLabel;
    edTop: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    edBottom: TEdit;
    Label12: TLabel;
    edLeft: TEdit;
    edRight: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    Panel8: TPanel;
    Label15: TLabel;
    edSheetSeparator: TEdit;
    Panel9: TPanel;
    Label16: TLabel;
    edBodyStart: TEdit;
    Panel10: TPanel;
    Label17: TLabel;
    edImages: TEdit;
    Panel11: TPanel;
    edCss: TEdit;
    cbCss: TCheckBox;
    cbReplaceFonts: TCheckBox;
    chFormulaText: TCheckBox;
    ExportDialog: TSaveDialog;
    sbSVG: TCheckBox;
    Label18: TLabel;
    cbEmbedImages: TCheckBox;
    ToolbarImages_100Scale: TImageList;
    ToolbarImages_300Scale: TImageList;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure cbSheetChange(Sender: TObject);
    procedure ActionExportAsHTMLExecute(Sender: TObject);
    procedure cbExportObjectChange(Sender: TObject);
    procedure cbCssClick(Sender: TObject);
    procedure ActionExportAsMHTMLExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Html: TFlexCelHtmlExport;
    procedure LoadSheetConfig;
    function HasFileOpen: Boolean;
    function LoadPreferences: Boolean;
    procedure HtmlFont(const sender: TObject; const e: THtmlFontEventArgs);
    function GenerateMHTML: string;

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  FExportHTML: TFExportHTML;

implementation
uses IOUtils, UFlexCelHDPI;

{$R *.dfm}

constructor TFExportHTML.Create(aOwner: TComponent);
begin
  inherited;
  Html := TFlexCelHtmlExport.Create;
  Html.AllowOverwritingFiles := true;
  Html.HtmlFont := HtmlFont;
end;

destructor TFExportHTML.Destroy;
begin
  Html.Workbook.Free;
  FreeAndNil(Html);
  inherited;
end;

procedure TFExportHTML.FormCreate(Sender: TObject);
begin
  RegisterForHDPI(Self, nil);
end;

procedure TFExportHTML.HtmlFont(const sender: TObject; const e: THtmlFontEventArgs);
begin
  if cbReplaceFonts.Checked then
  begin
    e.FontFamily := 'arial, sans-serif';
  end;
end;


procedure TFExportHTML.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFExportHTML.ActionExportAsHTMLExecute(Sender: TObject);
var
  CssFileName: String;
  FileNameToOpen: String;
  SelectorPosition: TSheetSelectorPositionSet;
  GeneratedFiles: TArray<String>;
begin
  if not HasFileOpen then
    exit;

  if not LoadPreferences then
    exit;

  if cbFileFormat.ItemIndex = 1 then
  begin
    Html.HtmlFileFormat := THtmlFileFormat.MHtml;
    ExportDialog.FilterIndex := 2;
  end else
  begin
    Html.HtmlFileFormat := THtmlFileFormat.Html;
    ExportDialog.FilterIndex := 1;
  end;

  if not ExportDialog.Execute then exit;

  Html.AllowOverwritingFiles := true;
  Html.SavedImagesFormat := THtmlImageFormat.Png;
  CssFileName := '';
  if cbCss.Checked then
    CssFileName := edCss.Text;

  FileNameToOpen := ExportDialog.FileName;

  case cbHtmlVersion.ItemIndex of
    0: Html.HtmlVersion := THtmlVersion.Html_32;
    2: Html.HtmlVersion := THtmlVersion.XHTML_10;
    3: Html.HtmlVersion := THtmlVersion.Html_5;
    else Html.HtmlVersion := THtmlVersion.Html_401;
  end;

  if edBodyStart.Text <> '' then
    Html.ExtraInfo.BodyStart := TArray<String>.Create(edBodyStart.Text);

  case cbExportObject.ItemIndex of
    0:
    begin
      SelectorPosition := [];
      if cbTop.Checked then
        SelectorPosition:= SelectorPosition + [TSheetSelectorPosition.Top];

      if cbLeft.Checked then
        SelectorPosition:= SelectorPosition + [TSheetSelectorPosition.Left];

      if cbBottom.Checked then
        SelectorPosition:= SelectorPosition + [TSheetSelectorPosition.Bottom];

      if cbRight.Checked then
        SelectorPosition:= SelectorPosition + [TSheetSelectorPosition.Right];

      Html.ExportAllVisibleSheetsAsTabs(TPath.GetDirectoryName(ExportDialog.FileName),
        TPath.GetFileNameWithoutExtension(ExportDialog.FileName),
        TPath.GetExtension(ExportDialog.FileName),
        edImages.Text, CssFileName, TStandardSheetSelector.Create(SelectorPosition), true);

      FileNameToOpen := TPath.Combine(TPath.GetDirectoryName(ExportDialog.FileName), TPath.GetFileNameWithoutExtension(ExportDialog.FileName));
      FileNameToOpen := TPath.Combine(FileNameToOpen, Html.Workbook.SheetName);
      FileNameToOpen := TPath.Combine(FileNameToOpen, TPath.GetExtension(ExportDialog.FileName));
    end;
    1:
    begin
      Html.ExportAllVisibleSheetsAsOneHtmlFile(ExportDialog.FileName, edImages.Text, CssFileName, edSheetSeparator.Text);
    end;
    2:
    begin
      begin
        Html.Export(ExportDialog.FileName, edImages.Text, CssFileName);
      end;
    end;
  end;
  GeneratedFiles := Html.GeneratedFiles.GetHtmlFiles;
  if Length(GeneratedFiles) = 0 then
  begin
    ShowMessage('Error: No file has been generated');
  end else
  begin
    if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ShellExecute(0, 'open', PCHAR(GeneratedFiles[0]), nil, nil, SW_SHOWNORMAL);
    end;

  end;

end;

procedure TFExportHTML.ActionExportAsMHTMLExecute(Sender: TObject);
var
  dr: TModalResult;
begin
  if not HasFileOpen then
    exit;

  if not Html.FixOutlook2007CssSupport then
  begin
    dr := MessageDlg('You have not checked "Outlook 2007 support". If any of your clients has Outlook express, you should turn this on.'#$000A#$000A'Use Outlook 2007 fix?',
         TMsgDlgType.mtWarning, [mbYes, mbNo, mbCancel], 0);
    if dr = mrCancel then
      exit;

    if dr = mrYes then
    begin
      cbOutlook2007.Checked := true;
      Html.FixOutlook2007CssSupport := true;
    end;

  end;

  MailDialog.GetMHTML := GenerateMHTML;
  MailDialog.ShowModal;
end;

procedure TFExportHTML.ActionOpenExecute(Sender: TObject);
var
  Xls: TExcelFile;
  i: Int32;
begin
  if not OpenDialog.Execute then exit;

  if Html.Workbook = nil then Html.Workbook := TXlsFile.Create;
  Html.Workbook.Open(OpenDialog.FileName);
  Caption := 'Export: ' + OpenDialog.FileName;
  Xls := Html.Workbook;
  cbSheet.Items.Clear;
  for i := 1 to Xls.SheetCount do
  begin
    cbSheet.Items.Add(Xls.GetSheetName(i));
  end;

  cbSheet.ItemIndex := Xls.ActiveSheet - 1;
  LoadSheetConfig;
end;

procedure TFExportHTML.cbCssClick(Sender: TObject);
begin
  edCss.Enabled := cbCss.Checked;
end;

procedure TFExportHTML.cbExportObjectChange(Sender: TObject);
begin
  edSheetSeparator.Enabled := cbExportObject.ItemIndex = 1;
  cbTop.Enabled := cbExportObject.ItemIndex = 0;
  cbLeft.Enabled := cbExportObject.ItemIndex = 0;
  cbRight.Enabled := cbExportObject.ItemIndex = 0;
  cbBottom.Enabled := cbExportObject.ItemIndex = 0;
  cbSheet.Enabled := cbExportObject.ItemIndex = 2;
end;

procedure TFExportHTML.cbSheetChange(Sender: TObject);
begin
  Html.Workbook.ActiveSheet := cbSheet.ItemIndex + 1;
  LoadSheetConfig;
end;

procedure TFExportHTML.LoadSheetConfig;
var
  Xls: TExcelFile;
begin
  Xls := Html.Workbook;
  chGridLines.Checked := Xls.PrintGridLines;
  chPrintHeadings.Checked := Xls.PrintHeadings;
  chFormulaText.Checked := Xls.ShowFormulaText;
end;

function TFExportHTML.HasFileOpen: Boolean;
begin
  if Html.Workbook = nil then
  begin
    ShowMessage('You need to open a file first.');
    exit(false);
  end;

  Result := true;
end;

function TFExportHTML.LoadPreferences: Boolean;
var
  Xls: TExcelFile;
begin
  //NOTE: THERE SHOULD BE *A LOT* MORE VALIDATION OF VALUES ON THIS METHOD.
  //(For example, validate that margins are between bounds)
  // As this is a simple demo, they are not included.
  try
    Xls := Html.Workbook;

     //Note: In this demo we will only apply this things to the active sheet.
     //If you want to apply the settings to all the sheets, you should loop in the sheets and change them here.
    Xls.PrintGridLines := chGridLines.Checked;
    Xls.PrintHeadings := chPrintHeadings.Checked;
    Xls.ShowFormulaText := chFormulaText.Checked;
    Html.PrintRangeLeft := StrToInt(edLeft.Text);
    Html.PrintRangeTop := StrToInt(edTop.Text);
    Html.PrintRangeRight := StrToInt(edRight.Text);
    Html.PrintRangeBottom := StrToInt(edBottom.Text);

    if (sbSVG.Checked) then Html.SavedImagesFormat := THtmlImageFormat.Svg else Html.SavedImagesFormat := THtmlImageFormat.Png;
    Html.EmbedImages := cbEmbedImages.Checked;

    Html.FixOutlook2007CssSupport := cbOutlook2007.Checked;
    Html.FixIE6TransparentPngSupport := cbIe6Png.Checked;
    Html.HidePrintObjects := [];
    if not cbImages.Checked then
      Html.HidePrintObjects:= Html.HidePrintObjects + [THidePrintObjects.Images];

    if not cbHyperlinks.Checked then
      Html.HidePrintObjects:= Html.HidePrintObjects + [THidePrintObjects.Hyperlynks];

    if not cbComments.Checked then
      Html.HidePrintObjects:= Html.HidePrintObjects + [THidePrintObjects.Comments];

    if not cbHeadersFooters.Checked then
      Html.HidePrintObjects:= Html.HidePrintObjects + [THidePrintObjects.Headers, THidePrintObjects.Footers];

  except
    on e: Exception do
      begin
        ShowMessage('Error: ' + e.Message);
        exit(false);
      end;
  end;
  Result := true;
end;

function TFExportHTML.GenerateMHTML: string;
var
  ms: TBytesStream;
  writer: TStreamWriter;
  preambleLen: integer;
begin
  LoadPreferences;
  Html.HtmlFileFormat := THtmlFileFormat.MHtml;
  Html.AllowOverwritingFiles := true;
  Html.SavedImagesFormat := THtmlImageFormat.Png;
  Html.HtmlVersion := THtmlVersion.Html_401;
  if edBodyStart.Text <> '' then
    Html.ExtraInfo.BodyStart := TArray<String>.Create(edBodyStart.Text);

  ms := TBytesStream.Create;
  try
    writer := TStreamWriter.Create(ms, TEncoding.UTF8);
    try
      Html.Export(writer, Html.Workbook.ActiveFileName, nil);
    finally
      FreeAndNil(writer);
    end;
    PreambleLen := Length(TEncoding.UTF8.GetPreamble);
    exit(TEncoding.UTF8.GetString(ms.Bytes, preambleLen, ms.Size - preambleLen));
  finally
    FreeAndNil(ms);
  end;
end;


end.
