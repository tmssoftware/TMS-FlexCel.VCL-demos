unit UAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  pngimage, VCL.FlexCel.Core;

type
  TAboutForm = class(TForm)
    BtnOk: TButton;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LinkLabel1: TLinkLabel;
    lblFlexCelVersion: TLabel;
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation
uses ShellAPI;

{$R *.dfm}

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  lblFlexCelVersion.Caption := 'Using FlexCel ' + FlexCelVersion;
end;

procedure TAboutForm.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShellExecute(0, 'Open', PChar(Link), nil, nil, SW_SHOWNORMAL)
end;

end.
