unit UExportSVG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, StdCtrls,
  Tabs, Grids,ExtCtrls, ComCtrls, ToolWin,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellAPI,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render;

type
  TFExportSVG = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    Actions: TActionList;
    ActionOpen: TAction;
    ActionExportAsSVG: TAction;
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
    chFormulaText: TCheckBox;
    ExportDialog: TSaveDialog;
    Label18: TLabel;
    ToolbarImages_300Scale: TImageList;
    ToolbarImages_100Scale: TImageList;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure cbSheetChange(Sender: TObject);
    procedure ActionExportAsSVGExecute(Sender: TObject);
    procedure cbExportObjectChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Svg: TFlexCelSVGExport;
    procedure LoadSheetConfig;
    function CheckFileOpen: Boolean;
    function LoadPreferences: Boolean;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  FExportSVG: TFExportSVG;

implementation
uses IOUtils, UFlexCelHDPI;

{$R *.dfm}

constructor TFExportSVG.Create(aOwner: TComponent);
begin
  inherited;
  Svg := TFlexCelSVGExport.Create;
  Svg.AllowOverwritingFiles := true;
end;

destructor TFExportSVG.Destroy;
begin
  Svg.Workbook.Free;
  FreeAndNil(Svg);
  inherited;
end;

procedure TFExportSVG.FormCreate(Sender: TObject);
begin
  RegisterForHDPI(Self, nil);
end;

procedure TFExportSVG.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFExportSVG.ActionExportAsSVGExecute(Sender: TObject);
begin
  if not CheckFileOpen then
    exit;

  if not LoadPreferences then
    exit;

  if not ExportDialog.Execute then exit;

  Svg.AllowOverwritingFiles := true;
  Svg.AllVisibleSheets := cbExportObject.ItemIndex = 0;

  Svg.SaveAsImage(
    procedure (x: TSVGExportParameters)
    begin
      x.FileName := TPath.ChangeExtension(exportDialog.FileName, '') + '_' + x.Workbook.SheetName + '_' + IntToStr(x.SheetPageNumber) + '.svg';
    end);

  if MessageDlg('Do you want to open the folder with the generated files?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(TPath.GetDirectoryName(exportDialog.Filename)), nil, nil, SW_SHOWNORMAL);
  end;

end;

procedure TFExportSVG.ActionOpenExecute(Sender: TObject);
var
  Xls: TExcelFile;
  i: Int32;
begin
  if not OpenDialog.Execute then exit;

  if Svg.Workbook = nil then Svg.Workbook := TXlsFile.Create;
  Svg.Workbook.Open(OpenDialog.FileName);
  Caption := 'Export: ' + OpenDialog.FileName;
  Xls := Svg.Workbook;
  cbSheet.Items.Clear;
  for i := 1 to Xls.SheetCount do
  begin
    cbSheet.Items.Add(Xls.GetSheetName(i));
  end;

  cbSheet.ItemIndex := Xls.ActiveSheet - 1;
  LoadSheetConfig;
end;

procedure TFExportSVG.cbExportObjectChange(Sender: TObject);
begin
  cbSheet.Enabled := cbExportObject.ItemIndex = 1;
end;

procedure TFExportSVG.cbSheetChange(Sender: TObject);
begin
  Svg.Workbook.ActiveSheet := cbSheet.ItemIndex + 1;
  LoadSheetConfig;
end;

procedure TFExportSVG.LoadSheetConfig;
var
  Xls: TExcelFile;
begin
  Xls := Svg.Workbook;
  chGridLines.Checked := Xls.PrintGridLines;
  chPrintHeadings.Checked := Xls.PrintHeadings;
  chFormulaText.Checked := Xls.ShowFormulaText;
end;

function TFExportSVG.CheckFileOpen: Boolean;
begin
  if Svg.Workbook = nil then
  begin
    ShowMessage('You need to open a file first.');
    exit(false);
  end;

  Result := true;
end;

function TFExportSVG.LoadPreferences: Boolean;
var
  Xls: TExcelFile;
begin
  //NOTE: THERE SHOULD BE *A LOT* MORE VALIDATION OF VALUES ON THIS METHOD.
  //(For example, validate that margins are between bounds)
  // As this is a simple demo, they are not included.
  try
    Xls := Svg.Workbook;

     //Note: In this demo we will only apply this things to the active sheet.
     //If you want to apply the settings to all the sheets, you should loop in the sheets and change them here.
    Xls.PrintGridLines := chGridLines.Checked;
    Xls.PrintHeadings := chPrintHeadings.Checked;
    Xls.ShowFormulaText := chFormulaText.Checked;
    Svg.PrintRangeLeft := StrToInt(edLeft.Text);
    Svg.PrintRangeTop := StrToInt(edTop.Text);
    Svg.PrintRangeRight := StrToInt(edRight.Text);
    Svg.PrintRangeBottom := StrToInt(edBottom.Text);

    Svg.HidePrintObjects := [];
    if not cbImages.Checked then
      Svg.HidePrintObjects:= Svg.HidePrintObjects + [THidePrintObjects.Images];

    if not cbHyperlinks.Checked then
      Svg.HidePrintObjects:= Svg.HidePrintObjects + [THidePrintObjects.Hyperlynks];

    if not cbComments.Checked then
      Svg.HidePrintObjects:= Svg.HidePrintObjects + [THidePrintObjects.Comments];

    if not cbHeadersFooters.Checked then
      Svg.HidePrintObjects:= Svg.HidePrintObjects + [THidePrintObjects.Headers, THidePrintObjects.Footers];

  except
    on e: Exception do
      begin
        ShowMessage('Error: ' + e.Message);
        exit(false);
      end;
  end;
  Result := true;
end;


end.
