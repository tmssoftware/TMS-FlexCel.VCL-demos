unit USearchEngine;
interface
{$region 'Uses'}
uses SysUtils, Math, StrUtils, Classes, Generics.Collections, IOUtils,
     VCL.FlexCel.Core, FlexCel.XlsAdapter, Generics.Defaults;
{$endregion}

type
 TModuleList = class (TDictionary<string, string>)
  public
    WordDef: string;
    constructor Create; overload;
    constructor Create(const Capacity: Int32); overload;
  end;

  TSearchEngine = class
  strict private
    MainPath: String;
    FInitialized: Boolean;
    WordTable: TObjectList<TModuleList>;
    FMainException: string;
    ModuleComparer: IComparer<TModuleList>;
    SearchModList: TModuleList;
    const WordDelim = ' ./\';
    const DataFile = 'keywords.dat';
    procedure Crawl(const RelativePath: string);
    procedure AddRtfFile(const FileName: string);
    procedure SkipCommand(const sr: TStreamReader);
    procedure GetWord(const first: Char; const sr: TStreamReader; const FileName: string);
    procedure AddTxtFile(const FileName: string);
    procedure AddXlsFile(const FileName: string);
    procedure AddWord(const word: string; const module: string);
    procedure SaveData(const filename: string);
    function LoadData(const filename: string): Boolean;
    function FilterWord(const s: string): TArray<string>;
  public
    constructor Create(const aMainPath: string);
    destructor Destroy; override;
    procedure Index;
    function Search(const words: string): TArray<string>;
    property Initialized: Boolean read FInitialized;
    property MainException: string read FMainException;
  end;

  TSearchEngineThread = class(TThread)
  private
    FSearchEngine: TSearchEngine;
  protected
    procedure Execute; override;
  public
    constructor Create(const aSearchEngine: TSearchEngine);
  end;

implementation
{$region 'Uses'}
uses Types, Character, __FlexCelVersionSpecific;
{$endregion}

{$region 'ModuleList'}
{ ModuleList }
constructor TModuleList.Create;
begin
  inherited Create(TFlxIStringComparer.Ordinal);
end;

constructor TModuleList.Create(const Capacity: Int32);
begin
  inherited Create(Capacity, TFlxIStringComparer.Ordinal);
end;

{$endregion}

type
TModuleListComparer = class(TComparer<TModuleList>)
  public
    function Compare(const Left, Right: TModuleList): Integer; override;
end;

{ TModuleListComparer }

function TModuleListComparer.Compare(const Left, Right: TModuleList): Integer;
begin
  Result := CompareText(Left.WordDef, Right.WordDef);
end;


{$region 'SearchEngine'}
{ SearchEngine }
constructor TSearchEngine.Create(const aMainPath: string);
begin
  inherited Create;
  //Initializations

  MainPath := aMainPath;
  FInitialized := false;
  ModuleComparer := TModuleListComparer.Create;
  SearchModList := TModuleList.Create;
end;

destructor TSearchEngine.Destroy;
begin
  FreeAndNil(WordTable);
  FreeAndNil(SearchModList);

  inherited;
end;

procedure TSearchEngine.Index;
var
  ModulesPath: string;
  ConfigFile: string;
  Loaded: Boolean;
begin
  try
    ModulesPath := TPath.GetFullPath(TPath.Combine(MainPath, 'Modules'));
    ConfigFile := TPath.Combine(MainPath, DataFile);
    try
      WordTable := TObjectList<TModuleList>.Create;
      Loaded := false;
      if FileExists(ConfigFile) then
      begin
        Loaded := LoadData(ConfigFile);
      end;

      if not Loaded then
      begin
        Crawl(ModulesPath);
        SaveData(ConfigFile);
      end;

    except
        begin
          TFile.Delete(ConfigFile);
          raise;
        end;
    end;
    FInitialized := true;
  except
     //this method is designed to run in a thread, so we will not pass exceptions.
    on ex: Exception do
      begin
        FMainException := ex.Message;
      end;
  end;
end;

function TSearchEngine.FilterWord(const s: string): TArray<string>;
var
  ZList : String;
  Index: integer;
  DResult: TDictionary<string, boolean>;
begin
  SearchModList.WordDef := s;
  WordTable.BinarySearch(SearchModList, Index, ModuleComparer);

  if (Index < 0) then Index := 0;

  DResult := TDictionary<string, boolean>.Create;
  try
    while Index < WordTable.Count do
    begin
      if StartsText(s, WordTable[Index].WordDef) then
      begin
        for ZList in WordTable[Index].Keys do
        begin
          DResult.AddOrSetValue(ZList, true);
        end;
        inc(Index);
      end else break;
    end;

    Result := DResult.Keys.ToArray;
  finally
    FreeAndNil(DResult);
  end;

