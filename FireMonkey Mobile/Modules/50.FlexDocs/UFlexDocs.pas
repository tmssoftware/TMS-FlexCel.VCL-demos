unit UFlexDocs;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FlexCel.FMXSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render, FlexCel.Pdf, System.Actions,
  FMX.ActnList, FMX.FlexCel.DocExport, FMX.StdCtrls, FMX.Layouts,
  FMX.FlexCel.Preview, FMX.Controls.Presentation;

type
  TFFlexDocs = class(TForm)
    Previewer: TFlexCelPreviewer;
    ToolBar1: TToolBar;
    btnShare: TButton;
    ActionList1: TActionList;
    FlexCelDocExport: TFlexCelDocExport;
    ActionShare: TAction;
    btnOpen: TButton;
    ActionOpen: TAction;
    procedure ActionShareExecute(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFlexDocs: TFFlexDocs;

implementation
uses IOUtils;

{$R *.fmx}

procedure TFFlexDocs.ActionOpenExecute(Sender: TObject);
var
  Template: TResourceStream;
begin
  if (Previewer.Document <> nil) then
  begin
    {$IFNDEF NEXTGEN}
    Previewer.Document.Workbook.Free;
    Previewer.Document.Free;
    {$ENDIF}
    Previewer.Document := nil;
  end;
  Previewer.Document := TFlexCelImgExport.Create();
  Template := TResourceStream.Create(HInstance, 'WeddingBudget', RT_RCDATA);
  try
    Previewer.Document.Workbook := TXlsFile.Create(true);
    Previewer.Document.Workbook.Open(Template);
  finally
    Template.Free;
  end;
  Previewer.InvalidatePreview;
end;

procedure TFFlexDocs.ActionShareExecute(Sender: TObject);
var
  pdf: TFlexCelPdfExport;
  fs: TFileStream;
  TmpFileName: string;
  DestFolder: string;
begin
  if (Previewer.Document = nil) or (Previewer.Document.Workbook = nil) then
  begin
    ShowMessage('Open a file first!');
    exit;
  end;

  DestFolder := TPath.GetDocumentsPath;

  if DestFolder = '' then
  begin
    ShowMessage('This device doesn''t have internal storage');
    exit;
  end;


  TmpFileName := TPath.Combine(DestFolder, 'doc.pdf');
  pdf := TFlexCelPdfExport.Create(Previewer.Document.Workbook, true);
  try
    //Android only has 3 fonts by default, so we can't get too fancy with them.
    //We will replace them all by standard pdf fonts. If we wanted to embed the fonts,
    //we would have to provide an OnGetFontFolder or OnGetFontData event where we provide
    //the ttf data for the fonts.
    pdf.FontMapping := TFontMapping.ReplaceAllFonts;
    fs := TFileStream.Create(TmpFileName, fmCreate);
    try
      pdf.BeginExport(fs);
      pdf.ExportAllVisibleSheets(false, 'Sheets');
      pdf.EndExport;
    finally
      fs.Free;
    end;
  finally
    pdf.Free;
  end;

   // To send the file, we need to define a file provider in AndrodiManifest.xml
  // See https://doc.tmssoftware.com/flexcel/vcl/guides/android-guide.html#sharing-files
   FlexCelDocExport.ExportFile(btnShare, TmpFileName);
end;

end.
