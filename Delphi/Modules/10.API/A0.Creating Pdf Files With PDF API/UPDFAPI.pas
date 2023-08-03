unit UPDFAPI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, UPaths,
  Dialogs, StdCtrls, FlexCel.VCLSupport, FlexCel.Core, FlexCel.Pdf,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellAPI;

type
  TFPDFAPI = class(TForm)
    Memo1: TMemo;
    btnCreateFile: TButton;
    SaveDialog: TSaveDialog;
    procedure btnCreateFileClick(Sender: TObject);
  private
    procedure CreateFile;
    procedure OpenFile;
  end;

var
  FPDFAPI: TFPDFAPI;

implementation
uses Generics.Collections;

{$R *.dfm}

type
  TUIBrushes = class  //a small class to cache the brushes and free them all.
  private
    Brushes: TObjectDictionary<TUIColor, TUIBrush>;
    Pens: TObjectDictionary<TUIColor, TUIPen>;
  public
    constructor Create;
    destructor Destroy; override;
    function GetBrush(const Color: TUIColor): TUIBrush;
    function GetPen(const Color: TUIColor): TUIPen;
  end;


procedure TFPDFAPI.btnCreateFileClick(Sender: TObject);
begin
  CreateFile;
  OpenFile;
end;

procedure TFPDFAPI.CreateFile;
var
  pdf: TPdfWriter;
  fStream: TFileStream;
  f: TUIFont;
  f2: TUIFont;
  points: TArray<TUIPointF>;
  Coords: TUIRectangle;
  Gradient: TUIBrush;
  Img: TUIImage;
  Brushes: TUIBrushes;
  Underline: TUITextDecoration;
begin
  if not SaveDialog.Execute then exit;
  Underline := TUITextDecoration.Create(TUIUnderline.Single);
  
  pdf := TPdfWriter.Create;
  try
    fStream := TFileStream.Create(SaveDialog.FileName, fmCreate);
    try
      Brushes := TUIBrushes.Create;
      try
        pdf.Compress := true;
        pdf.BeginDoc(fStream);
        pdf.YAxisGrowsDown := true;  //To keep it compatible with GDI+
        f := TUIFont.CreateNew('times new roman', 22.5, [TUIFontStyle.fsItalic]);
        try
          f2 := TUIFont.CreateNew('Arial', 12, [TUIFontStyle.fsItalic]);
          try
            pdf.SaveState;
            pdf.ClipPolygon(
              TArray<TUIPointF>.Create(
              TUIPointF.Create(50, 50),
              TUIPointF.Create(180, 50),
              TUIPointF.Create(50, 250),
              TUIPointF.Create(50, 50)), true);


            pdf.DrawAndFillPolygon(Brushes.GetPen(Colors.Aqua), Brushes.GetBrush(Colors.BlueViolet),
              TArray<TUIPointF>.Create(
              TUIPointF.Create(10, 10),
              TUIPointF.Create(300, 10),
              TUIPointF.Create(50, 300),
              TUIPointF.Create(10, 10)
              ));
            pdf.RestoreState;

            pdf.DrawString('This is the first line on a test of many lines.', f, Underline, Brushes.GetBrush(Colors.Navy), 100, 100);
            pdf.DrawString('Some unicode: '#$0E2A#$0E27#$0E31#$0E2A#$0E14#$0E35, f, Underline, Brushes.GetBrush(Colors.ForestGreen), 100, 200);
            pdf.DrawString('More lines here!', f, Underline, Brushes.GetBrush(Colors.ForestGreen), 200, 300);
            pdf.DrawString('And this is the last line.', f, Underline, Brushes.GetBrush(Colors.Black), 200, 400);
            pdf.Properties.Author := 'Adri'#$00E1'n';
            pdf.Properties.Title := 'This is a test of FlexCel Api';
            pdf.Properties.Keywords := 'test'#$000A'flexcel'#$000A'api';
            pdf.NewPage;
            pdf.SaveState;
            pdf.Rotate(200, 100, 45);
            pdf.DrawString('Some rotated test', f, Underline, Brushes.GetBrush(Colors.Black), 200, 200);
            pdf.RestoreState;
            pdf.DrawString('Some NOT rotated text', f, Underline, Brushes.GetBrush(Colors.Black), 200, 200);
            pdf.DrawString('Hello from FlexCel!', f2, Brushes.GetBrush(Colors.Black), 200, 50);
            points := TArray<TUIPointF>.Create(TUIPointF.Create(200, 100), TUIPointF.Create(200, 50), TUIPointF.Create(500, 50), TUIPointF.Create(700, 100));
            pdf.DrawLines(Brushes.GetPen(Colors.DarkOrchid), points);
            Coords := TUIRectangle.Create(100, 300, 100, 100);
            Gradient := TUILinearGradientBrush.CreateNew(Coords, Colors.Red, Colors.Blue, 0, false);
            try
              pdf.DrawAndFillRectangle(Brushes.GetPen(Colors.Red), Gradient, 100, 300, 100, 100);
            finally
              FreeAndNil(Gradient);
            end;
            pdf.DrawRectangle(Brushes.GetPen(Colors.DarkSlateBlue), 100, 300, 50, 50);
            pdf.DrawLine(Brushes.GetPen(Colors.Black), 100, 300, 200, 400);
            Img := TUIImage.FromFile(DataFolder + 'test.jpg');
            try
              pdf.DrawImage(Img, TUIRectangle.Create(200, 300, 200, 150), nil);
            finally
              FreeAndNil(Img);
            end;
            pdf.IntersectClipRegion(TUIRectangle.Create(100, 100, 50, 50));
            pdf.FillRectangle(Brushes.GetBrush(Colors.DarkTurquoise), 100, 100, 100, 100);

            pdf.EndDoc;
          finally
            FreeAndNil(f2);
          end;
        finally
          FreeAndNil(f);
        end;
      finally
        FreeAndNil(Brushes);
      end;
    finally
      FreeAndNil(fStream);
    end;
  finally
    FreeAndNil(pdf);
  end;
end;

procedure TFPDFAPI.OpenFile;
begin
  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

{ TUIBrushes }

function TUIBrushes.GetBrush(const Color: TUIColor): TUIBrush;
begin
  if Brushes.TryGetValue(Color, Result) then exit;
  Result := TUISolidBrush.CreateNew(Color);
  Brushes.Add(Color, Result);
end;

function TUIBrushes.GetPen(const Color: TUIColor): TUIPen;
begin
  if Pens.TryGetValue(Color, Result) then exit;
  Result := TUIPen.CreateNew(Color);
  Pens.Add(Color, Result);
end;

constructor TUIBrushes.Create;
begin
  Brushes := TObjectDictionary<TUIColor, TUIBrush>.Create([doOwnsValues]);
  Pens := TObjectDictionary<TUIColor, TUIPen>.Create([doOwnsValues]);
end;

destructor TUIBrushes.Destroy;
begin
  Pens.Free;
  Brushes.Free;
  inherited;
end;

end.
