unit URenderObjects;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, StdCtrls,
  ComCtrls, ToolWin, ExtCtrls,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render, FlexCel.Preview;

type
  TFRenderObjects = class(TForm)
    Actions: TActionList;
    ActionRun: TAction;
    ActionClose: TAction;
    ToolbarImages: TImageList;
    ToolbarImagesDisabled: TImageList;
    ToolBar2: TToolBar;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    cbTheme: TComboBox;
    ChartBox: TImage;
    AnimTimer: TTimer;
    PanelError: TPanel;
    ActionCancel: TAction;
    ToolButton1: TToolButton;
    ToolbarImages_100Scale: TImageList;
    ToolbarImages_300Scale: TImageList;
    ToolbarImagesDisabled_100Scale: TImageList;
    ToolbarImagesDisabled_300Scale: TImageList;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionRunExecute(Sender: TObject);
    procedure AnimTimerTimer(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure cbThemeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Xls: TExcelFile;
    TemplatePath: string;
    ValueRange: TXlsNamedRange;
    MinValue: double;
    MaxValue: double;
    StepValue: double;
    ActualValue: double;
    ChartIndex: Int32;
    ChartProps: IShapeProperties;

    procedure InitApp;
    function ReadDoubleName(const Name: String): double;
    procedure LoadFile(const FileName: String);
    procedure GetChart;
  public
    destructor Destroy; override;
  end;

var
  FRenderObjects: TFRenderObjects;

implementation
uses IOUtils, Types, UPaths, Math, UFlexCelHDPI;

{$R *.dfm}
destructor TFRenderObjects.Destroy;
begin
  Xls.Free;
  inherited;
end;

procedure TFRenderObjects.FormCreate(Sender: TObject);
begin
  RegisterForHDPI(Self, nil);
end;

procedure TFRenderObjects.ActionRunExecute(Sender: TObject);
begin
 if Xls = nil then
    InitApp;

  AnimTimer.Enabled := true;
  ActionRun.Enabled := false;
  ActionCancel.Enabled := true;
end;

procedure TFRenderObjects.ActionCancelExecute(Sender: TObject);
begin
  AnimTimer.Enabled := false;
  ActionRun.Enabled := true;
  ActionCancel.Enabled := false;
  PanelError.Visible := false;
end;

procedure TFRenderObjects.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFRenderObjects.InitApp;
var
  fi: TStringDynArray;
  f: string;
begin
  Xls := TXlsFile.Create;
  TemplatePath := TPath.Combine(DataFolder, 'templates') + TPath.DirectorySeparatorChar;
  fi := TDirectory.GetFiles(TemplatePath, '*.xls');
  if Length(fi) = 0 then
    raise Exception.Create('Sorry, no templates found in the templates folder.');

  cbTheme.Items.Clear;
  for f in fi do
  begin
    cbTheme.Items.Add(TPath.GetFileName(f));
  end;
  cbTheme.ItemIndex := 0;
  LoadFile(fi[0]);
end;

function TFRenderObjects.ReadDoubleName(const Name: String): double;
var
  Range: TXlsNamedRange;
  val: TCellValue;
begin
  Range := Xls.GetNamedRange(Name, 0);
  if Range.IsNull then
    raise Exception.Create(('There is no range named ' + Name) + ' in the template');

  val := Xls.GetCellValue(Range.Top, Range.Left);
  if not (val.IsNumber) then
    raise Exception.Create(('The range named ' + Name) + ' does not contain a number');

  Result := val.AsNumber;
end;


procedure TFRenderObjects.LoadFile(const FileName: String);
var
  i: Int32;
  ObjName: String;
begin
  Xls.Open(FileName);
  ActualValue := 0;
  ValueRange := Xls.GetNamedRange('Value', 0);
  if ValueRange.IsNull then
    raise Exception.Create('There is no range named "value" in the template');

  MinValue := ReadDoubleName('Minimum');
  MaxValue := ReadDoubleName('Maximum');
  StepValue := ReadDoubleName('Step');
  ChartIndex := -1;
  for i := 1 to Xls.ObjectCount do
  begin
    ObjName := Xls.GetObjectName(i);
    if SameText(ObjName, 'DataChart') then
    begin
      ChartIndex := i;
      break;
    end;

  end;

  if ChartIndex < 0 then
    raise Exception.Create('There is no object named "DataChart" in the template');

  ChartProps := Xls.GetObjectProperties(ChartIndex, true);
end;


procedure TFRenderObjects.AnimTimerTimer(Sender: TObject);
begin
  if Xls = nil then exit;

  try
    ActualValue:= ActualValue + StepValue;
    if ActualValue > MaxValue then
      ActualValue := MinValue;

    Xls.SetCellValue(ValueRange.Top, ValueRange.Left, ActualValue);
    Xls.Recalc;

    GetChart;
  except
     //We don't want any dialog popping up every second.
    on ex: Exception do
      begin
        PanelError.Caption := ex.Message;
        PanelError.Align := alClient;
        PanelError.Visible := true;
        AnimTimer.Enabled := false;
      end;
  end;
end;

procedure TFRenderObjects.cbThemeChange(Sender: TObject);
begin
  if (cbTheme.ItemIndex < 0) then exit;
			LoadFile(TPath.Combine(TemplatePath, cbTheme.Items[cbTheme.ItemIndex]));

end;

procedure TFRenderObjects.GetChart;
var
  ImageDimensions: TUIRectangle;
  Origin: TUIPointF;
  SizePixels: TUISize;
  dpi: RealNumber;
  AspectX: RealNumber;
  AspectY: RealNumber;
  Aspect: RealNumber;
  Img: TUIImage;
begin
   //We could get the chart with the following command,
   //but it would be fixed size. In this example we are going to be a little more complex.
   //Xls.RenderObject(ChartIndex);

   //A more complex way to retrieve the chart, to show how to use
   //all parameters in renderobject.

   //First calculate the chart dimensions without actually rendering it. This is fast.
  Xls.RenderObject(ChartIndex, Font.PixelsPerInch, ChartProps, TUISmoothingMode.AntiAlias, TUIInterpolationMode.HighQualityBicubic, true, false, Origin, ImageDimensions, SizePixels);
  dpi := Font.PixelsPerInch;  //default screen resolution
  Aspect := 1;
  if (SizePixels.Height > 0) and (SizePixels.Width > 0) then
  begin
    AspectX := 1.0 * chartBox.Width / SizePixels.Width;
    AspectY := 1.0 * chartBox.Height / SizePixels.Height;
    Aspect := Min(AspectX, AspectY);
     //Make the dpi adjust the screen resolution and the size of the form.
    dpi := Font.PixelsPerInch * Aspect;
    if dpi < 20 then
      dpi := 20;

    if dpi > 500 then
      dpi := 500;

  end;

  Img := Xls.RenderObject(ChartIndex, dpi, ChartProps, TUISmoothingMode.AntiAlias, TUIInterpolationMode.HighQualityBicubic, true, true, Origin, ImageDimensions, SizePixels);
  try
    if (ChartBox.Picture.Width <> ChartBox.Width) or (ChartBox.Picture.Height <> ChartBox.Height)
        then ChartBox.Picture := nil;
    Img.ToNativeImage(Pointer(ChartBox.Canvas.Handle), Aspect);
    Invalidate;
  finally
    Img.Free;
  end;
end;

end.
