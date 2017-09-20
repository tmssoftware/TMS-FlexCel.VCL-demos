unit UProgressDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, UPaths;

type
  TProgressDialog = class(TForm)
    Label1: TLabel;
    lblElapsedTime: TLabel;
    TimerElapsedTime: TTimer;
    procedure TimerElapsedTimeTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    RunningThread: TThread;
    StartTime: TDateTime;

    procedure UpdateStatus;
    { Private declarations }
  public
    procedure ShowProgress(const Thr: TThread);
    { Public declarations }
  end;


implementation

{$R *.dfm}

{ TProgressDialog }

procedure TProgressDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerElapsedTime.Enabled := false;
end;

procedure TProgressDialog.ShowProgress(const Thr: TThread);
begin
  RunningThread := Thr;
  if RunningThread.Finished then exit;
  TimerElapsedTime.Enabled := true;
  StartTime := now;
  ShowModal;
end;

procedure TProgressDialog.TimerElapsedTimeTimer(Sender: TObject);
begin
  UpdateStatus;
end;

procedure TProgressDialog.UpdateStatus;
var
  et: TDateTime;
begin
  if RunningThread.Finished then begin; TimerElapsedTime.Enabled := false; Close; exit; end;
  et := now;
  lblElapsedTime.Caption:= 'Elapsed time: ' + ElapsedTime(et, StartTime);
end;

end.
