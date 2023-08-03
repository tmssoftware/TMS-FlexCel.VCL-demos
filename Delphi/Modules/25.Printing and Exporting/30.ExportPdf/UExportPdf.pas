unit UExportPdf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, StdCtrls,
  Tabs, Grids,ExtCtrls, ComCtrls, ToolWin,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellAPI,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render, FlexCel.Pdf;

type
  TFExportPdf = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    Actions: TActionList;
    ActionOpen: TAction;
    ActionExportAsPdf: TAction;
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
    chPrintLeft: TCheckBox;
    Panel3: TPanel;
    Label4: TLabel;
    Panel6: TPanel;
    Label7: TLabel;
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
    Panel9: TPanel;
    Label16: TLabel;
    cbConfidential: TCheckBox;
    chFormulaText: TCheckBox;
    ExportDialog: TSaveDialog;
    edHeader: TLabeledEdit;
    edFooter: TLabeledEdit;
    chLandscape: TCheckBox;
    chFitIn: TCheckBox;
    edHPages: TLabeledEdit;
    edVPages: TLabeledEdit;
    edZoom: TLabeledEdit;
    edl: TLabeledEdit;
    edt: TLabeledEdit;
    edh: TLabeledEdit;
    edr: TLabeledEdit;
    edb: TLabeledEdit;
    edf: TLabeledEdit;
    Panel4: TPanel;
    Label5: TLabel;
    cbFontMapping: TComboBox;
    chEmbed: TCheckBox;
    chSubset: TCheckBox;
    cbKerning: TCheckBox;
    Panel5: TPanel;
    Label6: TLabel;
    edSubject: TLabeledEdit;
    edAuthor: TLabeledEdit;
    edTitle: TLabeledEdit;
    Panel8: TPanel;
    Label8: TLabel;
    cbPdfType: TComboBox;
    cbVersion: TComboBox;
    cbTagged: TComboBox;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    edLang: TLabeledEdit;
    ToolbarImages_100Scale: TImageList;
    ToolbarImages_300Scale: TImageList;
    ScrollBox1: TScrollBox;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure ActionExportAsPdfExecute(Sender: TObject);
    procedure chFitInClick(Sender: TObject);
    procedure cbSheetChange(Sender: TObject);
    procedure cbExportObjectChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Pdf: TFlexCelPdfExport;
    procedure LoadSheetConfig;
    function HasFileOpen: Boolean;
    function LoadPreferences: Boolean;
    procedure PdfExport_AfterGeneratePage(const sender: TObject;
      const e: TPageEventArgs);

  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  FExportPdf: TFExportPdf;

implementation
uses IOUtils, UFlexCelHDPI;

{$R *.dfm}

constructor TFExportPdf.Create(aOwner: TComponent);
begin
  inherited;
  Pdf := TFlexCelPdfExport.Create;
  Pdf.AllowOverwritingFiles := true;
  Pdf.AfterGeneratePage := PdfExport_AfterGeneratePage;
end;

destructor TFExportPdf.Destroy;
begin
  Pdf.Workbook.Free;
  FreeAndNil(Pdf);
  inherited;
end;


procedure TFExportPdf.FormCreate(Sender: TObject);
begin
  RegisterForHDPI(Self, nil);
end;

procedure TFExportPdf.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFExportPdf.ActionExportAsPdfExecute(Sender: TObject);
var
  PdfStream: TFileStream;
begin
  if not HasFileOpen then exit;

  if not LoadPreferences then exit;

  if not ExportDialog.Execute then exit;

  PdfStream := TFileStream.Create(exportDialog.FileName, fmCreate);
  try
    Pdf.BeginExport(PdfStream);
    if cbExportObject.ItemIndex = 0 then
    begin
      Pdf.PageLayout := TPageLayout.Outlines;  //To how the bookmarks when opening the file.
      Pdf.ExportAllVisibleSheets(false, TPath.GetFileNameWithoutExtension(exportDialog.FileName));
    end else
    begin
      Pdf.PageLayout := TPageLayout.None;
      Pdf.ExportSheet;
    end;

    Pdf.EndExport;

    if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ShellExecute(0, 'open', PCHAR(ExportDialog.FileName), nil, nil, SW_SHOWNORMAL);
    end;

  finally
    FreeAndNil(PdfStream);
  end;
