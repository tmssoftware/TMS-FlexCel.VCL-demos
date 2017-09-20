unit UFlexCelHDPI;
{$IF CompilerVersion >= 24.0}
    {$LEGACYIFEND ON}
{$IFEND}
interface
uses Windows, Forms, Classes;
type
  TOnDPIChangedProc = procedure of object;


  procedure RegisterForHDPI(const Form: TForm; const OnChange: TOnDPIChangedProc);


implementation
uses
     {$IF CompilerVersion >= 23}GDIPAPI{$ELSE}flxGDIPAPI_XE{$IFEND},
     CommCtrl,
{$IF CompilerVersion < 30}
     Messages,
{$IFEND}
     Controls, Generics.Collections, StrUtils, SysUtils, Graphics;

const
  EndDelim = 'scale';
  StartDelim = '_';
{$IF CompilerVersion < 30}
  WM_DPICHANGED = $02E0;
{$IFEND}


type
TImageListScale = record
  ImageList: TImageList;
  Scale: integer;
  CorrectedList: TImageList;
  PerfectFit: boolean;

  constructor Create(const aImageList: TImageList);
end;

{$IF CompilerVersion < 30.0}
  TMonitorDpiChangedEvent = procedure(Sender: TObject; OldDPI: Integer; NewDPI: Integer) of object;
{$IFEND}

  TFlexCelHDPI = class(TComponent)
  private
    Form: TForm;
    FirstScale: integer;
    OnChange: TOnDPIChangedProc;
    FOldEvent: TMonitorDpiChangedEvent;
  public
    constructor CreateAndInit(const aForm: TForm; const aFirstScale: integer;
    const aOnChange: TOnDPIChangedProc; const aOldEvent: TMonitorDpiChangedEvent);
    procedure FormAfterMonitorDpiChanged(Sender: TObject; OldDPI, NewDPI: Integer);

  end;

procedure Check(const st: GPStatus);
begin
  if st <> TStatus.Ok then
  begin
    raise Exception.Create('Error in GDI+: ' + IntToStr(Int32(st)));
  end;
end;

{$WARN SYMBOL_PLATFORM OFF}
//The headers in delphi are wrong for 64 bits.
procedure GdiplusShutdown64(token: ULONG_PTR); stdcall; external WINGDIPDLL name 'GdiplusShutdown' delayed;
function GdiplusStartup64(out token: ULONG_PTR; input: PGdiplusStartupInput;
   output: PGdiplusStartupOutput): Status; stdcall; external WINGDIPDLL name 'GdiplusStartup' delayed;
{$WARN SYMBOL_PLATFORM ON}

procedure InitGDIPlus(var GdiToken: ULONG_PTR);
var
  StartupInput: TGDIPlusStartupInput;
begin
  if (GdiToken <> 0) then exit;

  StartupInput.DebugEventCallback := nil;
  StartupInput.SuppressBackgroundThread := False;
  StartupInput.SuppressExternalCodecs   := False;
  StartupInput.GdiplusVersion := 1;
  Check(GdiplusStartup64(GdiToken, @StartupInput, nil));

end;

procedure ShutdownGDIPlus(var GdiToken: ULONG_PTR);
begin
  if (GdiToken <> 0) then GdiplusShutdown64(GdiToken);
  GdiToken := 0;
end;


function GetRoot(const s: string): string;
var
  p_: integer;
begin
  p_ := LastDelimiter(StartDelim, s);
  if p_ <= 2 then raise Exception.Create('Internal error');

  exit(System.Copy(s, 1, p_ - 1));

end;

function ExtractResolution(const s: string): integer;
var
  p_: integer;
begin
  if not EndsText(EndDelim, s) then exit(0);
  p_ := LastDelimiter(StartDelim, s);
  if p_ <= 2 then exit(0);

  exit(StrToInt(System.Copy(s, p_ + Length(StartDelim), Length(s) - p_ + 1 - Length(StartDelim) - Length(EndDelim))));

end;

function IsRooted(const s: string): boolean;
begin
  Result := ExtractResolution(s) = 0;
end;

function IsBetterScale(const CurrentScale, ProposedScale, TargetScale: integer): boolean;
begin
  if CurrentScale < 0 then exit(true);
  if CurrentScale < TargetScale then
  begin
    exit (ProposedScale > CurrentScale);
  end;

  Result := (ProposedScale >= TargetScale) and (ProposedScale < CurrentScale);
end;


procedure ConvertImage(var Img: GPBitmap; const cm: ColorMatrix);
var
  imgAtt: GPImageAttributes;
  _Result: GPBitmap;
  gr: GPGraphics;
  Width, Height: Cardinal;
