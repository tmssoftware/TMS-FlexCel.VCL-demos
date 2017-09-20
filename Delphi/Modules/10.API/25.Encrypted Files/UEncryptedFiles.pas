unit UEncryptedFiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, UPaths,
  {$IFDEF FPC} LResources,{$ENDIF}
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  VCL.FlexCel.Core, FlexCel.XlsAdapter;

type
  TFEncryptedFiles = class(TForm)
    btnCreateFile: TButton;
    Memo1: TMemo;
    SaveDialog: TSaveDialog;
    procedure btnCreateFileClick(Sender: TObject);
  private
    procedure CreateFile;
    procedure AddData(const Xls: TExcelFile);
    procedure ShowOpenDialog(const Xls: TExcelFile);
    procedure GetPassword(const e: TOnPasswordEventArgs);
  end;

var
  FEncryptedFiles: TFEncryptedFiles;

implementation
uses IOUtils, UPasswordDlg;

{$R *.dfm}

procedure TFEncryptedFiles.CreateFile;
var
  Xls: TExcelFile;
begin
  Xls := TXlsFile.Create(true);
  try
    AddData(Xls);
    ShowOpenDialog(Xls);
  finally
    FreeAndNil(Xls);
  end;
end;

procedure TFEncryptedFiles.GetPassword(const e: TOnPasswordEventArgs);
var
  Pwd: TPasswordDlg;
begin  //The event that will actually provide the password to open the empty form.
  Pwd := TPasswordDlg.Create(self);
  try
    e.Password := '';
    if Pwd.ShowModal <> mrOk then exit;
    e.Password := Pwd.Password;
  finally
    Pwd.Free;
  end;
end;

procedure TFEncryptedFiles.AddData(const Xls: TExcelFile);
var
  Names: TArray<String>;
  Quantities: Int32Array;
  i: Int32;
begin
  // On this demo we will fill data on an existing file with the api, starting with an encrypted file holding the starting formatting.
  // Declare some data for the chart.
  Names := TArray<String>.Create('Dog', 'Cat', 'Cow', 'Horse', 'Fish');
  Quantities := Int32Array.Create($7B, $C8, $96, 0, $B4);

   // We will use the OnPassword event here to show how to
   // open a file if you don't know a priory if it is encrypted or not.
   // If you already knew the file was encrypted, (as in this case)you could use:
   // xls.Protection.OpenPassword := '42';
  xls.Protection.OnPassword := GetPassword;
  xls.Open(TPath.Combine(DataFolder, 'EmptyForm.xls'));

  // Insert rows so the chart range grows. On this case we assume the data is at least 2 rows long. If not, we should handle
  // the case and do a xls.DeleteRange.
  xls.InsertAndCopyRange(TXlsCellRange.Create(1, 1, 1, 2), 5, 1, Length(Names) - 2, TFlxInsertMode.ShiftRangeDown, TRangeCopyMode.None);
   // Fill the data.
  for i := 0 to Length(Names) - 1 do
  begin
    xls.SetCellValue(4 + i, 1, Names[i]);
    xls.SetCellValue(4 + i, 2, Quantities[i]);
  end;

   // Set a new password for opening.
  xls.Protection.OpenPassword := '43';
  xls.Protection.SetModifyPassword('43', false, 'Ford Prefect');
end;

procedure TFEncryptedFiles.btnCreateFileClick(Sender: TObject);
begin
  CreateFile;
end;


procedure TFEncryptedFiles.ShowOpenDialog(const Xls: TExcelFile);
begin
  if not SaveDialog.Execute then exit;
  Xls.Save(SaveDialog.FileName); //No need to delete the file first, since AllowOverWriteFiles is true in XlsAdapter.

  if MessageDlg('Do you want to open the generated file? (password is 43)', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

end.
