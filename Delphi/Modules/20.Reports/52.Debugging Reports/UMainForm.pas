unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    btnCancel: TButton;
    btnGo: TButton;
    SaveDialog: TSaveDialog;
    LabelDesc: TLabel;
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
uses IOUtils, Generics.Collections;

{$R *.dfm}

type
  TMyData = class
    private
      FKey: integer;
      FData: string;
    public
      constructor Create(const aKey: integer; const aData: string);
      property Key: integer read FKey;
      property Data: string read FData;
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
  MyData: TObjectList<TMyData>;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    Report.SetValue('test', 3);
    Report.SetValue('tagval', 1);
    Report.SetValue('refval', 'l');

    //Here we will add a dummy table with some fantasy values
    MyData := TObjectList<TMyData>.Create;
    try
      MyData.Add(TMyData.Create(5, 'cat'));
      MyData.Add(TMyData.Create(6, 'dog'));
      Report.AddTable<TMyData>('testdb', MyData, TDisposeMode.DonotDispose);

      Report.Run(
        TPath.Combine(GetDataPath, 'Debugging Reports.template.xls'),
        SaveDialog.FileName);
    finally
      MyData.FreE;
    end;
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

{ TMyData }

constructor TMyData.Create(const aKey: integer; const aData: string);
begin
  FKey := aKey;
  FData := aData;
end;

end.
