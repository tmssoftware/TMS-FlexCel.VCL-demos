unit UProgressThread;

interface
uses Classes, SysUtils, VCL.FlexCel.Core;
type

TProgressThread = class(TThread)
  protected
    ProgressFeedback: TProc<integer, string>;
    FinalFeedback: TProc<boolean, string>;
    Xls: TExcelFile;
    FileName: string;
    AllSheets: boolean;
    Canceled: boolean;

{$IF CompilerVersion > 22} //Delphi XE doesn't support TerminatedSet, so sadly in XE we will have to call it manually.
    procedure TerminatedSet; override;
{$ifend}
    procedure DoTerminate; override;
  public
    constructor Create(const aXls: TExcelFile; const aProgressFeedback: TProc<integer, string>;
    const aFinalFeedback: TProc<boolean, string>; const aFileName: string; const aAllSheets: boolean);
{$IF CompilerVersion <= 22} //Delphi XE doesn't support TerminatedSet, so sadly in XE we will have to call it manually.
     procedure Cancel;
{$ifend}
end;

implementation

{ TProgressThread }

constructor TProgressThread.Create(const aXls: TExcelFile;
  const aProgressFeedback: TProc<integer, string>;
  const aFinalFeedback: TProc<boolean, string>; const aFileName: string; const aAllSheets: boolean);

begin
  inherited Create(True);
  FreeOnTerminate := false;
  Canceled := false;
  Xls := aXls;
  ProgressFeedback := aProgressFeedback;
  FinalFeedback := aFinalFeedback;
  FileName := aFileName;
  AllSheets := aAllSheets;
end;

procedure TProgressThread.DoTerminate;
var
  msg: string;
  ok: boolean;
begin
  inherited;

  msg := '';
  ok := not Canceled;
  if (Assigned(FatalException)) then
  begin
    ok := false;
    if FatalException is Exception then
    begin
      msg := Exception(FatalException).Message;
    end
    else msg := 'Unexpected error: ' + FatalException.ClassName;
  end;

  if Canceled then msg := 'Operation canceled by the user.';


  //DoTerminate runs in the thread context, not the main thread context as OnTerminate.
  Synchronize(
  procedure
  begin
    FinalFeedback(ok, msg);
  end);
end;

{$IF CompilerVersion > 22} //Delphi XE doesn't support TerminatedSet, so sadly in XE we will have to call it manually.
procedure TProgressThread.TerminatedSet;
begin
  inherited;
  Canceled := true;
end;
{$else}
procedure TProgressThread.Cancel;  //this isn't nice, because we need to remember to call cancel instead of Terminate for our thread. But in XE there is no option.
begin
  Canceled := true;
end;
{$ifend}
end.
