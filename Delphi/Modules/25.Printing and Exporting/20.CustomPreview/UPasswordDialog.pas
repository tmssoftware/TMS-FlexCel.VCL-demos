unit UPasswordDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;

type
  TPasswordDialog = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    edPassword: TEdit;
    lblFileName: TLabel;
  public
    function Password: string;
    procedure SetFileName(const FileName: string);
  end;

implementation

{$R *.dfm}

{ TPasswordDialog }

function TPasswordDialog.Password: string;
begin
  Result := edPassword.Text;
end;

procedure TPasswordDialog.SetFileName(const FileName: string);
const
  StartChars = 10;
  MaxChars = 60;
  Ellipsis = ' ... ';
var
  fn: string;
begin
  fn := FileName;
  if Length(fn) > MaxChars then fn := System.Copy(FileName, 1, StartChars) + Ellipsis
      + System.Copy(FileName, Length(FileName) - (MaxChars - StartChars - Length(Ellipsis)), Length(FileName));
  lblFileName.Caption := fn;
end;

end.