begin
  Check(GdipGetImageWidth(Img, Width));
  Check(GdipGetImageHeight(Img, Height));

  Check(GdipCreateImageAttributes(imgAtt));
  try
    Check(GdipSetImageAttributesColorMatrix(imgAtt, ColorAdjustTypeDefault, true, @cm, nil, ColorMatrixFlagsDefault));
    Check(GdipCreateBitmapFromScan0(Width, Height, 0, PixelFormat32bppArgb, nil, _Result));
    try
      Check(GdipGetImageGraphicsContext(_Result, gr));
      try
        Check(GdipDrawImageRectRect(gr, Img, 0, 0, Width, Height, 0, 0, Width, Height, UnitPixel, imgAtt, nil, nil));
      finally
        GdipDeleteGraphics(gr);
      end;
    except
        begin
          GdipDisposeImage(_Result);
          raise ;
        end;
    end;
    GdipDisposeImage(Img);
    Img := _Result;
  finally
    GdipDisposeImageAttributes(imgAtt);
  end;
end;

procedure ConvertToGrayscale(var Img: GPBitmap);
const
  lum = 1.1;
var
  cm: ColorMatrix;
begin
    cm[0, 0] := 0.3 * lum;
    cm[0, 1] := cm[0, 0];
    cm[0, 2] := cm[0, 0];
    cm[0, 3] := 0;
    cm[0, 4] := 0;

    cm[1, 0] := 0.59 * lum;
    cm[1, 1] := cm[1, 0];
    cm[1, 2] := cm[1, 0];
    cm[1, 3] := 0;
    cm[1, 4] := 0;

    cm[2, 0] := 0.11 * lum;
    cm[2, 1] := cm[2, 0];
    cm[2, 2] := cm[2, 0];
    cm[2, 3] := 0;
    cm[2, 4] := 0;

    cm[3, 0] := 0;
    cm[3, 1] := 0;
    cm[3, 2] := 0;
    cm[3, 3] := 1;
    cm[3, 4] := 0;

    cm[4, 0] := 0;
    cm[4, 1] := 0;
    cm[4, 2] := 0;
    cm[4, 3] := 0;
    cm[4, 4] := 1;

    ConvertImage(Img, cm);
end;


function ScaleBitmap(const TargetSize: integer; const Iml: TImageList; const i: integer; const DisableIcon: boolean): TBitmap;
var
  Bmp: TBitmap;
  GPImg: GPBitmap;
  GPResultGr: GPGraphics;

begin
  //Getting the alpha channel right is difficult. If we draw the imagelist in a TPngImage.Canvas.Handle or in a GDI+ DC, it loses the alpha channel.
  //So we need to draw it in a TBitmap.Canvas.Handle. But then, if we use GetDCFromHBitmpap or assign this bitmap to a png image, alpha is lost again.
  //If we save the bitmap to a stream and then load it with GDI+, alpha channel is lost.

  Bmp := TBitmap.Create;
  try
    Bmp.PixelFormat := TPixelFormat.pf32bit;
    Bmp.Transparent := true;
    SetBkMode(Bmp.Canvas.Handle, TRANSPARENT);
    Bmp.SetSize(Iml.Width, Iml.Height);
    Bmp.AlphaFormat := afIgnored;
    ImageList_Draw(Iml.Handle, i, Bmp.Canvas.Handle, 0, 0, ILD_TRANSPARENT);
    //Here we have a bmp with alpha channel. We need to convert it to something GDI+ can read.


    Check(GdipCreateBitmapFromScan0(Iml.Width, Iml.Height, Integer(Bmp.ScanLine[1]) - Integer(Bmp.ScanLine[0]), PixelFormat32bppARGB, Bmp.ScanLine[0], GPImg));
    try
      if DisableIcon then ConvertToGrayScale(GPImg);

      Result := TBitmap.Create;
      try
        Result.PixelFormat := TPixelFormat.pf32bit;
        Result.Transparent := true;
        SetBkMode(Result.Canvas.Handle, TRANSPARENT);
        Result.SetSize(TargetSize, TargetSize);
        Result.AlphaFormat := afIgnored;
        Check(GdipCreateFromHDC(Result.Canvas.Handle, GPResultGr));
        try
          Check(GdipSetInterpolationMode(GPResultGr, InterpolationModeHighQualityBicubic));
          Check(GdipSetSmoothingMode(GPResultGr, SmoothingModeAntiAlias));
          Check(GdipSetCompositingMode(GPResultGr, CompositingModeSourceOver));
          Check(GdipDrawImageRectI(GPResultGr, GPImg, 0, 0, TargetSize, TargetSize));
        finally
          GdipDeleteGraphics(GPResultGr);
        end;
      except
        Result.Free;
        raise;
      end;
    finally
      GdipDisposeImage(GPImg);
    end;
  finally
    Bmp.Free;
  end;
end;

procedure CopyImages(const Iml: TImageListScale; const TargetScale: integer);
var
  TargetSize, i: integer;
  Bmp: TBitmap;
begin
  if Iml.CorrectedList = nil then exit;
  TargetSize := Round(Iml.CorrectedList.Width * 100.0 / ExtractResolution(Iml.CorrectedList.Name) * TargetScale / 100.0);
  Iml.ImageList.Clear;
  Iml.ImageList.Width := TargetSize;
  Iml.ImageList.Height := TargetSize;
  for i := 0 to Iml.CorrectedList.Count - 1 do
  begin
    Bmp := ScaleBitmap(TargetSize, Iml.CorrectedList, i, not Iml.PerfectFit);
    try
      Iml.ImageList.Add(Bmp, nil);
    finally
      Bmp.Free;
    end;
  end;

