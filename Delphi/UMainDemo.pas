unit UMainDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, Menus,
  ComCtrls, StdCtrls, ExtCtrls, ToolWin, USearchEngine, IOUtils, UPaths, UProgressDialog,
  Types, Generics.Collections;

type
  ClassTForm = class of TForm;

  //Data to be stored in the nodes of the left treeview.
  TModuleData = class
    public
      Caption: string;
      Path: string;
      Children: TObjectList<TModuleData>;
      constructor Create(const aCaption: string; const aPath: string);
      destructor Destroy; override;
  end;

  TMainDemoForm = class(TForm)
    Panel1: TPanel;
    PanelModules: TPanel;
    ModulesList: TTreeView;
    Panel2: TPanel;
    DescriptionText: TRichEdit;
    StatusBar: TStatusBar;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    exit1: TMenuItem;
    Demo1: TMenuItem;
    RunSelected1: TMenuItem;
    N1: TMenuItem;
    ViewTemplate1: TMenuItem;
    OpenProject1: TMenuItem;
    MenuCommands: TActionList;
    ActionExit: TAction;
    ActionRun: TAction;
    ActionViewTemplate: TAction;
    ActionOpenProject: TAction;
    ToolbarImages: TImageList;
    Help1: TMenuItem;
    About1: TMenuItem;
    ActionAbout: TAction;
    Panel3: TPanel;
    SearchImg: TImageList;
    PopLaunch: TPopupMenu;
    ActionOpenFolder: TAction;
    ToolbarImages_100Scale: TImageList;
    ToolbarImages_300Scale: TImageList;
    SearchImg_300Scale: TImageList;
    SearchImg_100Scale: TImageList;
    Panel4: TPanel;
    sdSearch: TButtonedEdit;
    MainToolBar: TToolBar;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    Panel5: TPanel;
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionOpenProjectExecute(Sender: TObject);
    procedure ActionAboutExecute(Sender: TObject);
    procedure sdSearchRightButtonClick(Sender: TObject);
    procedure sdSearchChange(Sender: TObject);
    procedure ActionViewTemplateExecute(Sender: TObject);
    procedure ModulesListChange(Sender: TObject; Node: TTreeNode);
    procedure ActionRunExecute(Sender: TObject);
    procedure ActionOpenFolderExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Finder: TSearchEngine;
    MainNode: TModuleData;

    function HasFilesToLaunch(const extensions: array of string): TArray<String>;
    function HasFileToLaunch(const extension: string): String;
    function GetLinkedFile(const LinkFile: string): string;
    procedure FilterTree(const All: boolean; const FoundModules: TArray<string>); overload;
    procedure FilterTree(const All: boolean; const FoundModules: TArray<string>;
      const ParentNode: TModuleData; const ParentTreeNode: TTreeNode;
      const OldSelectedPath: String; var NewSelected: TTreeNode); overload;
    procedure LoadModule(MainPath, modulePath: String;
      const node: TModuleData);
    procedure LoadModules;
    procedure LaunchFiles(const extensions: array of string);
    procedure PopLaunchClick(Sender: TObject);
    function HasKey(const FoundModules: TArray<string>;
      const pattern: String): Boolean;
    function ExtraPath(const extension: string): string;
    procedure Execute(fname: string);
    procedure Compile(const fname: string; const BatName: string; const IsMsBuild: boolean);
    function DProjForExe(const fname: string): string;
    { Private declarations }
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;
    { Public declarations }
  end;

var
  MainDemoForm: TMainDemoForm;

implementation
  uses ShellApi, UAbout, StrUtils, UCompileProgress, UFlexCelHDPI;

{$R *.dfm}

const
  ExtLaunch = '.exe';
  ExtTemplate: array[0..2] of string = ('.template.xls', '.template.xlsx', '.template.xlsm');
  ExtProj: array[0..1] of string = ('.dproj', '.cbproj');
  ExtLocation = '.location.txt';


procedure TMainDemoForm.ActionAboutExecute(Sender: TObject);
var
  About: TAboutForm;
begin
  About := TAboutForm.Create(nil);
  try
    About.ShowModal;
  finally
    FreeAndNil(About);
  end;
end;

procedure TMainDemoForm.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainDemoForm.ActionOpenFolderExecute(Sender: TObject);
var
  f: string;