end;

function TSearchEngine.Search(const words: string): TArray<string>;
var
  w: TStringDynArray;
  s: string;
  s1: string;
  key: string;
  Modules: TDictionary<string, boolean>;
  WordView: TArray<String>;
  KeysToRemove: TList<String>;
  index: integer;
begin
  Modules := nil;
  try
    w := SplitString(words, WordDelim);
    Result := nil;
    for s in w do
    begin
      s1 := Trim(UpperCase(s));
      if Length(s1) <= 0 then
        continue;

      WordView := FilterWord(s);

      if Length(WordView) > $64 then  //Do not bother filtering by this keyword, too many entries.
        continue;

      if Modules = nil then
      begin
        Modules := TDictionary<String, boolean>.Create;
        for key in WordView do
        begin
          Modules.AddOrSetValue(key, true);
        end;
      end else
      begin  //"And" words together.
        KeysToRemove := TList<string>.Create;
        TArray.Sort<string>(WordView);
        try
          for key in Modules.Keys do
          begin
            if not TArray.BinarySearch<string>(WordView, key, index) then
              KeysToRemove.Add(key);

          end;
          for key in KeysToRemove do Modules.Remove(key);

        finally
          FreeAndNil(KeysToRemove);
        end;
      end;

      if Modules.Count = 0 then  //no need to keep on filtering.
        exit(nil);

    end;

    if Modules = nil then Result := nil else Result := Modules.Keys.ToArray;
  finally
    FreeAndNil(Modules);
  end;
end;

procedure TSearchEngine.Crawl(const RelativePath: string);
var
  f: string;
begin
  for f in TDirectory.GetDirectories(RelativePath) do
  begin
    Crawl(f);
  end;
  for f in TDirectory.GetFiles(RelativePath, '*.rtf') do
  begin
    AddRtfFile(f);
  end;
  for f in TDirectory.GetFiles(RelativePath, '*.cpp') do
  begin
    AddTxtFile(f);
  end;
  for f in TDirectory.GetFiles(RelativePath, '*.pas') do
  begin
    AddTxtFile(f);
  end;
  for f in TDirectory.GetFiles(RelativePath, '*.txt') do
  begin
    AddTxtFile(f);
  end;
  for f in TDirectory.GetFiles(RelativePath, '*.xls') do
  begin
    AddXlsFile(f);
  end;

  WordTable.Sort(ModuleComparer);
end;

procedure TSearchEngine.AddRtfFile(const FileName: string);
var
  sr: TStreamReader;
  key: Int32;
