unit USQLDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls;

type
  TEnterSQL = class(TForm)
    edSQL: TMemo;
    Label1: TLabel;
    btnCancel: TButton;
    btnOk: TButton;
  private
    { Private declarations }
  public
    function SQL: string;
    { Public declarations }
  end;

var
  EnterSQL: TEnterSQL;

implementation

{$R *.dfm}

{ TEnterSQL }

function TEnterSQL.SQL: string;
begin
  Result := edSQL.Text;
end;

end.
