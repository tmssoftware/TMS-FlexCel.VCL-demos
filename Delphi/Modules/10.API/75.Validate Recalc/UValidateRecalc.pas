unit UValidateRecalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, StdCtrls,
  Tabs, Grids,ExtCtrls, ComCtrls, ToolWin,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter;

type
  TFValidateRecalc = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    Actions: TActionList;
    ActionValidateRecalc: TAction;
    ActionCompareWithExcel: TAction;
    ActionInfo: TAction;
    ActionClose: TAction;
    OpenDialog: TOpenDialog;
    ToolbarImages: TImageList;
    report: TMemo;
    LinkedFileDialog: TOpenDialog;
    ToolbarImages_300Scale: TImageList;
    ToolbarImages_100Scale: TImageList;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionValidateRecalcExecute(Sender: TObject);
    procedure ActionInfoExecute(Sender: TObject);
    procedure ActionCompareWithExcelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Work_LoadLinkedFile(const sender: TObject;
      const e: TLoadLinkedFileEventArgs);
    procedure CompareXls(const xls1, xls2: TXlsFile);
    function GetErrorType(const f: TUnsupportedFormulaErrorType): string;
     { Private declarations }
  public
    { Public declarations }
  end;

var
  FValidateRecalc: TFValidateRecalc;

implementation
uses Math, IOUtils, UFlexCelHDPI;

{$R *.dfm}