begin
  if (ModulesList.Selected = nil) or (ModulesList.Selected.Data = nil) then exit;
  f := ExtractFilePath(TModuleData(ModulesList.Selected.Data).Path);
  ShellExecute(handle, 'open', PChar(f), nil, nil, SW_SHOWNORMAL);
end;

procedure TMainDemoForm.ActionOpenProjectExecute(Sender: TObject);
begin
  LaunchFiles(ExtProj);
end;

procedure TMainDemoForm.ActionRunExecute(Sender: TObject);
begin
  LaunchFiles([ExtLaunch]);
end;

procedure TMainDemoForm.ActionViewTemplateExecute(Sender: TObject);
begin
  LaunchFiles(ExtTemplate);
end;

constructor TMainDemoForm.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  LoadModules;
  FilterTree(true, nil);
end;

destructor TMainDemoForm.Destroy;
begin
  FreeAndNil(Finder);
  FreeAndNil(MainNode);
  inherited;
end;

function TMainDemoForm.GetLinkedFile(const LinkFile: string): string;
var
  LinkedFile: TStringList;
begin
  LinkedFile := TStringList.Create;
  try
    LinkedFile.LoadFromFile(LinkFile);
    if LinkedFile.Count > 0 then
    begin
      Result := LinkedFile[0];
      exit;
    end;
  finally
    FreeAndNil(LinkedFile);
  end;

  Result:='';
end;

function TMainDemoForm.HasFilesToLaunch(const extensions: array of string): TArray<String>;
var
  ext, s: string;
begin
  Result := nil;
  for ext in extensions do
  begin
    s := HasFileToLaunch(ext);
    if s <> '' then
    begin
      SetLength(Result, Length(Result) + 1);
      Result[Length(Result) - 1] := s;
    end;
  end;
end;

function TMainDemoForm.DProjForExe(const fname: string): string;
var
  Path, DProj: string;
  i: integer;
begin
  Path := TPath.Combine(TPath.Combine(TPath.GetDirectoryName(fname), '..'), '..');
  for i := 0 to Length(ExtProj) - 1 do
  begin
    DProj := TPath.Combine(Path, TPath.GetFileNameWithoutExtension(fname) + ExtProj[i]);
    if TFile.Exists(DProj) then
    begin
      exit(DProj);
    end;
  end;

  exit('');
end;

procedure TMainDemoForm.Compile(const fname, BatName: string; const IsMsBuild: boolean);
var
  Compiler: TFCompiler;
  DProj: string;
begin
  DProj := DProjForExe(fname);
  if dProj = '' then exit;

  Compiler := TFCompiler.Create(nil);
  try
    Compiler.Compile(DProj, BatName, IsMsBuild);
  finally
    Compiler.Free;
  end;
end;

procedure TMainDemoForm.Execute(fname: string);
begin
  if (TPath.GetExtension(fname) = ExtLaunch) and not TFile.Exists(fname) then
  begin
    Compile(fname, 'MainDemoCompile.bat', true);
    if not TFile.Exists(fname) then
    begin
      Compile(fname, 'MainDemoCompileBDS.bat', false);
    end;

    if not TFile.Exists(fname) then
    begin
      ShowMessage('There has been an error compiling the demo. You can try to manually compile it from Delphi.');
      exit;
    end;
  end;

  ShellExecute(handle, nil, PChar(fname), nil, nil, SW_SHOWNORMAL);
end;

procedure TMainDemoForm.LaunchFiles(const extensions: array of string);
var
  files: TArray<string>;
  s: string;
  mi: TMenuItem;
begin
  files := HasFilesToLaunch(extensions);
  if (files = nil) then exit;
  if Length(files) = 1 then
  begin
    Execute(files[0]);
    exit;
  end;

  PopLaunch.Items.Clear;
  for s in files do
  begin
    mi := TMenuItem.Create(PopLaunch);
    PopLaunch.Items.Add(mi);
    mi.Caption := ExtractFileName(s);
    mi.Hint := s;
    mi.OnClick := PopLaunchClick;
  end;

  PopLaunch.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TMainDemoForm.PopLaunchClick(Sender: TObject);
begin
  Execute((Sender as TMenuItem).Hint);
end;