end;

procedure TFExportPdf.ActionOpenExecute(Sender: TObject);
var
  Xls: TExcelFile;
  i: integer;
begin
  if not OpenDialog.Execute then exit;

  if Pdf.Workbook = nil then Pdf.Workbook := TXlsFile.Create;
  Pdf.Workbook.Open(OpenDialog.FileName);
  Caption := 'Export: ' + OpenDialog.FileName;
  Xls := Pdf.Workbook;
  cbSheet.Items.Clear;
  for i := 1 to Xls.SheetCount do
  begin
    cbSheet.Items.Add(Xls.GetSheetName(i));
  end;

  cbSheet.ItemIndex := Xls.ActiveSheet - 1;
  LoadSheetConfig;
end;

procedure TFExportPdf.cbExportObjectChange(Sender: TObject);
begin
  cbSheet.Enabled := cbExportObject.ItemIndex <> 0;
end;

procedure TFExportPdf.cbSheetChange(Sender: TObject);
begin
  Pdf.Workbook.ActiveSheet := cbSheet.ItemIndex + 1;
  LoadSheetConfig;
end;

procedure TFExportPdf.chFitInClick(Sender: TObject);
begin
  edVPages.Enabled :=  chFitIn.Checked;
  edHPages.Enabled :=  chFitIn.Checked;
  edZoom.Enabled := not chFitIn.Checked;
end;

procedure TFExportPdf.LoadSheetConfig;
var
  Xls: TExcelFile;
  m: TXlsMargins;
begin
  Xls := Pdf.Workbook;
  chGridLines.Checked := Xls.PrintGridLines;
  chFormulaText.Checked := Xls.ShowFormulaText;
  chPrintLeft.Checked := TPrintOptions.LeftToRight in Xls.PrintOptions;
  edHeader.Text := Xls.PageHeader;
  edFooter.Text := Xls.PageFooter;
  chFitIn.Checked := Xls.PrintToFit;
  edHPages.Text := IntToStr(Xls.PrintNumberOfHorizontalPages);
  edVPages.Text := IntToStr(Xls.PrintNumberOfVerticalPages);
  edVPages.Enabled := chFitIn.Checked;
  edHPages.Enabled := chFitIn.Checked;
  edZoom.Enabled := not chFitIn.Checked;
  edZoom.Text := IntToStr(Xls.PrintScale);
  m := Xls.GetPrintMargins;
  edl.Text := FloatToStr(m.Left);
  edt.Text := FloatToStr(m.Top);
  edr.Text := FloatToStr(m.Right);
  edb.Text := FloatToStr(m.Bottom);
  edf.Text := FloatToStr(m.Footer);
  edh.Text := FloatToStr(m.Header);
  chLandscape.Checked :=  Xls.PrintLandscape;

  edAuthor.Text := Xls.DocumentProperties.GetStandardProperty(TPropertyId.Author);
  edTitle.Text := Xls.DocumentProperties.GetStandardProperty(TPropertyId.Title);
  edSubject.Text := Xls.DocumentProperties.GetStandardProperty(TPropertyId.Subject);

end;

function TFExportPdf.HasFileOpen: Boolean;
begin
  if Pdf.Workbook = nil then
  begin
    ShowMessage('You need to open a file first.');
    exit(false);
  end;

  Result := true;
end;

function TFExportPdf.LoadPreferences: Boolean;
var
  Xls: TExcelFile;
  m: TXlsMargins;