procedure TFValidateRecalc.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFValidateRecalc.ActionInfoExecute(Sender: TObject);
begin
  ShowMessage('This example will validate the calculations performed by the FlexCel engine.' +
  #$000A'It can do it in 2 different ways:'+
  #$000A'  1) The button "Validate Recalc" will analyze a file, and report if there is anything that FlexCel doesn''t support on it.' +
  #$000A'  2) The button "Compare with Excel" will open a file saved by Excel, recalculate it with FlexCel, compare the values reported by both FlexCel and Excel and report if there are any differences.');
end;

/// <summary>
/// This event is used when there are linked files, to load them on demand.
/// </summary>
/// <param name="sender"></param>
/// <param name="e"></param>
procedure TFValidateRecalc.Work_LoadLinkedFile(const sender: TObject; const e: TLoadLinkedFileEventArgs);
var
  FilePath: String;
begin
  FilePath := TPath.Combine(TPath.GetDirectoryName(OpenDialog.FileName), e.FileName);
  //IMPORTANT: DO NOT USE THIS METHOD IN PRODUCTION IF SECURITY IS IMPORTANT.
  //This method will access any file in your harddisk, as long as it is linked in the spreadhseet, and
  //that could mean an IMPORTANT SECURITY RISK. You should limit the places where the app can search for
  //linked files. Look at the "Recalculating Linked Files" in the PDF API Guide for more information.
  if TFile.Exists(FilePath) then  //If we find the path, just load the file.
  begin
    e.Xls := TXlsFile.Create;
    e.Xls.Open(FilePath);
    exit;
  end;

   //If we couldn't find the file, ask the user for its location.
  LinkedFileDialog.FileName := FilePath;
  if not LinkedFileDialog.Execute then  //if user cancels, e.Xls will be null, so no file will be used and an #errna error will show in the formulas.
    exit;

  e.Xls := TXlsFile.Create;
  try
    e.Xls.Open(LinkedFileDialog.FileName);
  except
    e.Xls.Free;
    e.Xls := nil;
    raise;
  end;
end;


procedure TFValidateRecalc.ActionValidateRecalcExecute(Sender: TObject);
var
  Xls: TXlsFile;
  Work: TWorkspace;
  Usl: TUnsupportedFormulaList;
  i: Int32;
  FileName: string;
  FunctionStr: string;
begin
  if not OpenDialog.Execute then
    exit;

  // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // ////////Code here is only needed if you have linked files. In this example we don't know, so we will use it /////////
  Work := TWorkspace.Create(true);  //Create a workspace
  try
    Xls := TXlsFile.Create;
    try
      Xls.Open(OpenDialog.FileName);
    except
      FreeAndNil(Xls);
      raise;
    end;

    Work.Add(ExtractFileName(OpenDialog.FileName), Xls);  //Add the original file to it
    Work.LoadLinkedFile:= Work_LoadLinkedFile;  //Set up an event to load the linked files.
    // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    report.Text := 'Results on file: ' + OpenDialog.FileName;
    Usl := Work.RecalcAndVerify;
    try
      if Usl.Count = 0 then
      begin
        report.Lines.Add('**********All formulas supported!**********');
        exit;
      end;

      report.Lines.Add('Issues Found:');
      for i := 0 to Usl.Count - 1 do
      begin
        if Usl[i].FileName = '' then FileName := '' else FileName := ('File: ' + Usl[i].FileName) + '  => ';
        report.Lines.Add('     ' + FileName + Usl[i].Cell.CellRef + ': ' + GetErrorType(Usl[i].ErrorType));
        if Usl[i].FunctionName <> '' then
        begin
          FunctionStr := 'Function';
          if Usl[i].ErrorType = TUnsupportedFormulaErrorType.ExternalReference then
            FunctionStr := 'Linked file not found';

          report.Lines.Add(' ->' + FunctionStr + ': ' + Usl[i].FunctionName);
        end;

      end;
    finally
      Usl.Free;
    end;
  finally
    Work.Free;
  end;

end;

procedure TFValidateRecalc.ActionCompareWithExcelExecute(Sender: TObject);
var
  xls1: TXlsFile;
  xls2: TXlsFile;
  Work: TWorkspace;
begin
  if not OpenDialog.Execute then
    exit;
  Work := nil; xls1 := nil;
  try
    ActionCompareWithExcel.Enabled := false;
    ActionValidateRecalc.Enabled := false;
    try
      xls1 := TXlsFile.Create;
      xls2 := TXlsFile.Create;
      try
        xls1.Open(OpenDialog.FileName);
        xls2.Open(openDialog.FileName);
        report.Text := 'Compare with Excel: ' + OpenDialog.FileName;

        // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // ////////Code here is only needed if you have linked files. In this example we don't know, so we will use it /////////
        Work := TWorkspace.Create(true);  //Create a workspace
        Work.Add(TPath.GetFileName(OpenDialog.FileName), xls1);  //Add the original file to it
        Work.LoadLinkedFile:= Work_LoadLinkedFile;  //Set up an event to load the linked files.
         // /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        CompareXls(xls1, xls2);
      finally
        FreeAndNil(xls2);
      end;
    finally
      ActionCompareWithExcel.Enabled := true;
      ActionValidateRecalc.Enabled := true;
    end;
  finally
    if Work <> nil then FreeAndNil(Work) else FreeAndNil(xls1);
    
  end;
end;

procedure TFValidateRecalc.CompareXls(const xls1: TXlsFile; const xls2: TXlsFile);
var
  DiffCount: Int32;
  sheet: Int32;
  aColCount: Int32;
  r: Int32;
  c: Int32;
  f: TFormula;
  ad: TCellAddress;
  f2: TFormula;
  cell1: TCellValue;
  eps: double;
begin
  DiffCount := 0;
  xls1.Recalc;
  for sheet := 1 to xls1.SheetCount do
  begin
    xls1.ActiveSheet := sheet;
    xls2.ActiveSheet := sheet;
    aColCount := xls1.ColCount; //ColCount is slow. We will calculate it only once here.
    for r := 1 to xls1.RowCount do
    for c := 1 to aColCount do
    begin
      cell1 := xls1.GetCellValue(r, c);
      if cell1.IsFormula then
      begin
        f := cell1.AsFormula;
        ad := TCellAddress.Create(r, c);
        f2 := xls2.GetCellValue(r, c).AsFormula;
        if f.FormulaResult = TCellValue.Empty then
          f.FormulaResult := '';

        if f2.FormulaResult = TCellValue.Empty then
          f2.FormulaResult := '';

        eps := 0;
        if f.FormulaResult.IsNumber and f2.FormulaResult.IsNumber then
        begin
          if SameValue(f2.FormulaResult.AsNumber, 0) then
          begin
            if SameValue(f.FormulaResult.AsNumber, 0) then eps := 1;

          end else
            eps := f.FormulaResult.AsNumber / (f2.FormulaResult.AsNumber);

          if Abs(eps - 1) < 0.001 then
            f.FormulaResult := f2.FormulaResult;

        end;

        if f.FormulaResult <> f2.FormulaResult then
        begin
          report.Lines.Add('Sheet:' + xls1.SheetName + ' --- Cell:' + ad.CellRef + ' --- Calculated: '
            + f.FormulaResult.ToString + '    Excel: ' + f2.FormulaResult.ToString
            + '  dif: ' + FloatToStr(eps) + '   formula: ' + f.Text);
          Application.ProcessMessages;

          Inc(DiffCount);
        end;
      end;
    end;
  end;

  report.Lines.Add('Finished Comparing.');
  if DiffCount = 0
    then report.Lines.Add('**********No differences found!**********')
    else report.Lines.Add('  --->Found ' + IntToStr(DiffCount) + ' differences');
end;

procedure TFValidateRecalc.FormCreate(Sender: TObject);
begin
  RegisterForHDPI(Self, nil);
end;

function TFValidateRecalc.GetErrorType(
  const f: TUnsupportedFormulaErrorType): string;
begin
  case f of
    TUnsupportedFormulaErrorType.FormulaTooComplex: exit('FormulaTooComplex');
    TUnsupportedFormulaErrorType.MissingFunction: exit('MissingFunction');
    TUnsupportedFormulaErrorType.FunctionalityNotImplemented: exit('FunctionalityNotImplemented');
    TUnsupportedFormulaErrorType.CircularReference: exit('CircularReference');
    TUnsupportedFormulaErrorType.ExternalReference: exit('ExternalReference');
  end;
  Result := IntToStr(Integer(f));
end;

end.
