unit UMailDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, StrUtils;

type
  TMailDialog = class(TForm)
    edFrom: TLabeledEdit;
    edTo: TLabeledEdit;
    edSubject: TLabeledEdit;
    edOutServer: TLabeledEdit;
    btnSend: TButton;
    btnCancel: TButton;
    Mailer: TIdSMTP;
    Msg: TIdMessage;
    edPort: TLabeledEdit;
    edUserName: TLabeledEdit;
    edPassword: TLabeledEdit;
    cbUseTLS: TCheckBox;
    SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    procedure btnSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edFromExit(Sender: TObject);
    procedure cbUseTLSClick(Sender: TObject);
  private
    OriginalTo, OriginalFrom, OriginalServer: string;
    function ValidateFields: Boolean;
    procedure FillServer;
    procedure FillMsgBody;
    { Private declarations }
  public
    GetMHTML: TFunc<string>;
    { Public declarations }
  end;

var
  MailDialog: TMailDialog;

implementation

{$R *.dfm}

procedure TMailDialog.cbUseTLSClick(Sender: TObject);
begin
  edPort.Visible := cbUseTLS.Checked;
  edUserName.Visible := cbUseTLS.Checked;
  edPassword.Visible := cbUseTLS.Checked;
end;

procedure TMailDialog.edFromExit(Sender: TObject);
begin
 if (OriginalTo = edTo.Text) and (OriginalFrom <> edFrom.Text) then
  begin
    edTo.Text := edFrom.Text;
  end;

  FillServer;
  if edUserName.Text = '' then edUserName.Text := edFrom.Text;

end;

procedure TMailDialog.FillServer;
var
  AtPos: Int32;
  Server: String;
begin
  if (OriginalServer = edOutServer.Text) and (OriginalFrom <> edFrom.Text) then
  begin
    AtPos := Pos('@', edFrom.Text);
    if AtPos > 1 then
    begin
      Server := copy(edFrom.Text, AtPos + 1, Length(edFrom.Text));
      edOutServer.Text := 'smtp.' + Server;
    end;

  end;

end;

procedure TMailDialog.FormCreate(Sender: TObject);
begin
  OriginalTo := edTo.Text;
  OriginalFrom := edFrom.Text;
  OriginalServer := edOutServer.Text;
end;

function TMailDialog.ValidateFields: Boolean;
begin
  if OriginalFrom = edFrom.Text then
  begin
    ShowMessage('Please change the ''From'' field to the user you are using to send the email');
    edFrom.SetFocus;
    exit(false);
  end;

  if OriginalTo = edTo.Text then
  begin
    ShowMessage('Please change the ''TO'' field to the user you want to send the email');
    edTo.SetFocus;
    exit(false);
  end;

  if OriginalServer = edOutServer.Text then
  begin
    ShowMessage('Please change the ''Outgoing Mail Server'' field to the pop3 server you will use to send the email.');
    edOutServer.SetFocus;
    exit(false);
  end;

  Result := true;
end;

procedure TMailDialog.FillMsgBody;
var
  p, p0: integer;
  s: string;
begin
  //FlexCel returns both headers and body, as this is the MHTML standard. We need to separate
  //them to add headers to headers and body to body. Maybe other smtp component different from
  //indy could allow to just write the raw block.

  s := GetMHTML;
  p0 := 1;

  while true do
  begin
    p := PosEx(#13#10, s, p0);
    if (p < 1) or(p >= Length(s) - 3) then exit;
    Msg.Headers.Add(Copy(s, p0, p - p0));
    p0 := p + 2;
    if s[p0] = #13 then break; //double enter.
  end;

  Msg.Body.Text := copy(s, p0 + 2, Length(s));

end;

procedure TMailDialog.btnSendClick(Sender: TObject);
begin
 if not ValidateFields then
    exit;

  if MessageDlg('Now we will try to send the email using the server ''' + edOutServer.Text +
     ''''#$000A + 'Note that this is a very simple implementation, and it might not work if the SMTP server needs to login. GMail accounts should work.',
     mtInformation,
     [mbOk, mbCancel], 0) <> mrOK then exit;

  Msg.Clear;
  Msg.NoEncode := true;
  Msg.Headers.Add('From: ' +  Trim(edFrom.Text));
  Msg.Recipients.Add.Text := Trim(edTo.Text);
  Msg.Headers.Add('Subject: ' + Trim(edSubject.Text));

  FillMsgBody;
  Mailer.Host := Trim(edOutServer.Text);
  if cbUseTLS.Checked then
  begin
    Mailer.Port := StrToInt(Trim(edPort.Text));
    Mailer.Username := Trim(edUserName.Text);
    Mailer.Password := Trim(edPassword.Text);
    Mailer.UseTLS := TIdUseTLS.utUseExplicitTLS;
  end
  else
  begin
    Mailer.Port := 25;
    Mailer.Username := '';
    Mailer.Password := '';
    Mailer.UseTLS := TIdUseTLS.utNoTLSSupport;
  end;


  try
    Mailer.Connect;
    try
      Mailer.Send(Msg);
    finally
      Mailer.Disconnect;
    end;
  except
    on ex: Exception do
      begin
        ShowMessage('Error trying to send the message: ' + ex.Message);
        exit;
      end;
  end;
  ShowMessage('Message has been sent. Please verify your JUNK folder or any filters, since it might be filtered as spam');
  ModalResult := mrOk;
end;

end.
