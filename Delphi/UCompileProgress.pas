unit UCompileProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ComCtrls, Registry;

type
  TFCompiler = class(TForm)
    MemoFeedback: TMemo;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
  private
    { Private declarations }
  public
    procedure Compile(const Proj: string; const ExeFile: string; const IsMsBuild: boolean);
  end;

implementation
uses IOUtils;

procedure RunAndWait(const FileName, CurrDir: string; const Parameters: string;
            const Feedback: TProc<string>;
            const ExpectedExit: integer = 0);
const
   ReadBuffer = 2400;
var
  Security : TSecurityAttributes;
  ReadPipe,WritePipe : THandle;
  start : TStartUpInfo;
  ProcessInfo : TProcessInformation;
  Buffer : TBytes;
  BytesRead : DWord;
  Apprunning : DWord;
  ExitCode: DWORD;
  CommandLine : string;
  Avail: DWord;
  PCurrDir: PWideChar;
  LocalText: string;
  PCommandLine: PChar;
  PEnvironment: PChar;
begin
   PEnvironment := nil;

   if CurrDir = '' then PCurrDir := nil else PCurrDir := PWideChar(CurrDir);

   SetLength(Buffer, ReadBuffer + 1);
   LocalText := '';
   ZeroMemory(@Security, SizeOf(TSecurityAttributes));
   ZeroMemory(@ProcessInfo, SizeOf(TProcessInformation));
   Security.nlength := SizeOf(TSecurityAttributes) ;
   Security.binherithandle := true;
   Security.lpsecuritydescriptor := nil;

   if not Createpipe (ReadPipe, WritePipe, @Security, 0) then raise Exception.Create('Error running ' +  FileName);
   try
     FillChar(Start,Sizeof(Start),#0) ;
     start.cb := SizeOf(start) ;
     start.hStdOutput := WritePipe;
     start.hStdError := WritePipe;
     start.hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdinput;
     start.dwFlags := STARTF_USESTDHANDLES + STARTF_USESHOWWINDOW;
     start.wShowWindow := SW_HIDE;

     CommandLine := '"' + FileName + '" ' + Parameters;
     PCommandLine := PChar(CommandLine);
     if not CreateProcess(nil,
           PCommandLine,
           @Security,
           @Security,
           true,
           NORMAL_PRIORITY_CLASS or CREATE_UNICODE_ENVIRONMENT,
           PEnvironment,
           PCurrDir,
           start,
           ProcessInfo)
    then raise Exception.Create('Error running ' +  FileName);

    try
      Repeat
        Apprunning := WaitForSingleObject(ProcessInfo.hProcess, 100);
        Repeat
          PeekNamedPipe(ReadPipe, nil, 0, nil, @Avail, nil);
          if Avail > 0 then
          begin
            BytesRead := 0;
            ReadFile(ReadPipe, Buffer[0], ReadBuffer, BytesRead, nil) ;
            LocalText := LocalText + TEncoding.ASCII.GetString(Buffer, 0, BytesRead);
          end;
        until (Avail = 0) ;

        if Assigned(Feedback) then Feedback(LocalText);
        LocalText:='';

      until (Apprunning <> WAIT_TIMEOUT) ;

      GetExitCodeProcess(ProcessInfo.hProcess, ExitCode);
      if (integer(ExitCode) <> ExpectedExit) then raise Exception.Create('Error running: ' +FileName + '  Exit code: ' + IntToStr(ExitCode));

    finally
      CloseHandle(ProcessInfo.hProcess);
      CloseHandle(ProcessInfo.hThread);
    end;
  finally
    CloseHandle(ReadPipe);
    CloseHandle(WritePipe);
  end;
end;



{$R *.dfm}

{ TFCompiler }

function GetMsBuildParams: string;
var
  BuildConfig, Platform: string;
begin
{$IFDEF WIN64}
  Platform := 'Win64';
{$ELSE}
  Platform := 'Win32';
{$ENDIF}

{$IFDEF DEBUG}
  BuildConfig := 'Debug';
{$ELSE}
  BuildConfig := 'Release';
{$ENDIF}

  Result := ' "/target:Make" "/p:config=' + BuildConfig + '" "/nologo" ';
  Result := Result + ' "/p:platform=' +  Platform + '" ';

end;


procedure TFCompiler.Compile(const Proj: string; const ExeFile: string; const IsMsBuild: boolean);
var
  ExeDir: string;
  Params: string;
begin
  //The file MainDemoCompile.bat is created by a post build event,
  //and it contains the paths to the current delphi installation so we can compile
  //the demos on demand.

  if IsMsBuild then Params := GetMsBuildParams else Params := '';

  MemoFeedback.Text :='';
  try
    ExeDir := TPath.GetDirectoryName(Paramstr(0));
    RunAndWait(TPath.Combine(ExeDir, ExeFile), ExeDir, '"' + Proj + '"' + Params,
    procedure (s: string)
    begin
      Show;
      MemoFeedback.Text := MemoFeedback.Text + s;
      Application.ProcessMessages;
    end
    , 0);

  Except on ex: Exception do
  begin
    ShowMessage(ex.Message);
  end;
  end;
end;

end.