function TMainDemoForm.ExtraPath(const extension: string): string;
begin
if extension <> ExtLaunch then exit;
Result := '';
{$IFDEF WIN64}
  Result := Result + 'Win64\';
{$ENDIF}
{$IFDEF WIN32}
  Result := Result + 'Win32\';
{$ENDIF}

{$IFDEF DEBUG}
  Result := Result + 'Debug\';
{$ELSE}
  Result := Result + 'Release\';
{$ENDIF}
end;

function TMainDemoForm.HasFileToLaunch(const extension: string): String;
var
  aPath, mPath, mName: string;
  fName: string;
begin
  Result := '';
  if (ModulesList.Selected = nil) or (ModulesList.Selected.Data = nil) then exit;
  if ModulesList.Selected.Parent = nil then exit; //nothing to launch in main node.

  aPath := TModuleData(ModulesList.Selected.Data).Path;
  mName := ExtractFileName(aPath);

  mPath := IncludeTrailingPathDelimiter(ExtractFilePath(aPath));
  mName := StringReplace(mName,' ', '', [rfReplaceAll]);

  fName := mPath + copy(extension, 2, Length(extension)) + ExtLocation;
  if FileExists(fName) then
  begin
    Result := mPath + GetLinkedFile(fName);
    exit;
  end;

  fName := mPath + ExtraPath(extension) + mName + extension;
  if FileExists(fName) then
  begin
    Result := fName;
    exit;
  end;

  if DProjForExe(fName) <> '' then
  begin
   Result := fName;
   exit;
  end;

  fName := aPath + extension;
  if FileExists(fName) then
  begin
    Result := fName;
    exit;
  end;

end;

procedure TMainDemoForm.FilterTree(const All: boolean; const FoundModules: TArray<string>);
var
  OldSelected: TTreeNode;
  OldSelectedPath: String;
  MainTreeNode: TTreeNode;
  NewSelected: TTreeNode;
begin
  ModulesList.Items.BeginUpdate;
  try
    begin
      OldSelected := ModulesList.Selected;
      OldSelectedPath := '';
      if OldSelected <> nil then
        OldSelectedPath := TModuleData(OldSelected.Data).Path;

      ModulesList.Items.Clear;
      MainTreeNode := ModulesList.Items.AddObject(nil, MainNode.Caption, MainNode);
      NewSelected := nil;
      FilterTree(All, FoundModules, MainNode, MainTreeNode, OldSelectedPath, NewSelected);

      ModulesList.FullExpand;
      if NewSelected = nil then
        NewSelected := MainTreeNode;

      ModulesList.Selected := NewSelected;
      NewSelected.MakeVisible;
    end;
  finally
    begin
      ModulesList.Items.EndUpdate;
    end;
  end;
end;

procedure TMainDemoForm.FilterTree(const All: boolean; const FoundModules: TArray<string>; const ParentNode: TModuleData; const ParentTreeNode: TTreeNode; const OldSelectedPath: String; var NewSelected: TTreeNode);
var
  node: TModuleData;
  NewNode: TTreeNode;
begin
  for node in ParentNode.Children do
  begin
    if (All) or HasKey(FoundModules, TPath.GetDirectoryName(node.Path)) then
    begin
      NewNode := ModulesList.Items.AddChildObject(ParentTreeNode, node.Caption, node);

      FilterTree(All, FoundModules, node, NewNode, OldSelectedPath, NewSelected);
      if node.Path = OldSelectedPath then
        NewSelected := NewNode;

    end;

  end;
end;

procedure TMainDemoForm.FormCreate(Sender: TObject);
begin
  RegisterForHDPI(Self, nil);
end;

function TMainDemoForm.HasKey(const FoundModules: TArray<string>; const pattern: String): Boolean;
var
  s: String;
begin
  if pattern = '' then
    exit(false);

  for s in FoundModules do
  begin
    if StartsText(pattern, s) then
      exit(true);

  end;
  Result := false;
end;


procedure TMainDemoForm.sdSearchChange(Sender: TObject);
var
  SearchThread: TThread;
  Pg: TProgressDialog;
  ex: string;
  FoundModules: TArray<string>;
