unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls,
 {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render, FlexCel.Pdf;

type
  TMainForm = class(TForm)
    btnExportPdf: TButton;
    btnExportExcel: TButton;
    btnExportHTML: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnExportExcelClick(Sender: TObject);
    procedure btnExportPdfClick(Sender: TObject);
    procedure btnExportHTMLClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    function ExportData: TXlsFile;
    procedure SheetSelector_SheetSelectorEntry(const sender: TObject;
      const e: TSheetSelectorEntryEventArgs);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses UFeaturesData, IOUtils, UImagesImpl, ShellAPI;

{$R *.dfm}

function DataPath: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..\');
end;

function ResultPath: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), 'Features')
end;

procedure TMainForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

function TMainForm.ExportData: TXlsFile;
var
  Report: TFlexCelReport;
begin
  Result := TXlsFile.Create(true);
  try
    Result.Open(TPath.Combine(DataPath, 'Features Page.template.xls'));
    Report := TFlexCelReport.Create(true);
    try
      Report.AddTable(FeaturesDataModule);
      Report.SetUserFunction('Images', TImagesImpl.Create(DataPath));
      Report.Run(Result);

    finally
      Report.Free;
    end;

  except
    Result.Free;
    raise;
  end;

end;

procedure TMainForm.btnExportExcelClick(Sender: TObject);
var
  XlsPath: string;
  Xls: TXlsFile;
begin
  XlsPath := TPath.Combine(ResultPath, 'FeaturesFlexCel.xls');
  Xls := ExportData;
  try
    TDirectory.CreateDirectory(ResultPath);
    Xls.Save(XlsPath);
  finally
    Xls.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(XlsPath), nil, nil, SW_SHOWNORMAL);
  end;

end;

procedure TMainForm.btnExportHTMLClick(Sender: TObject);
var
  MainHtmlPath: String;
  Xls: TXlsFile;
  html: TFlexCelHtmlExport;
  SheetSelector: TStandardSheetSelector;
  Sheets: TArray<String>;
begin
  MainHtmlPath := TPath.Combine(ResultPath, 'featuresflexcel.htm');

  Xls := ExportData;
  try
    TDirectory.CreateDirectory(ResultPath);
    html := TFlexCelHtmlExport.Create(Xls, true);
    try
      html.ImageResolution := 192;
      html.ImageBackground := Colors.White; //Since we are not setting html.FixIE6TransparentPngSupport, we must ensure tehre are no transparent images.
      SheetSelector := TStandardSheetSelector.Create([TSheetSelectorPosition.Top]);
      try
        SheetSelector.SheetSelectorEntry := SheetSelector_SheetSelectorEntry;
        SheetSelector.CssGeneral.Main := 'font-family:Verdana;font-size:10pt;';

        html.ExportAllVisibleSheetsAsTabs(ResultPath, 'Features', '.htm', '', '', SheetSelector, false);

        //Rename the first tab so it is "featuresflexcel.htm";
        Sheets := html.GeneratedFiles.GetHtmlFiles();
        TFile.Delete(MainHtmlPath);
        TFile.Move(Sheets[0], MainHtmlPath);
      finally
        SheetSelector.Free;
      end;

    finally
      html.Free;
    end;
  finally
    Xls.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(MainHtmlPath), nil, nil, SW_SHOWNORMAL);
  end;

end;

procedure TMainForm.SheetSelector_SheetSelectorEntry(const sender: TObject; const e: TSheetSelectorEntryEventArgs);
begin
  //We will rename the first sheet, so we need to update the links here.
  if (e.ActiveSheet = 1) then e.Link := 'featuresflexcel.htm';
end;

procedure TMainForm.btnExportPdfClick(Sender: TObject);
var
  PdfPath: String;
  Xls: TXlsFile;
  pdf: TFlexCelPdfExport;
  pdfStream: TFileStream;
begin
  PdfPath := TPath.Combine(ResultPath, 'FeaturesFlexCel.pdf');

  Xls := ExportData;
  try
    TDirectory.CreateDirectory(ResultPath);

    pdf := TFlexCelPdfExport.Create(Xls, true);
    try
      pdfStream := TFileStream.Create(PdfPath, fmCreate);
      try
        pdf.BeginExport(pdfStream);
        pdf.FontMapping := TFontMapping.ReplaceAllFonts;

        pdf.Properties.Subject := 'A list of FlexCel features';
        pdf.Properties.Author := 'TMS Software';
        pdf.Properties.Title := 'List of FlexCel features';
        pdf.PageLayout := TPageLayout.Outlines;
        pdf.ExportAllVisibleSheets(false, 'Features');
        pdf.EndExport();

      finally
        pdfStream.Free;
      end;
    finally
      pdf.Free;
    end;
  finally
    Xls.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(PdfPath), nil, nil, SW_SHOWNORMAL);
  end;

end;

end.