begin
  try  //NOTE: THERE SHOULD BE *A LOT* MORE VALIDATION OF VALUES ON THIS METHOD. (For example, validate that margins are between bounds)
  // As this is a simple demo, they are not included.
    Xls := Pdf.Workbook;
    Xls.PrintGridLines := chGridLines.Checked;
    Xls.PageHeader := edHeader.Text;
    Xls.PageFooter := edFooter.Text;
    Xls.ShowFormulaText := chFormulaText.Checked;
    if chFitIn.Checked then
    begin
      Xls.PrintToFit := true;
      Xls.PrintNumberOfHorizontalPages := StrToInt(edHPages.Text);
      Xls.PrintNumberOfVerticalPages := StrToInt(edVPages.Text);
    end else
      Xls.PrintToFit := false;

    if chPrintLeft.Checked then
      Xls.PrintOptions:= Xls.PrintOptions + [TPrintOptions.LeftToRight] else
      Xls.PrintOptions:= Xls.PrintOptions - [TPrintOptions.LeftToRight];

    try
      Xls.PrintScale := StrToInt(edZoom.Text);
    except
        begin
          ShowMessage('Invalid Zoom');
          exit(false);
        end;
    end;
    m := TXlsMargins.Create;
    m.Left := StrToFloat(edl.Text);
    m.Top := StrToFloat(edt.Text);
    m.Right := StrToFloat(edr.Text);
    m.Bottom := StrToFloat(edb.Text);
    m.Footer := StrToFloat(edf.Text);
    m.Header := StrToFloat(edh.Text);
    Xls.SetPrintMargins(m);
    Pdf.PrintRangeLeft := StrToInt(edLeft.Text);
    Pdf.PrintRangeTop := StrToInt(edTop.Text);
    Pdf.PrintRangeRight := StrToInt(edRight.Text);
    Pdf.PrintRangeBottom := StrToInt(edBottom.Text);
    if chEmbed.Checked then
      Pdf.FontEmbed := TFontEmbed.Embed else
      Pdf.FontEmbed := TFontEmbed.None;

    if chSubset.Checked then
      Pdf.FontSubset := TFontSubset.Subset else
      Pdf.FontSubset := TFontSubset.DontSubset;

    Pdf.Kerning := cbKerning.Checked;
    case cbFontMapping.ItemIndex of
      0:
      begin
        Pdf.FontMapping := TFontMapping.ReplaceAllFonts;
      end;
      1:
      begin
        Pdf.FontMapping := TFontMapping.ReplaceStandardFonts;
      end;
      2:
      begin
        Pdf.FontMapping := TFontMapping.DontReplaceFonts;
      end;
    end;

    case cbPdfType.ItemIndex of
      0: Pdf.PdfType := TPdfType.Standard;
      1: Pdf.PdfType := TPdfType.PDFA1;
      2: Pdf.PdfType := TPdfType.PDFA2;
      3: Pdf.PdfType := TPdfType.PDFA3;
    end;

    case cbTagged.ItemIndex of
      0: Pdf.TagMode := TTagMode.Full;
      1: Pdf.TagMode := TTagMode.None;
    end;

    case cbVersion.ItemIndex of
      0: Pdf.PdfVersion := TPdfVersion.v14;
      1: Pdf.PdfVersion := TPdfVersion.v16;
    end;


    Pdf.Properties := TPdfProperties.Create(
                          edTitle.Text,
                          edAuthor.Text,
                          edSubject.Text,
                          '',
                          '',
                          edLang.Text);

    Xls.PrintLandscape := chLandscape.Checked;
  except
    on e: Exception do
      begin
        ShowMessage('Error: ' + e.Message);
        exit(false);
      end;
  end;
  Result := true;
end;


procedure TFExportPdf.PdfExport_AfterGeneratePage(const sender: TObject; const e: TPageEventArgs);
var
  ABrush: TUIBrush;
  AFont: TUIFont;
  x0: RealNumber;
  y0: RealNumber;
  sf: TUISize;
const
  s = 'Confidential';
begin
  if not cbConfidential.Checked then
    exit;

  ABrush := TUISolidBrush.CreateNew(TUIColor.FromArgb($1E, $19, $19, $19));  //Red=Green=Blue is a shade of gray. Alpha=30 means it is transparent (255 is pure opaque, 0 is pure transparent).
  try
    AFont := TUIFont.CreateNew('Arial', $48);
    try
      x0 := ((e.DataFile.PageSize.Width * 72) / 100) / 2;  //PageSize is in inches/100, our coordinate system is in Points, that is inches/72
      y0 := ((e.DataFile.PageSize.Height * 72) / 100) / 2;
      sf := e.DataFile.MeasureString(s, AFont);
      e.DataFile.Rotate(x0, y0, $2D);
      e.DataFile.DrawString(s, AFont, ABrush, x0 - (sf.Width / 2), y0 + (sf.Height / 2));  //the y coord means the bottom of the text, and as the y axis grows down, we have to add sf.height/2 instead of substracting it.
    finally
      FreeAndNil(AFont);
    end;
  finally
    FreeAndNil(ABrush);
  end;
end;


end.
