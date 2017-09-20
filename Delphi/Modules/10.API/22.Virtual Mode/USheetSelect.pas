unit USheetSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TFSheetSelect = class(TForm)
    SheetList: TListBox;
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    procedure SheetListDblClick(Sender: TObject);
  private
  public
    constructor Create(const Sheets: TArray<string>); reintroduce;
    function SelectedSheet: string;
    function SelectedSheetIndex: integer;
  end;

implementation

{$R *.dfm}

{ TFSheetSelect }

constructor TFSheetSelect.Create(const Sheets: TArray<string>);
var
  s: string;
begin
  inherited Create(nil);
  for s in Sheets do
  begin
    SheetList.AddItem(s, nil);
  end;
  SheetList.ItemIndex := 0;
end;

function TFSheetSelect.SelectedSheet: string;
begin
  if SheetList.ItemIndex < 0 then exit('');
  Result := SheetList.Items[SheetList.ItemIndex];
end;

function TFSheetSelect.SelectedSheetIndex: integer;
begin
  Result := SheetList.ItemIndex;

end;

procedure TFSheetSelect.SheetListDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
