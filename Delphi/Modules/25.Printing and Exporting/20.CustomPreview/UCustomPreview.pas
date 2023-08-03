unit UCustomPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, ActnList, StdCtrls,
  ComCtrls, ToolWin, ExtCtrls,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render, FlexCel.Preview,
  UPdfExporting, UPrinting, Menus;

type
  TFCustomPreview = class(TForm)
    Actions: TActionList;
    ActionOpen: TAction;
    ActionAutofit: TAction;
    ActionRecalc: TAction;
    ActionClose: TAction;
    OpenDialog: TOpenDialog;
    ToolbarImages: TImageList;
    ActionGridLines: TAction;
    ActionHeadings: TAction;
    ActionPdf: TAction;
    ActionPrint: TAction;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    MainPreview: TFlexCelPreviewer;
    Panel3: TPanel;
    cbAllSheets: TCheckBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Thumbs: TFlexCelPreviewer;
    PanelSheets: TPanel;
    lbSheets: TListBox;
    Splitter2: TSplitter;
    ActionZoom: TAction;
    PanelPrinting: TPanel;
    lblProgressTask: TLabel;
    PrintProgressBar: TProgressBar;
    lblPrintPage: TLabel;
    btnPrintCancel: TButton;
    PanelPdf: TPanel;
    Label1: TLabel;
    lblPdfPage: TLabel;
    PdfProgressBar: TProgressBar;
    btnPdfCancel: TButton;
    ToolbarImagesDisabled: TImageList;
    PdfSaveDialog: TSaveDialog;
    PanelPdfError: TPanel;
    lblPdfError: TLabel;
    btnPdfErrorClose: TButton;
    PanelPrintingError: TPanel;
    lblPrintingError: TLabel;
    btnPrintingErrorClose: TButton;
    PanelPrintingOk: TPanel;
    Label2: TLabel;
    btnPrintOkClose: TButton;
    PanelPdfOk: TPanel;
    Label3: TLabel;
    btnPdfOkClose: TButton;
    btnOpenGeneratedFile: TButton;
    PrintDialog: TPrintDialog;
    AutofitMenu: TPopupMenu;
    NoAutofit1: TMenuItem;
    FittoWidth1: TMenuItem;
    FittoHeight1: TMenuItem;
    FittoPage1: TMenuItem;
    FlowPanel1: TPanel;
    ToolBar2: TToolBar;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolBar4: TToolBar;
    ToolButtonZoom: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    PanelZoom: TPanel;
    TrackBarZoom: TTrackBar;
    btn25: TButton;
    btn50: TButton;
    btn75: TButton;
    btn100: TButton;
    btn150: TButton;
    PanelSelectPage: TPanel;
    edPage: TEdit;
    Label4: TLabel;
    lblTotalPages: TLabel;
    PanelPrint: TPanel;
    btnPrint: TButton;
    ToolbarImages_100Scale: TImageList;
    ToolbarImages_300Scale: TImageList;
    ToolBarAutofit: TToolBar;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionPdfExecute(Sender: TObject);
    procedure btnPrintCancelClick(Sender: TObject);
    procedure btnPdfCancelClick(Sender: TObject);
    procedure btnPdfErrorCloseClick(Sender: TObject);
    procedure btnPrintingErrorCloseClick(Sender: TObject);
    procedure btnPrintOkCloseClick(Sender: TObject);
    procedure btnPdfOkCloseClick(Sender: TObject);
    procedure btnOpenGeneratedFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MainPreviewZoomChanged(Sender: TObject);
    procedure ActionAutofitExecute(Sender: TObject);
    procedure ActionZoomExecute(Sender: TObject);
    procedure NoAutofit1Click(Sender: TObject);
    procedure FittoWidth1Click(Sender: TObject);
    procedure FittoHeight1Click(Sender: TObject);
    procedure FittoPage1Click(Sender: TObject);
    procedure TrackBarZoomChange(Sender: TObject);
    procedure btn25Click(Sender: TObject);
    procedure btn50Click(Sender: TObject);
    procedure btn75Click(Sender: TObject);
    procedure btn100Click(Sender: TObject);
    procedure btn150Click(Sender: TObject);
    procedure ActionRecalcExecute(Sender: TObject);
    procedure cbAllSheetsClick(Sender: TObject);
    procedure lbSheetsClick(Sender: TObject);
    procedure MainPreviewStartPageChanged(Sender: TObject);
    procedure edPageExit(Sender: TObject);
    procedure edPageKeyPress(Sender: TObject; var Key: Char);
    procedure ActionGridLinesExecute(Sender: TObject);
    procedure ActionHeadingsExecute(Sender: TObject);
    procedure TrackBarZoomEnter(Sender: TObject);
    procedure PanelZoomExit(Sender: TObject);
  private
    Xls: TExcelFile;
    ImgExport: TFlexCelImgExport;
    PrintingThread: TPrintingThread;
    PdfThread: TPdfThread;
    DisabledCount: integer;
    ChangingZoom: boolean;
    procedure EnableCommonActions(const Enable: boolean);
    procedure LoadFile(const FileName: string);
    procedure GetPassword(const e: TOnPasswordEventArgs);
    procedure UpdateZoom;
    procedure UpdateAutofitText;
    procedure UpdatePages;
    procedure ChangePages;
    procedure DPIChanged;
    { Private declarations }
  public
    destructor Destroy; override;
    { Public declarations }
  end;

