unit UHandlingErrors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, StdCtrls,
  Tabs, Grids,ExtCtrls, ComCtrls, ToolWin, Generics.Collections,
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render;

type
  TFHandlingErrors = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    Actions: TActionList;
    ActionGo: TAction;
    ActionInfo: TAction;
    ActionClose: TAction;
    ToolbarImages: TImageList;
    errorBox: TMemo;
    Panel1: TPanel;
    cbStopOnErrors: TCheckBox;
    cbIgnoreFontErrors: TCheckBox;
    SaveDialog: TSaveDialog;
    ToolbarImages_100Scale: TImageList;
    ToolbarImages_300Scale: TImageList;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionInfoExecute(Sender: TObject);
    procedure ActionGoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    ErrorList: TList<String>;
    ErrorListLock: TObject;
    procedure FlexCelTrace_OnError(const e: TFlexCelErrorInfo);
    procedure DoThings;
  public
  end;

  EMyAbortException = class(Exception);

var
  FHandlingErrors: TFHandlingErrors;

implementation
uses Math, IOUtils, UFlexCelHDPI;

{$R *.dfm}

procedure TFHandlingErrors.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFHandlingErrors.ActionInfoExecute(Sender: TObject);
begin
  ShowMessage('This example shows how to handle non fatal errors using the FlexCelTrace class.');
end;

procedure TFHandlingErrors.FormCreate(Sender: TObject);
begin
  ErrorListLock := TObject.Create;
  ErrorList := TList<string>.Create;
  RegisterForHDPI(Self, nil);
end;

procedure TFHandlingErrors.FormDestroy(Sender: TObject);
begin
  ErrorList.Free;
  ErrorListLock.Free;
end;

procedure TFHandlingErrors.ActionGoExecute(Sender: TObject);
var
  s: string;
begin
 TFlexCelTrace.OnError := FlexCelTrace_OnError;
 ErrorList.Clear;
 errorBox.Text := '';
 try
   DoThings;
 except
   on ex: EMyAbortException do
   begin
     ShowMessage(ex.Message);
   end;
 end;

 if ErrorList.Count = 0 then
    errorBox.Text := 'No errors!' else
  begin
    errorBox.Text := 'There were ' + IntToStr(ErrorList.Count) + ' error messages.';
    for s in ErrorList do
    begin
      errorBox.Lines.Add(s);
    end;
  end;
end;

procedure TFHandlingErrors.DoThings;
var
  xls: TExcelFile;
  r: Int32;
  fmt: TFlxFormat;
  pdf: TFlexCelPdfExport;
begin
  xls := TXlsFile.Create(true);
  try
    xls.NewFile(1, TExcelFileFormat.v2019);
    for r := 1 to 1999 do
    begin
      xls.InsertHPageBreak(r);  //This won't throw an exception here, since FlexCel allows to have more than 1025 page breaks, but at the moment of saving. (since an xls file can't have more than that)
    end;

    xls.SetCellValue(1, 1, 'We have a page break on each row, so this will print/export as one row per page');
    xls.SetCellValue(2, 1, '??? ? ? ? ???? ????');  //Since we leave the font at arial, this won't show when exporting to pdf.
    fmt := xls.GetDefaultFormat;
    fmt.Font.Name := 'Arial Unicode MS';
    xls.SetCellValue(3, 1, '??? ? ? ? ???? ????', xls.AddFormat(fmt));  //this will display fine in the pdf.
    fmt.Font.Name := 'ThisFontDoesntExists';
    xls.SetCellValue(4, 1, 'This font doesn''t exists', xls.AddFormat(fmt));
     //Tahoma doesn't have italic variant. See http://help.lockergnome.com/office/Tahoma-italic-ftopict705661.html
     //You shouldn't normally use Tahoma italics in a document. If we embedded the fonts in this pdf, the fake italics wouldn't work.
    fmt.Font.Name := 'Tahoma';
    fmt.Font.Style := [TFlxFontStyles.Italic];
    xls.SetCellValue(5, 1, 'This is fake italics', xls.AddFormat(fmt));
    if not SaveDialog.Execute then
      exit;

    pdf := TFlexCelPdfExport.Create(xls, true);
    try
      pdf.Export(TPath.ChangeExtension(SaveDialog.FileName, '.pdf'));
    finally
      pdf.Free;
    end;


    xls.Save(SaveDialog.FileName);
  finally
    xls.Free;
  end;
end;

procedure TFHandlingErrors.FlexCelTrace_OnError(const e: TFlexCelErrorInfo);
begin
  if cbIgnoreFontErrors.Checked then
  begin
    case e.Error of
       //Ignore this errors:
      TFlexCelError.PdfFontNotFound, TFlexCelError.PdfGlyphNotInFont, TFlexCelError.PdfFauxBoldOrItalics:
      begin
        exit;
      end;
    end;
  end;

   //If we selected "Stop On Errors" we will abort file generation by throwing an exception that will be
   //catched in the main block.
  if cbStopOnErrors.Checked then
  begin
    raise EMyAbortException.Create(e.Message);
  end;

  //In this case this is a single thread app so locking is not really necessary,
  //but it is a good practice to always lock access to global objects in this error handler.
  //This event handler might me called from more than one thread, and you don't want to mess
  //the object collecting the messages (in this case ErrorList).
  System.TMonitor.Enter(ErrorListLock);
  try
    ErrorList.Add(e.Message);
  finally
    System.TMonitor.Exit(ErrorListLock);
  end;
end;


end.