end;

procedure FixImageLists(const Form: TForm; const TargetScale: integer);
var
  BaseImageLists: TDictionary<string, TImageListScale>;
  i: integer;
  ImgRoot: string;
  RootImgList: TImageListScale;
  ResImageLists: TList<TImageList>;
  Iml: TImageListScale;
begin
  BaseImageLists := TDictionary<string, TImageListScale>.Create;
  try
    ResImageLists := TList<TImageList>.Create;
    try
      for i := 0 to Form.ComponentCount - 1 do
      begin
        if Form.Components[i] is TImageList then
        begin
          if ISRooted(Form.Components[i].Name) then BaseImageLists.Add(Form.Components[i].Name, TImageListScale.Create(Form.Components[i] as TImageList))
          else
          begin
            ResImageLists.Add(Form.Components[i] as TImageList);
          end;
        end;
      end;

      for i := 0 to ResImageLists.Count - 1 do
      begin
        ImgRoot := GetRoot(ResImageLists[i].Name);
        if not BaseImageLists.TryGetValue(ImgRoot, RootImgList) then raise Exception.Create('Image list ' + ResImageLists[i].Name + ' doesn''t have a root. Verify it isn''t misspelt.');
        if (RootImgList.CorrectedList = nil)
            or IsBetterScale(RootImgList.Scale, ExtractResolution(ResImageLists[i].Name), TargetScale) then
            begin
              RootImgList.CorrectedList := ResImageLists[i];
              RootImgList.Scale := ExtractResolution(ResImageLists[i].Name);
              RootImgList.PerfectFit := true;
              BaseImageLists[ImgRoot] := RootImgList;
            end;
      end;

      for i := 0 to ResImageLists.Count - 1 do   //do disabled images after normal ones, so "real" disabled lists have preference.
      begin
        ImgRoot := GetRoot(ResImageLists[i].Name) + 'Disabled';
        if not BaseImageLists.TryGetValue(ImgRoot, RootImgList) then continue;
        if RootImgList.PerfectFit then continue;

        if (RootImgList.CorrectedList = nil)
            or IsBetterScale(RootImgList.Scale, ExtractResolution(ResImageLists[i].Name), TargetScale) then
            begin
              RootImgList.CorrectedList := ResImageLists[i];
              RootImgList.Scale := ExtractResolution(ResImageLists[i].Name);
              BaseImageLists[ImgRoot] := RootImgList;
            end;
      end;

      for Iml in BaseImageLists.Values do
      begin
        CopyImages(Iml, TargetScale);
      end;
    finally
      ResImageLists.Free;
    end;
  finally
    BaseImageLists.Free;
  end;
end;

procedure FixDynamicStuff(const Form: TForm; const TargetScale: integer);
var
  GdipToken: ULONG_PTR;
begin
  GdipToken := 0;
  InitGDIPlus(GdipToken);
  try
     FixImageLists(Form, TargetScale);
  finally
    ShutdownGDIPlus(GdipToken);
  end;
end;

procedure RegisterForHDPI(const Form: TForm; const OnChange: TOnDPIChangedProc);
var
  TargetScale: integer;
  FlexCelHDPI: TFlexCelHDPI;
begin
  TargetScale := Round(Form.Font.PixelsPerInch / 96.0 * 100.0);
{$IF CompilerVersion >= 30.0}
  FlexCelHDPI := TFlexCelHDPI.CreateAndInit(Form, TargetScale, OnChange, Form.OnAfterMonitorDpiChanged);
  Form.InsertComponent(FlexCelHDPI);
  Form.OnAfterMonitorDpiChanged := FlexCelHDPI.FormAfterMonitorDpiChanged;
{$ELSE}
  FlexCelHDPI := TFlexCelHDPI.CreateAndInit(Form, TargetScale, OnChange, nil);
  Form.InsertComponent(FlexCelHDPI);
{$IFEND}

  if Form.Font.PixelsPerInch = 96 then exit;
  FixDynamicStuff(Form, TargetScale);
  if Assigned(OnChange) then OnChange;

end;

{ TImageListScale }

constructor TImageListScale.Create(const aImageList: TImageList);
begin
  ImageList := aImageList;
  Scale := -1;
  CorrectedList := nil;
  PerfectFit := false;
end;

{ TFlexCelHDPI }

constructor TFlexCelHDPI.CreateAndInit(const aForm: TForm; const aFirstScale: integer;
  const aOnChange: TOnDPIChangedProc; const aOldEvent: TMonitorDpiChangedEvent);
begin
  Create(nil);
  OnChange := aOnChange;
  FirstScale := aFirstScale;
  Form := aForm;
  FOldEvent := aOldEvent;
end;

procedure TFlexCelHDPI.FormAfterMonitorDpiChanged(Sender: TObject; OldDPI,
  NewDPI: Integer);
begin
  if Assigned(FOldEvent) then FOldEvent(Sender, OldDPI, NewDPI);

  FixDynamicStuff(Form, NewDpi);
  if Assigned(OnChange) then OnChange;
end;

end.