var
  FCustomPreview: TFCustomPreview;

implementation
uses ShellAPI, UPasswordDialog, Types, UFlexCelHDPI;

{$R *.dfm}

procedure TFCustomPreview.FormCreate(Sender: TObject);
begin
  Xls := TXlsFile.Create(1, false);
  Xls.Protection.OnPassword := GetPassword;
  Xls.HeadingColWidth := -1;
  Xls.HeadingRowHeight := -1;
  ImgExport := TFlexCelImgExport.Create(Xls, false);
  ImgExport.AllVisibleSheets := false;
  MainPreview.Document := ImgExport;
  Thumbs.Document := ImgExport;

  if ParamCount > 0 then LoadFile(ParamStr(1)); //allow the app to be called by clicking a file in the explorer.
  RegisterForHDPI(Self, DPIChanged);
end;

destructor TFCustomPreview.Destroy;
begin
  FreeAndNil(PrintingThread);
  FreeAndNil(PdfThread);
  FreeAndNil(ImgExport);
  FreeAndNil(Xls); //after freeing the threads, so we don't free the xls object while they are working.

  inherited;
end;


procedure TFCustomPreview.DPIChanged;
begin
  MainPreview.InvalidatePreview;
end;

procedure TFCustomPreview.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFCustomPreview.GetPassword(const e: TOnPasswordEventArgs);
var
  Pwd: TPasswordDialog;
begin
  Pwd := TPasswordDialog.Create(self);
  try
    Pwd.SetFileName(OpenDialog.FileName);
    if Pwd.ShowModal <> mrOk then exit;
    e.Password := Pwd.Password;
  finally
    FreeAndNil(Pwd);
  end;
end;

procedure TFCustomPreview.ActionOpenExecute(Sender: TObject);
begin
  if not OpenDialog.Execute then exit;
  LoadFile(OpenDialog.FileName);
end;

procedure TFCustomPreview.LoadFile(const FileName: string);
var
  i: Integer;
begin
  PanelPdfOk.Visible := false;
  PanelPdfError.Visible := false;
  PanelPdf.Visible := false;
  PanelPrintingOk.Visible := false;
  PanelPrintingError.Visible := false;
  PanelPrinting.Visible := false;


  OpenDialog.FileName := FileName;
  lbSheets.Items.Clear;

  try
    Xls.Open(FileName);
  except on ex: Exception do
  begin
    EnableCommonActions(false);
    ActionPrint.Enabled := false;
    ActionPdf.Enabled := false;
    ActionZoom.Enabled := false;
    ActionAutofit.Enabled := false;
    ActionOpen.Enabled := true;
    PanelSelectPage.Visible := false;
    Xls.NewFile(1, TExcelFileFormat.v2019);
    Caption := 'Custom Preview';
    ShowMessage('Error opening file: ' + ex.Message);
    MainPreview.InvalidatePreview;
    exit;
  end;
  end;

  for i := 1 to Xls.SheetCount do
  begin
    lbSheets.Items.Add(Xls.GetSheetName(i));
  end;
  lbSheets.ItemIndex := Xls.ActiveSheet - 1;

  EnableCommonActions(true);
  ActionPrint.Enabled := true;
  ActionPdf.Enabled := true;
  ActionZoom.Enabled := true;
  ActionAutofit.Enabled := true;
  Caption := 'Custom Preview: ' + OpenDialog.FileName;
  PanelSelectPage.Visible := true;
  ToolBarAutofit.Left := PanelSelectPage.Left + 10; //Make the panel appear to the left of the toolbar.
  MainPreview.InvalidatePreview;
