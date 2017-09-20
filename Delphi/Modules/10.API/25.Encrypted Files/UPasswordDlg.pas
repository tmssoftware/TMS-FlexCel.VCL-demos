unit UPasswordDlg;

interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    edPassword: TEdit;
    Label2: TLabel;
  public
    function Password: string;
  end;

implementation

{$R *.dfm}

{ TPasswordDialog }

function TPasswordDlg.Password: string;
begin
  Result := edPassword.Text;
end;

end.