begin
  if (Finder = nil) or not Finder.Initialized then
  begin
    Finder := TSearchEngine.Create(TPath.GetDirectoryName(DataFolder));
    SearchThread := TSearchEngineThread.Create(Finder);
    try
      SearchThread.Start;
      Pg := TProgressDialog.Create(nil);
      try
        Pg.ShowProgress(SearchThread);
        SearchThread.WaitFor;
        if (Finder <> nil) and (Finder.MainException <> '') then
        begin
          ex := Finder.MainException;
          Finder := nil;
          raise Exception.Create(ex);
        end;

      finally
        FreeAndNil(Pg);
      end;
    finally
      FreeAndNil(SearchThread);
    end;
  end;

  FoundModules := Finder.Search(sdSearch.Text);
  FilterTree(Trim(sdSearch.Text) = '', FoundModules);
end;

procedure TMainDemoForm.sdSearchRightButtonClick(Sender: TObject);
begin
  sdSearch.Text := '';
end;

procedure TMainDemoForm.LoadModules;
var
  MainPath: String;

  subdirectoryEntries: TStringDynArray;
  subdirectory: String;
begin
  MainPath := DataFolder;
  MainNode := TModuleData.Create(Caption, MainPath + 'MainDemo');
  if not DirectoryExists(TPath.Combine(MainPath, 'Modules')) then exit;

  subdirectoryEntries := TDirectory.GetDirectories(TPath.Combine(MainPath, 'Modules'));
  for subdirectory in subdirectoryEntries do
    LoadModule(TPath.Combine(MainPath, 'Modules'), subdirectory, MainNode);

end;

procedure TMainDemoForm.ModulesListChange(Sender: TObject; Node: TTreeNode);
begin
  if ModulesList.Items.Count <= 1 then exit;
  
  if (Node.Data = nil) then DescriptionText.Clear
  else DescriptionText.Lines.LoadFromFile(TModuleData(Node.Data).Path + '.rtf');

  if (Node.Data <> nil) then StatusBar.SimpleText := TModuleData(Node.Data).Path;

  ActionRun.Enabled := HasFileToLaunch(ExtLaunch) <> '';
  ActionViewTemplate.Enabled := HasFilesToLaunch(ExtTemplate) <> nil;
  ActionOpenProject.Enabled := HasFilesToLaunch(ExtProj) <> nil;
end;

procedure TMainDemoForm.LoadModule(MainPath: String; modulePath: String; const node: TModuleData);
var
  LinkFile: String;
  sr: TStreamReader;
  RelPath: String;
  moduleName: String;
  shortModule: String;
  NodePath: String;
  NewNode: TModuleData;
  subdirectoryEntries: TStringDynArray;
  subdirectory: String;
begin
  LinkFile := TPath.Combine(modulePath, 'link.txt');
  if FileExists(LinkFile) then
  begin
    sr := TStreamReader.Create(LinkFile);
    try
  		RelPath := StringReplace(sr.ReadLine, '\', PathDelim, [rfReplaceAll]);
      modulePath := TPath.GetFullPath(TPath.Combine(MainPath, RelPath));
    finally
      FreeAndNil(sr);
    end;
  end;

  moduleName := TPath.GetFileName(modulePath);
  shortModule := System.Copy(moduleName, System.Pos('.', moduleName) + 1, Length(moduleName));
  if (Length(moduleName) < 1) or (moduleName[1] = '.') then  //Do not process hidden folders.
    exit;

  if Pos('.', moduleName) <= 0 then  //Do not process folders without the convention xx.name
    exit;

  NodePath := '';
  if FileExists(TPath.Combine(modulePath, shortModule + '.rtf')) then
  begin
    NodePath := TPath.Combine(modulePath, shortModule);
  end;

  NewNode := TModuleData.Create(ShortModule, NodePath);
  Node.Children.Add(NewNode);

  subdirectoryEntries := TDirectory.GetDirectories(modulePath);
  for subdirectory in subdirectoryEntries do
    LoadModule(MainPath, subdirectory, NewNode);
end;

{ TModuleData }

constructor TModuleData.Create(const aCaption, aPath: string);
begin
  Caption := aCaption;
  Path := TPath.GetFullPath(aPath);
  Children := TObjectList<TModuleData>.Create;
end;

destructor TModuleData.Destroy;
begin
  FreeAndNil(Children);
  inherited;
end;

end.