end;

procedure TFCustomPreview.cbAllSheetsClick(Sender: TObject);
begin
  PanelSheets.Visible := not cbAllSheets.Checked;
  ImgExport.AllVisibleSheets := cbAllSheets.Checked;
  MainPreview.InvalidatePreview();
end;

procedure TFCustomPreview.lbSheetsClick(Sender: TObject);
begin
  if (lbSheets.Items.Count > Xls.SheetCount) or (lbSheets.ItemIndex < 0)  then exit;
  Xls.ActiveSheet := lbSheets.ItemIndex + 1;
  MainPreview.InvalidatePreview();
end;


procedure TFCustomPreview.EnableCommonActions(const Enable: boolean);
begin
  if Enable then Dec(DisabledCount) else Inc(DisabledCount);
  if DisabledCount < 0 then DisabledCount := 0;
  if Enable and (DisabledCount > 0) then exit; //we would be both printing and exporting to pdf, if one finishes, the buttons shouldn't be enabled util the other finishes too.


  ActionOpen.Enabled := Enable;
  ActionGridLines.Enabled := Enable;
  ActionHeadings.Enabled := Enable;
  ActionRecalc.Enabled := Enable;
end;


procedure TFCustomPreview.ActionPdfExecute(Sender: TObject);
begin
  if not PdfSaveDialog.Execute then exit;

  PdfProgressBar.Position := 0;
  lblPdfPage.Caption := 'Initializing';
  EnableCommonActions(false);
  ActionPdf.Enabled := false;
  btnPdfCancel.Enabled := true;
  btnPdfCancel.Caption := 'Cancel';

  PanelPdfOk.Visible := false;
  PanelPdfError.Visible := false;
  PanelPdf.Visible := true;

  FreeAndNil(PdfThread);
  PdfThread := TPdfThread.Create(
    Xls,
    procedure(Progress: integer; Msg: string)
    begin
      PdfProgressBar.Position := Progress;
      lblPdfPage.Caption := Msg;
    end,

    procedure(Ok: boolean; Msg: string)
    begin
      PanelPdf.Visible := false;
      if not Ok then
      begin
        PanelPdfError.Visible := true;
        lblPdfError.Caption := 'Error exporting to PDF: ' + Msg;
      end
      else
      begin
        PanelPdfOk.Visible := true;
      end;
      EnableCommonActions(true);
      ActionPdf.Enabled := true;
    end,
    PdfSaveDialog.FileName,
    cbAllSheets.Checked);

  PdfThread.Start;
end;

procedure TFCustomPreview.ActionPrintExecute(Sender: TObject);
var
  PageCount: integer;
  FirstPage, TotalPages: integer;
begin
  PrintDialog.MinPage := 1;
  PrintDialog.FromPage := 1;

  PageCount := ImgExport.TotalPages;
  PrintDialog.Options := [poPageNums];
  PrintDialog.MaxPage := PageCount;
  PrintDialog.ToPage := PageCount;

  if not PrintDialog.Execute then exit;

  if PrintDialog.PrintRange = prPageNums then
  begin
    FirstPage := PrintDialog.FromPage;
    TotalPages := PrintDialog.ToPage - PrintDialog.FromPage + 1;
  end else
  begin
    FirstPage := 1;
    TotalPages := -1;
  end;

  PrintProgressBar.Position := 0;
  lblPrintPage.Caption := 'Initializing';
  EnableCommonActions(false);
  ActionPrint.Enabled := false;

  btnPrintCancel.Enabled := true;
  btnPrintCancel.Caption := 'Cancel';

  PanelPrintingOk.Visible := false;
  PanelPrintingError.Visible := false;
  PanelPrinting.Visible := true;

  FreeAndNil(PrintingThread);
  PrintingThread := TPrintingThread.Create(
    Xls,
    procedure(Progress: integer; Msg: string)
    begin
      PrintProgressBar.Position := Progress;
      lblPrintPage.Caption := Msg;
    end,

    procedure(Ok: boolean; Msg: string)
    begin
      PanelPrinting.Visible := false;
      if not Ok then
      begin
        PanelPrintingError.Visible := true;
        lblPrintingError.Caption := 'Error printing: ' + Msg;
      end
      else
      begin
        PanelPrintingOk.Visible := true;
      end;
      EnableCommonActions(true);
      ActionPrint.Enabled := true;
    end,
    '',
    cbAllSheets.Checked,
    FirstPage,
    TotalPages);

  PrintingThread.Start;

