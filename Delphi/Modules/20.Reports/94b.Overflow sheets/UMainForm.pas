unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    btnCancel: TButton;
    btnGo: TButton;
    SaveDialog: TSaveDialog;
    Label1: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
  private
    procedure RunReport;
    function GetDataPath: string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils;

{$R *.dfm}

type
  TMyData = record
    Name: string;

    constructor Create(const aName: string);
  end;

procedure TMainForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnGoClick(Sender: TObject);
begin
  RunReport;

end;

function TMainForm.GetDataPath: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..');
end;


procedure TMainForm.RunReport;
var
  Report: TFlexCelReport;
  Data: TArray<TMyData>;
  i: integer;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    SetLength(Data, 1010);
    for i := 0 to Length(Data) - 1 do
    begin
      Data[i] := TMyData.Create('Customer ' + IntToStr(i));
    end;

    Report.AddTable<TMyData>('data', Data);
    Report.SetValue('split', 40);
    Report.Run(
      TPath.Combine(GetDataPath, 'Overflow Sheets.template.xlsx'),
      SaveDialog.FileName);
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

{ TMyData }

constructor TMyData.Create(const aName: string);
begin
  Name := aName;
end;

end.