begin
   //This implements a *really* basic parser, but it doesn't matter for this use.
  sr := TStreamReader.Create(FileName);
  try
    while true do
    begin
      key := sr.Read;
      if key <= 0 then break;

      if (key = ord('}')) or (key = ord('{')) then
        continue;

      if key = ord('\') then
      begin
        SkipCommand(sr);
        continue;
      end;

 {$if CompilerVersion >= 25.0}
      if Char(key).IsLetterOrDigit then
 {$else}
      if TCharacter.IsLetterOrDigit(Char(key)) then
 {$ifend}
      begin
        GetWord(Char(key), sr, FileName);
        continue;
      end;

    end;
  finally
    FreeAndNil(sr);
  end;
end;

procedure TSearchEngine.SkipCommand(const sr: TStreamReader);
var
  key: Int32;
begin  //This method is too naive, it will ignore parameters. This means that in text like:
  // "\fcharset0 Garamond;" Garamond will be considered a word. Again, not a big problem here.
  // What matters more here is speed, and this is faster than using a RichTextBox
  while true do
  begin
    key := sr.Read;
    if key <= 0 then break;
    if key = ord(' ') then
      exit;

  end;
end;

procedure TSearchEngine.GetWord(const first: Char; const sr: TStreamReader; const FileName: string);
var
  key: Int32;
  sb: string;
begin
  sb := '';
  sb := sb + first;
  while true do
  begin
    key := sr.Read;
    if key <= 0 then break;
 {$if CompilerVersion >= 25.0}
      if Char(key).IsLetterOrDigit then
 {$else}
      if TCharacter.IsLetterOrDigit(Char(key)) then
 {$ifend}
    begin
      sb := sb + Char(key);
    end else
    begin
      AddWord(sb, FileName);
      exit;
    end;

  end;
end;

procedure TSearchEngine.AddTxtFile(const FileName: string);
var
  sr: TStreamReader;
  line: string;
  words:TStringDynArray;
  word: string;
begin
  sr := TStreamReader.Create(FileName);
  try
    while true do
    begin
      if sr.EndOfStream then break;
      line := sr.ReadLine;
      words := SplitString(line, WordDelim);
      for word in words do
      begin
        AddWord(word, FileName);
      end;
    end;
  finally
    FreeAndNil(sr);
  end;
end;

procedure TSearchEngine.AddXlsFile(const FileName: string);
var
  xls: TXlsFile;
  sheet: Int32;
  r: Int32;
  cindex: Int32;
  XF: Int32;
  cell: TCellValue;
  w: TStringDynArray;
  ws: string;

begin
  xls := TXlsFile.Create;
  try try
      xls.Open(FileName);
    except
      on ex: EFlexCelXlsAdapterException do
        begin
          if ex.ErrorCode = TXlsErr.ErrInvalidPassword then
            exit;

          raise ;
        end;
    end;
    for sheet := 1 to xls.SheetCount do
    begin
      xls.ActiveSheet := sheet;
      for r := 1 to xls.RowCount do
      begin
        for cindex := 1 to xls.ColCountInRow(r) do
        begin
          XF := -1;
          cell := xls.GetCellValueIndexed(r, cindex, XF);
          w := SplitString(cell.ToString, WordDelim);
          for ws in w do
          begin
            AddWord(ws, FileName);  //we could use TFlxNumberFormat.FormatValue() here, but we don't care about formatted values for searching.
          end;

        end;

      end;

    end;
  finally
    FreeAndNil(xls);
  end;
end;

procedure TSearchEngine.AddWord(const word: string; const module: string);
var
  Trimmed: string;
  Index: integer;
begin
  Trimmed := UpperCase(Trim(word));
  if Length(Trimmed) <= 2 then  //Filter small words. we need 3, for things like .net or asp, or com.
    exit;

  SearchModList.WordDef := Trimmed;
  if not WordTable.BinarySearch(SearchModList, Index, ModuleComparer) then
  begin
    WordTable.Insert(Index, TModuleList.Create);
    WordTable[Index].WordDef := word;
  end;

  WordTable[Index].AddOrSetValue(module, module);
end;

procedure TSearchEngine.SaveData(const filename: string);
var
  fs: TStreamWriter;
  list: TModuleList;
  key: string;
begin
  fs := TStreamWriter.Create(filename);
  try
    fs.WriteLine(FlexCelVersion);
    fs.WriteLine(WordTable.Count);
    for list in WordTable do
    begin
      fs.WriteLine(list.WordDef);
      fs.WriteLine(list.Count);
      for key in list.Keys do
      begin
        fs.WriteLine(key);
      end;
    end;
  finally
    FreeAndNil(fs);
  end;
end;

function TSearchEngine.LoadData(const filename: string): Boolean;
var
  fs: TStreamReader;
  Version: string;
  Entries: Int32;
  i: Int32;
  word: string;
  modulecount: Int32;
  list: TModuleList;
  k: Int32;
  m: string;
begin
  try
    fs := TStreamReader.Create(filename);
    try
      if fs.EndOfStream then
        exit(false);

      Version := fs.ReadLine;
      if Version <> FlexCelVersion then  //if this is a new version, regenerate the index.
        exit(false);

      Entries := StrToInt(fs.ReadLine);
      for i := 0 to Entries - 1 do
      begin
        word := fs.ReadLine;
        modulecount := StrToInt(fs.ReadLine);
        list := TModuleList.Create(modulecount);
        list.WordDef := word;
        for k := 0 to modulecount - 1 do
        begin
          m := fs.ReadLine;
          list.Add(m, m);
        end;

        WordTable.Add(list);
      end;

    finally
      FreeAndNil(fs);
    end;
  except
      begin
        exit(false);
      end;
  end;
  Result := true;
end;

{$endregion}

{ TSearchEngineThread }

constructor TSearchEngineThread.Create(const aSearchEngine: TSearchEngine);
begin
  inherited Create(true);
  NameThreadForDebugging('Index Thread');
  FreeOnTerminate := false;
  FSearchEngine := aSearchEngine;
end;

procedure TSearchEngineThread.Execute;
begin
  FSearchEngine.Index;
end;

end.
