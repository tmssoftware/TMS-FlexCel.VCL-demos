unit UCalcWheel;

interface

{$if CompilerVersion < 30.0}
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FlexCel.FMXSupport, FlexCel.Core, FlexCel.XlsAdapter,
  FMX.Edit, FMX.Objects, FMX.Platform, FMX.Layouts, FMX.ListBox, FMX.Ani,
  FMX.Controls.Presentation, FMX.TabControl, FMX.ListView.Types, FMX.ListView;
{$else}
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FlexCel.FMXSupport, FlexCel.Core, FlexCel.XlsAdapter,
  FMX.Edit, FMX.Objects, FMX.Platform, FMX.Layouts, FMX.ListBox, FMX.Ani,
  FMX.Controls.Presentation, FMX.TabControl, FMX.ListView.Types, FMX.ListView,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base;
{$endif}

type
  TWheelForm = class(TForm)
    ToolBar1: TToolBar;
    btnCalc: TSpeedButton;
    Wheel: TImage;
    lblCurrent: TLabel;
    ColorKeyAnimation1: TColorKeyAnimation;
    Pages: TTabControl;
    TabData: TTabItem;
    TabConfig: TTabItem;
    edEntry: TEdit;
    edResult: TEdit;
    lblEntry: TLabel;
    lblResult: TLabel;
    TemplateSelect: TListView;
    procedure btnCalcClick(Sender: TObject);
    procedure WheelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TemplateSelectItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure PagesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Workbook: TXlsFile;

    procedure LoadConfig;
    procedure CreateConfig;
    function GetCell(const sheet: string; const r, c: integer): string;
    function ConfigFile: string;
    function DocFolder: string;
    procedure Calc;
    procedure RefreshTemplates;
  public
    { Public declarations }
  end;

var
  WheelForm: TWheelForm;

implementation
uses IOUtils;

{$R *.fmx}

function TWheelForm.GetCell(const sheet: string; const r, c: integer): string;
var
  ResultIndex: integer;
begin
  Result := '*Error*';
  ResultIndex := Workbook.GetSheetIndex(sheet, false);
  if (ResultIndex < 1) then
  begin
    exit;
  end;
  Workbook.ActiveSheet := ResultIndex;
  Result := Workbook.GetStringFromCell(r, c);
end;

function TWheelForm.ConfigFile: string;
begin
  Result := TPath.GetDocumentsPath + '/Preferences/config.txt';
end;

function TWheelForm.DocFolder: string;
begin
  Result := TPath.GetDocumentsPath + '/';
end;

procedure TWheelForm.LoadConfig;
var
  sr: TStreamReader;
  fn: string;
begin
  FreeAndNil(Workbook);
  sr := nil;
  try
    try
      if (TFile.Exists(ConfigFile)) then
      begin
        sr := TStreamReader.Create(ConfigFile);
        fn := sr.ReadLine;
      end else
      begin
        fn := DocFolder + 'default.xls';
      end;
      if fn = '' then Workbook := TXlsFile.Create(1, true) else Workbook := TXlsFile.Create(fn, true);
    except on ex: Exception do
      begin
        Workbook := TXlsFile.Create(1, true);
      end;
    end;
  finally
    sr.Free;
  end;

  lblCurrent.Text := TPath.GetFileNameWithoutExtension(Workbook.ActiveFileName);
  lblEntry.Text := GetCell('Data', 1, 1);
  Calc;
end;

procedure TWheelForm.RefreshTemplates;
var
  fn: string;
  files: TStringDynArray;
  li: TListViewItem;
begin
  TemplateSelect.BeginUpdate;
  try
    TemplateSelect.Items.Clear;
    files := TDirectory.GetFiles(DocFolder, '*.xls');
    for fn in files do
    begin
      li := TemplateSelect.Items.Add;
      li.Text :=  TPath.GetFileNameWithoutExtension(fn);
    end;
  finally
    TemplateSelect.EndUpdate;
  end;
end;

procedure TWheelForm.PagesChange(Sender: TObject);
begin
  if (Pages.ActiveTab = TabConfig) then RefreshTemplates;

end;

procedure TWheelForm.TemplateSelectItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if (AItem <> nil) then
  begin
    try
      Workbook.Open(DocFolder + AItem.Text + '.xls');
    except
      ShowMessage('Invalid file: ' + AItem.Text);
      Workbook.NewFile(1, TExcelFileFormat.v2019);
    end;

    CreateConfig;
    LoadConfig;
  end;
  Pages.ActiveTab := TabData;

end;

procedure TWheelForm.CreateConfig;
var
  sw: TStreamWriter;
begin
     TDirectory.CreateDirectory(TPath.GetDirectoryName(ConfigFile));
     sw := TStreamWriter.Create(ConfigFile);
     try
       sw.WriteLine(Workbook.ActiveFileName);
     finally
       sw.Free;
     end;
end;

procedure TWheelForm.Calc;
var
  DataIndex, ResultIndex: integer;
begin
  DataIndex := Workbook.GetSheetIndex('Data', false);
  if (DataIndex < 1) then
  begin
    ShowMessage('Can''t find the sheet "Data"');
    exit;
  end;

  Workbook.ActiveSheet := DataIndex;
  Workbook.SetCellFromString(1, 2, edEntry.Text);

  ResultIndex := Workbook.GetSheetIndex('Result', false);
  if (ResultIndex < 1) then
  begin
    ShowMessage('Can''t find the sheet "Result"');
    exit;
  end;

  Workbook.Recalc;

  Workbook.ActiveSheet := ResultIndex;
  lblResult.Text := Workbook.GetStringFromCell(1,1);
  edResult.Text := Workbook.GetStringFromCell(1,2);
end;

procedure TWheelForm.btnCalcClick(Sender: TObject);
begin
  Calc;
end;

procedure TWheelForm.FormCreate(Sender: TObject);
begin
  LoadConfig;
end;

procedure TWheelForm.FormDestroy(Sender: TObject);
begin
  Workbook.Free;
end;

procedure TWheelForm.WheelClick(Sender: TObject);
begin
  Pages.ActiveTab := TabConfig;
end;

end.
