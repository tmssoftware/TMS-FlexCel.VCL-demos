unit UConsolidatingFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, VCL.FlexCel.Core, FlexCel.XlsAdapter,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellAPI;

type
  TFConsolidatingFiles = class(TForm)
    Memo1: TMemo;
    btnGo: TButton;
    SaveDialog: TSaveDialog;
    cbOnlyData: TCheckBox;
    OpenDialog: TOpenDialog;
    procedure btnGoClick(Sender: TObject);
  private
    function Consolidate(const fileNames: TArray<string>;
      const OnlyData: Boolean): TExcelFile;
  end;

var
  FConsolidatingFiles: TFConsolidatingFiles;

implementation
uses IOUtils;
{$R *.dfm}

procedure TFConsolidatingFiles.btnGoClick(Sender: TObject);
var
  FileNames: TArray<String>;
  XlsOut: TExcelFile;
begin
  if not OpenDialog.Execute then exit;

  FileNames := OpenDialog.Files.ToStringArray;
  if Length(FileNames) <= 0 then
  begin
    ShowMessage('You must select at least one file');
    exit;
  end;

  XlsOut := Consolidate(FileNames, cbOnlyData.Checked);
  try
    if SaveDialog.Execute then
    begin
      XlsOut.Save(SaveDialog.FileName);
      if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
      end;
    end;
  finally
    XlsOut.Free;
  end;
end;

function TFConsolidatingFiles.Consolidate(const fileNames: TArray<string>; const OnlyData: Boolean): TExcelFile;
var
  XlsIn: TExcelFile;
  XlsOut: TExcelFile;
  i: Int32;
  s: string;
begin
  XlsIn := TXlsFile.Create;
  try
    XlsOut := TXlsFile.Create(true);
    try
      XlsOut.NewFile(1);
      if (Length(fileNames) > 1) and cbOnlyData.Checked then
        XlsOut.InsertAndCopySheets(1, 2, Length(fileNames) - 1);

      for i := 0 to Length(fileNames) - 1 do
      begin
        XlsIn.Open(fileNames[i]);

        XlsIn.ConvertFormulasToValues(true);  //If there is any formula referring to other sheet, convert it to value.
         //We could also call an overloaded version of InsertAndCopySheets() that
         //copies many sheets at the same time, so references are kept.
        XlsOut.ActiveSheet := i + 1;
        if OnlyData then
          XlsOut.InsertAndCopyRange(TXlsCellRange.FullRange, 1, 1, 1, TFlxInsertMode.ShiftRangeDown, TRangeCopyMode.All, XlsIn, 1) else
        begin
          XlsOut.InsertAndCopySheets(1, XlsOut.ActiveSheet, 1, XlsIn);
        end;

        s := TPath.GetFileName(fileNames[i]);  //Change sheet name.
        if Length(s) > 32 then
          XlsOut.SheetName := System.Copy(s, 1, 29) + '...' else
          XlsOut.SheetName := s;

      end;

      if not cbOnlyData.Checked then
      begin
        XlsOut.ActiveSheet := XlsOut.SheetCount;
        XlsOut.DeleteSheet(1);  //Remove the empty sheet that came with the workbook.
      end;

      XlsOut.ActiveSheet := 1;
    except
      XlsOut.Free;
      raise;
    end;
  finally
    XlsIn.Free;
  end;
  Result := XlsOut;
end;

end.