end;

procedure TFCustomPreview.btnOpenGeneratedFileClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar(PdfSaveDialog.FileName), '', '', SW_SHOWNORMAL);
end;

procedure TFCustomPreview.btnPdfCancelClick(Sender: TObject);
begin
  if PdfThread = nil then //it shouldn't really happen
  begin
    PanelPdf.Visible := false;
    exit;
  end;
  btnPdfCancel.Enabled := false;
  btnPdfCancel.Caption := 'Canceling...';
{$IF CompilerVersion <= 22} //Delphi XE doesn't support TerminatedSet, so sadly in XE we will have to call it manually.
  PdfThread.Cancel;
{$ifend}
  PdfThread.Terminate; //FlexCel will check that we set terminated, and exit as fast as it can.
end;

procedure TFCustomPreview.btnPrintCancelClick(Sender: TObject);
begin
  if PrintingThread = nil then //it shouldn't really happen
  begin
    PanelPrinting.Visible := false;
    exit;
  end;
  btnPrintCancel.Enabled := false;
  btnPrintCancel.Caption := 'Canceling...';
{$IF CompilerVersion <= 22} //Delphi XE doesn't support TerminatedSet, so sadly in XE we will have to call it manually.
  PrintingThread.Cancel;
{$ifend}
  PrintingThread.Terminate; //FlexCel will check that we set terminated, and exit as fast as it can.
end;

procedure TFCustomPreview.btnPdfErrorCloseClick(Sender: TObject);
begin
  PanelPdfError.Visible := false;
end;

procedure TFCustomPreview.btnPrintingErrorCloseClick(Sender: TObject);
begin
  PanelPrintingError.Visible := false;
end;

procedure TFCustomPreview.btnPdfOkCloseClick(Sender: TObject);
begin
  PanelPdfOk.Visible := false;
end;

procedure TFCustomPreview.btnPrintOkCloseClick(Sender: TObject);
begin
  PanelPrintingOk.Visible := false;
end;

procedure TFCustomPreview.UpdatePages;
begin
  edPage.Text := IntToStr(MainPreview.StartPage);
  lblTotalPages.Caption := 'of ' + IntToStr(MainPreview.TotalPages);
end;

procedure TFCustomPreview.ChangePages;
var
  pn: integer;
begin
  if TryStrToInt(Trim(edPage.Text), pn) then MainPreview.StartPage := pn;
end;

procedure TFCustomPreview.MainPreviewStartPageChanged(Sender: TObject);
begin
  UpdatePages;
end;

procedure TFCustomPreview.edPageExit(Sender: TObject);
begin
  ChangePages;
end;

procedure TFCustomPreview.edPageKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ChangePages;
    Key := #0;
  end
  else if Key = #27 then
  begin
    UpdatePages;
    Key := #0;
  end;
end;

procedure TFCustomPreview.UpdateZoom;
begin
  ActionZoom.Caption := IntToStr(Round(MainPreview.Zoom * 100)) + '%';
  if MainPreview.AutofitPreview = TAutofitPreview.None then UpdateAutofitText;
  ChangingZoom := true;
  try
    TrackBarZoom.Position := Round(MainPreview.Zoom * 100);
  finally
    ChangingZoom := false;
  end;
end;

procedure TFCustomPreview.MainPreviewZoomChanged(Sender: TObject);
begin
  UpdateZoom;
end;

procedure TFCustomPreview.ActionZoomExecute(Sender: TObject);
var
  p: TPoint;
begin
  p.X := ToolButtonZoom.Left;
  p.Y := ToolButtonZoom.Top + ToolButtonZoom.Height;
  p := ToolButtonZoom.ClientToParent(p, FCustomPreview);

  PanelZoom.Left := p.X;
  PanelZoom.Top := p.Y;
  PanelZoom.Visible := true;
  ActiveControl := TrackBarZoom;
end;


procedure TFCustomPreview.btn25Click(Sender: TObject);
begin
  MainPreview.Zoom := 0.25;
  PanelZoom.Visible := false;
