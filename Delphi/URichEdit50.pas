unit URichEdit50;

interface
uses ComCtrls, Controls, Messages, RichEdit;

type


//Rich edit supporting hyperlinks. Available since XP SP1.
TRichEdit50 = class(TRichEdit)
protected
  procedure CreateParams(var Params: TCreateParams); override;
  procedure CreateWnd; override;
  procedure WndProc(var Message: TMessage); override;

end;

implementation
uses SysUtils, Windows, ShellAPI;

var
  FRichEditModule: THandle;

{ TRichEdit50 }

procedure TRichEdit50.CreateParams(var Params: TCreateParams);
const

  RichEditClassName = 'RichEdit50W';
  RichEdit50ModuleName = 'MsftEdit.dll';
begin
  if FRichEditModule = 0 then
  begin
    FRichEditModule := LoadLibrary(RichEdit50ModuleName);
    if FRichEditModule <= HINSTANCE_ERROR then FRichEditModule := 0;
  end;
  inherited CreateParams(Params);

  CreateSubClass(Params, RichEditClassName);
end;

procedure TRichEdit50.CreateWnd;
var
  Mask: DWORD;
begin
  inherited;
  Mask := SendMessage(Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(Handle, EM_SETEVENTMASK, 0, Mask or ENM_LINK);
  SendMessage(Handle, EM_SETMARGINS, EC_LEFTMARGIN, 40);
end;


procedure TRichEdit50.WndProc(var Message: TMessage);
type
  PENLINK = ^ENLINK;
var
  p: PENLINK;
  str: string;
  tr: TEXTRANGE;
begin
  inherited;
  case Message.Msg of
    CN_NOTIFY: begin
     if TWMNotify(Message).NMHdr.code = EN_LINK then
      begin
      P := PENLINK(Message.LParam);
        if p.msg = WM_LBUTTONDOWN then
        begin
          SetLength(str, p.chrg.cpMax - p.chrg.cpMin);
          tr.chrg := p.chrg;
          tr.lpstrText := PChar(str);
          SendMessage(Handle, EM_GETTEXTRANGE, 0, LPARAM(@tr));
          ShellExecute(Handle, nil, PChar(str), nil, nil, SW_SHOWNORMAL);
        end;
      end;
    end;
  end;
end;

initialization

finalization
  if FRichEditModule <> 0 then
    FreeLibrary(FRichEditModule);

end.

