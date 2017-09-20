unit UIntelligentPageBreaks;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, UPaths,
  Dialogs, StdCtrls, Generics.Collections, VCL.FlexCel.Core, FlexCel.XlsAdapter,
  FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellAPI;

type
  TFIntelligentPageBreaks = class(TForm)
    Memo1: TMemo;
    btnCreateFile: TButton;
    SaveDialog: TSaveDialog;
    procedure btnCreateFileClick(Sender: TObject);
  private
    Keywords: TDictionary<string, boolean>;
    procedure AddData(const Xls: TExcelFile);
    procedure AutoRun;
    class function CreateKeywords: TDictionary<string, boolean>; static;
    procedure DumpFile(const Xls: TExcelFile; var Row: Int32);
    function SyntaxColor(const Xls: TExcelFile; const NormalFont, CommentFont,
      HighlightFont: TFlxFont; const line: String): TRichString;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  FIntelligentPageBreaks: TFIntelligentPageBreaks;

implementation
uses Character, IOUtils, StrUtils;
{$R *.dfm}

{$region 'Base'}
procedure TFIntelligentPageBreaks.btnCreateFileClick(Sender: TObject);
begin
  AutoRun;
end;

constructor TFIntelligentPageBreaks.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Keywords := CreateKeywords;
end;

destructor TFIntelligentPageBreaks.Destroy;
begin
  Keywords.Free;

  inherited;
end;

{$endregion}

{$region 'Syntax definitions'}
/// <summary>
/// A very silly syntax highlighter. We don't have any context here, so for example "write" will be highlighted when it is a property or when it is not, but it is ok for this demo.
/// </summary>
/// <returns></returns>
class function TFIntelligentPageBreaks.CreateKeywords: TDictionary<string, boolean>;
begin
  Result := TDictionary<string, boolean>.Create;
  Result.Add('interface', false);
  Result.Add('implementation', false);
  Result.Add('uses', false);
  Result.Add('unit', false);
  Result.Add('type', false);
  Result.Add('begin', false);
  Result.Add('end', false);
  Result.Add('inherited', false);
  Result.Add('const', false);
  Result.Add('var', false);
  Result.Add('private', false);
  Result.Add('public', false);
  Result.Add('protected', false);
  Result.Add('static', false);
  Result.Add('procedure', false);
  Result.Add('function', false);
  Result.Add('read', false);
  Result.Add('write', false);
  Result.Add('exit', false);
  Result.Add('while', false);
  Result.Add('for', false);
  Result.Add('true', false);
  Result.Add('false', false);
  Result.Add('try', false);
  Result.Add('finally', false);
  Result.Add('except', false);
  Result.Add('if', false);
  Result.Add('then', false);
  Result.Add('do', false);

end;
{$endregion}

function IsLetterOrDigit(const c: char): boolean;
begin
 {$if CompilerVersion >= 25.0}
      Result := c.IsLetterOrDigit;
 {$else}
      Result := TCharacter.IsLetterOrDigit(c);
 {$ifend}

end;

{$region 'Syntax highlight method'}
/// <summary>
/// This syntax highlighter is not serious, just to make output a little prettier.
/// </summary>
/// <param name="Xls"></param>
/// <param name="NormalFont"></param>
/// <param name="CommentFont"></param>
/// <returns></returns>
function TFIntelligentPageBreaks.SyntaxColor(const Xls: TExcelFile; const NormalFont: TFlxFont; const CommentFont: TFlxFont; const HighlightFont: TFlxFont; const line: String): TRichString;
var
  RTFRunList: TList<TRTFRun>;
  i: Int32;
  rtf: TRTFRun;
  start: Int32;
begin
  RTFRunList := TList<TRTFRun>.Create;
  try
    i := 1;
    while i <= Length(line) do
    begin
      if ((i > 1) and (line[i] = '/')) and (line[i - 1] = '/') then
      begin
        rtf.FirstChar := i - 1;
        rtf.Font := CommentFont;
        RTFRunList.Add(rtf);
        exit(TRichString.Create(line, RTFRunList.ToArray));
      end;

      start := i;
      while (i <= Length(line)) and IsLetterOrDigit(line[i]) do
      begin
        Inc(i);
      end;
      if (i > start) and Keywords.ContainsKey(System.Copy(line, start, i - start)) then
      begin
        rtf.FirstChar := start - 1;
        rtf.Font := HighlightFont;
        RTFRunList.Add(rtf);
        rtf.FirstChar := i - 1;
        rtf.Font := NormalFont;
        RTFRunList.Add(rtf);
      end;

      Inc(i);
    end;
    Result := TRichString.Create(line, RTFRunList.ToArray);
  finally
    RTFRunList.Free;
  end;
end;

{$endregion}

{$region 'Dump'}
procedure TFIntelligentPageBreaks.DumpFile(const Xls: TExcelFile; var Row: Int32);
var
  HighlightFont: TFlxFont;
  CommentFont: TFlxFont;
  Level: Int32;
  LevelStart: TStack<integer>;
  sr: TStreamReader;
  line: String;
  s: String;
begin
  HighlightFont := Xls.GetDefaultFont;
  HighlightFont.Color := clBlue;

  CommentFont := Xls.GetDefaultFont;
  CommentFont.Color := clGreen;

  Level := 0;
  LevelStart := TStack<integer>.Create;
  try
    LevelStart.Push(Row);
    sr := TStreamReader.Create(TPath.Combine(DataFolder, 'UIntelligentPageBreaks.pas'));
    try
      while not sr.EndOfStream do
      begin
        line := sr.ReadLine;
        s := Trim(line);  //Find the level of "keep together" for the row. We will use {$region and "begin" delimiters
                          //to increase the level. If possible, we would want those blocks together in one page.
        if StartsText('{$region', s) then
        begin
          Inc(Level);
          LevelStart.Push(Row);
        end;

        if (SameText('{$endregion}', s)) then
        begin
          Xls.KeepRowsTogether(Int32(LevelStart.Pop), Row, Level, false);
          Dec(Level);
        end;

        Xls.SetCellValue(Row, 1, SyntaxColor(Xls, Xls.GetDefaultFont, CommentFont, HighlightFont, StringReplace(line, #$0009, '    ', [rfReplaceAll])));
        Inc(Row);
      end;
    finally
      sr.Free;
    end;
  finally
    LevelStart.Free;
  end;
end;

{$endregion}
{$region 'Add data'}
procedure TFIntelligentPageBreaks.AddData(const Xls: TExcelFile);
var
  Row: Int32;
begin
  Row := 3;  //Fill the file with the contents of this pas file, many times so we can see many page breaks.
  DumpFile(Xls, Row);
  Xls.AutofitRowsOnWorkbook(false, true, 1);
  Xls.AutoPageBreaks(50, 95);

  Xls.Save(SaveDialog.FileName);
end;

{$endregion}
{$region 'Autorun'}

procedure TFIntelligentPageBreaks.AutoRun;
var
  Xls: TExcelFile;
  fmt: TFlxFormat;
begin
  if not SaveDialog.Execute then
    exit;

  Xls := TXlsFile.Create(true);
  try
    Xls.NewFile(1);
    Xls.SetColWidth(1, 78 * 256);  //;make longer lines wrap in the cell.
    fmt := Xls.GetFormat(Xls.GetColFormat(1));
    fmt.WrapText := true;
    Xls.SetColFormat(1, Xls.AddFormat(fmt));
    AddData(Xls);
    if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
    end;
  finally
    Xls.Free;
  end;

end;
{$endregion}


end.
