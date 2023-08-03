unit URecalculationOfLinkedFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter,
  ShellAPI, ExtCtrls;

type
  TFRecalculationOfLinkedFiles = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CellA1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Cell2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Cell3: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Cell4: TEdit;
    procedure CellA1Change(Sender: TObject);
  private
    function GetValue(const s: string): TCellValue;
    procedure CreateFilesAndRecalculate;
  end;

var
  FRecalculationOfLinkedFiles: TFRecalculationOfLinkedFiles;

implementation
uses IOUtils;
{$R *.dfm}


procedure TFRecalculationOfLinkedFiles.CellA1Change(Sender: TObject);
begin
   //This is a very slow way to do this (recreating the full 3 files each time you type a character)
   //but it is the best for what we want to show. (how to create and recalculate spreadsheets)
   //In a real world example you would keep the created files in memory and just recalculate them
   //when there is a change.
  CreateFilesAndRecalculate;
end;

procedure TFRecalculationOfLinkedFiles.CreateFilesAndRecalculate;
var
  xls1: TXlsFile;
  xls2: TXlsFile;
  xls3: TXlsFile;
  Workspace: TWorkspace;
begin
  xls1 := nil; xls2 := nil; xls3 := nil; Workspace := nil;
   //Set up the files.
  try
    xls1 := TXlsFile.Create;
    xls1.NewFile(1, TExcelFileFormat.v2019);
    xls1.SetCellValue(1, 1, GetValue(CellA1.Text));
    xls1.SetCellValue(2, 1, TFormula.Create('=[Third File.xls]Sheet1!A1 + 7'));
    xls2 := TXlsFile.Create;
    xls2.NewFile(1, TExcelFileFormat.v2019);
    xls2.SetCellValue(1, 1, TFormula.Create('=[First File.xls]Sheet1!A1 * 2'));
    xls3 := TXlsFile.Create;
    xls3.NewFile(1, TExcelFileFormat.v2019);
    xls3.SetCellValue(1, 1, TFormula.Create('=[Second File.xls]Sheet1!A1 * 5'));
     //Create a workspace to recalculate them.
     //In this case, as we know what files we need in advance, we will just add them to the workspace
     //For an example on how to load files on demand, take a look at the chart example in this demo.
    Workspace := TWorkspace.Create;
    Workspace.Add('First File.xls', xls1);
    Workspace.Add('Second File.xls', xls2);
    Workspace.Add('Third File.xls', xls3);
     //Now that the workspace is set, we can recalculate. We could recalc() in the Workspace object or in any of the files in it.
     //The effect is the same, all files will be recalculated.
     //DO NOT RECALCULATE EVERY FILE. EACH TIME YOU CALCULATE ONE, YOU ARE CALCULATING THEM ALL.
    xls1.Recalc;
     //Ok, now it is time to show the results.
    Cell2.Text := xls2.GetCellValue(1, 1).AsFormula.FormulaResult.ToString;
    Cell3.Text := xls3.GetCellValue(1, 1).AsFormula.FormulaResult.ToString;
    Cell4.Text := xls1.GetCellValue(2, 1).AsFormula.FormulaResult.ToString;

    //In tnis example, the workspace doesn't own the TXlsFiles, so we need to free them all.
  finally
    xls1.Free;
    xls2.Free;
    xls3.Free;
    Workspace.Free;
  end;

end;

/// <summary>
/// This method will try to convert a text to a string, and if not possible, return the text.
/// </summary>
/// <param name="s"></param>
/// <returns></returns>
function TFRecalculationOfLinkedFiles.GetValue(const s: string): TCellValue;
var
  R: double;
begin
  if TryStrToFloat(s, R) then exit(R);
  Result := s;
end;

end.
