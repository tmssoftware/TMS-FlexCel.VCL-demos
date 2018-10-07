unit UGettingStarted;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, UPaths,
  {$IFDEF FPC} LResources,{$ENDIF}
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  VCL.FlexCel.Core, FlexCel.XlsAdapter;

type
  TFGettingStarted = class(TForm)
    btnCreateFile: TButton;
    Memo1: TMemo;
    SaveDialog: TSaveDialog;
    procedure btnCreateFileClick(Sender: TObject);
  private
    procedure CreateFile;
    procedure AddData(const Xls: TExcelFile);
    procedure ShowOpenDialog(const Xls: TExcelFile);
  end;

var
  FGettingStarted: TFGettingStarted;

implementation

{$IFNDEF FPC}
{$R *.dfm}
{$ENDIF}

procedure TFGettingStarted.CreateFile;
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

procedure TFGettingStarted.AddData(const Xls: TExcelFile);
var
  PathToImage : string;
  fmt: TFlxFormat;
  XF, XF2: integer;
begin
	//Create a new file. We could also open an existing file with Xls.Open
	Xls.NewFile(1, TExcelFileFormat.v2019);

  //Set some cell values.
  Xls.SetCellValue(1, 1, 'Hello to the world');
  Xls.SetCellValue(2, 1, 3);
  Xls.SetCellValue(3, 1, 2.1);
  Xls.SetCellValue(4, 1, TFormula.Create('=Sum(A2, A3)')); //Note that formulas always are in English. This means use "," to separate arguments, not ";".

	//Get path for images from disk.
  PathToImage := DataFolder  + 'poweredbyflexcel.png';

  //Add a new image on cell F2
  Xls.AddImage(PathToImage,
    TImageProperties_Create(
    TClientAnchor.Create(TFlxAnchorType.MoveAndResize, 2, 0, 6, 0, 5, 0, 8, 0),
    PathToImage, 'My image'));

	//Add a comment on cell a2
	Xls.SetComment(2, 1, 'This is a comment');

	//Custom Format cells a2 and a3
  fmt := Xls.GetDefaultFormat;  //Always initialize the record with an existing format.
  fmt.Font.Name := 'Times New Roman';
  fmt.Font.Color := clRed;
  fmt.FillPattern.Pattern := TFlxPatternStyle.LightDown;
  fmt.FillPattern.FgColor := clBlue;
  fmt.FillPattern.BgColor := clWhite;

	//You can call AddFormat as many times as you want, it will never add a format twice.
	//But if you know the format you are going to use, you can get some extra CPU cycles by
	//calling addformat once and saving the result into a variable.
	XF := Xls.AddFormat(fmt);

  Xls.SetCellFormat(2, 1, XF);
  Xls.SetCellFormat(3, 1, XF);

	fmt.Rotation := 45;
  fmt.Font.Size20 := 400;
  fmt.FillPattern.Pattern := TFlxPatternStyle.Solid;
  XF2 := Xls.AddFormat(fmt);

	//Apply a custom format to all the row.
	Xls.SetRowFormat(1, XF2);

  //Merge cells
	Xls.MergeCells(5, 1, 10, 6);
	//Note how this one merges with the previous range, creating a final range (5,1,15,6)
	Xls.MergeCells(10, 6, 15, 6);


	//Make the page print in landscape or portrait mode
	Xls.PrintLandscape := true;
end;

procedure TFGettingStarted.btnCreateFileClick(Sender: TObject);
begin
  CreateFile;
end;


procedure TFGettingStarted.ShowOpenDialog(const Xls: TExcelFile);
begin
  if not SaveDialog.Execute then exit;
  Xls.Save(SaveDialog.FileName); //No need to delete the file first, since AllowOverWriteFiles is true in XlsAdapter.

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

{$IFDEF FPC}
initialization
{$I UGettingStarted.lrs}
{$ENDIF}
end.
