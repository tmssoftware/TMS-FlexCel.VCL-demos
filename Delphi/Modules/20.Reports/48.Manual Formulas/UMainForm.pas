unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi, Generics.Collections,
  Controls, Forms, Dialogs, StdCtrls;

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
    procedure SetupMines(const MinesReport: TFlexCelReport);
    procedure AfterGenerateWorkbook(const sender: TObject;
      const e: TGenerateEventArgs);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses IOUtils, DataModel;

{$R *.dfm}

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

procedure TMainForm.SetupMines(const MinesReport: TFlexCelReport);
var
  Mines: TMines;
  i: Integer;
  k: Integer;
  M: TDictionary<integer, boolean>;
begin
  Randomize;
  SetLength(Mines, 9);

  M := TDictionary<integer, boolean>.Create;
  try
    //We'll create 10 mines
    while M.Count < 10 do
    begin
      M.AddOrSetValue(Random(9 * 9 - 1), true);
    end;


    for i := 0 to High(Mines) do
    begin
      Mines[i].CreateCol(9);
      for k := 0 to High(Mines[i].datacol) do if M.ContainsKey(i * 9 + k) then Mines[i].datacol[k].Value := 1;

    end;
  finally
    M.Free;
  end;

  MinesReport.ClearTables;
  MinesReport.AddTable<TColOfMines>('datarow', Mines);

end;

procedure TMainForm.AfterGenerateWorkbook(const sender: TObject; const e: TGenerateEventArgs);
var
  r, c: integer;
begin
  //do some "pretty" up for the final user.
  //we could do this directly on the template, but doing it here allows us to keep the template unprotected and easier to modify.

  e.DataFile.ActiveSheet := 2;
  e.DataFile.SheetVisible := TXlsSheetVisible.Hidden;
  e.DataFile.ActiveSheet := 1;
  e.DataFile.Protection.SetSheetProtection('', TSheetProtectionOptions.Create(true));
  for r := 20 to TFlxConsts.Max_Rows97_2003 do e.DataFile.SetRowHidden(r, true);
  for c := 12 to TFlxConsts.Max_Columns97_2003 do e.DataFile.SetColHidden(c, true);

end;

procedure TMainForm.RunReport;
var
  Report: TFlexCelReport;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    SetupMines(Report);
    Report.AfterGenerateWorkbook := AfterGenerateWorkbook;
    Report.Run(
      TPath.Combine(GetDataPath, 'Manual Formulas.template.xls'),
      SaveDialog.FileName);
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

end.