end;

procedure TFCustomPreview.btn50Click(Sender: TObject);
begin
  MainPreview.Zoom := 0.5;
  PanelZoom.Visible := false;
end;

procedure TFCustomPreview.btn75Click(Sender: TObject);
begin
  MainPreview.Zoom := 0.75;
  PanelZoom.Visible := false;
end;

procedure TFCustomPreview.btn100Click(Sender: TObject);
begin
  MainPreview.Zoom := 1;
  PanelZoom.Visible := false;
end;

procedure TFCustomPreview.btn150Click(Sender: TObject);
begin
  MainPreview.Zoom := 1.5;
  PanelZoom.Visible := false;
end;

procedure TFCustomPreview.TrackBarZoomChange(Sender: TObject);
begin
  if (ChangingZoom) then exit; //avoid recursive calls.
  MainPreview.Zoom := TrackBarZoom.Position / 100.0;
end;

procedure TFCustomPreview.TrackBarZoomEnter(Sender: TObject);
begin
  PanelZoom.SetFocus;
end;

procedure TFCustomPreview.PanelZoomExit(Sender: TObject);
begin
  PanelZoom.Visible := false;
end;

procedure TFCustomPreview.UpdateAutofitText;
begin
  case MainPreview.AutofitPreview of
    TAutofitPreview.None: ActionAutofit.Caption := 'No Autofit';
    TAutofitPreview.Width: ActionAutofit.Caption := 'Fit to Width';
    TAutofitPreview.Height: ActionAutofit.Caption := 'Fit to Height';
    TAutofitPreview.Full: ActionAutofit.Caption := 'Fit to Page';
  end;
end;

procedure TFCustomPreview.ActionAutofitExecute(Sender: TObject);
var
  PopPoint: TPoint;
begin
  if not (Sender is TControl) then exit;
  
  PopPoint.X := (Sender as TControl).Left;
  PopPoint.Y := (Sender as TControl).Top + (Sender as TControl).Height;
  PopPoint := ClientToScreen(PopPoint);
  AutofitMenu.Popup(PopPoint.X, PopPoint.Y);
end;

procedure TFCustomPreview.NoAutofit1Click(Sender: TObject);
begin
  MainPreview.AutofitPreview := TAutofitPreview.None;
  UpdateAutofitText;
end;

procedure TFCustomPreview.FittoWidth1Click(Sender: TObject);
begin
  MainPreview.AutofitPreview := TAutofitPreview.Width;
  UpdateAutofitText;
end;

procedure TFCustomPreview.FittoHeight1Click(Sender: TObject);
begin
  MainPreview.AutofitPreview := TAutofitPreview.Height;
  UpdateAutofitText;
end;


procedure TFCustomPreview.FittoPage1Click(Sender: TObject);
begin
  MainPreview.AutofitPreview := TAutofitPreview.Full;
  UpdateAutofitText;
end;

procedure TFCustomPreview.ActionRecalcExecute(Sender: TObject);
begin
  Xls.Recalc;
  MainPreview.InvalidatePreview;
end;

procedure TFCustomPreview.ActionGridLinesExecute(Sender: TObject);
var
  i: Integer;
  SaveActiveSheet: integer;
begin
  if cbAllSheets.Checked then
  begin
    SaveActiveSheet := Xls.ActiveSheet;
    for i := 1 to Xls.SheetCount do
    begin
      Xls.ActiveSheet := i;
      Xls.PrintGridLines := ActionGridLines.Checked;
    end;
    Xls.ActiveSheet := SaveActiveSheet;

  end
  else
  begin
    Xls.PrintGridLines := ActionGridLines.Checked;
  end;
  MainPreview.InvalidatePreview;
end;

procedure TFCustomPreview.ActionHeadingsExecute(Sender: TObject);
var
  i: Integer;
  SaveActiveSheet: integer;
begin
  if cbAllSheets.Checked then
  begin
    SaveActiveSheet := Xls.ActiveSheet;
    for i := 1 to Xls.SheetCount do
    begin
      Xls.ActiveSheet := i;
      Xls.PrintHeadings := ActionHeadings.Checked;
    end;
    Xls.ActiveSheet := SaveActiveSheet;

  end
  else
  begin
    Xls.PrintHeadings := ActionHeadings.Checked;
  end;
  MainPreview.InvalidatePreview;
end;


end.
