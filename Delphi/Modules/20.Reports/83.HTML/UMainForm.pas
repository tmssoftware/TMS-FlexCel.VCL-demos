unit UMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Report, FlexCel.Render,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  ShellApi, DataModel,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TMainForm = class(TForm)
    btnCancel: TButton;
    SaveDialog: TSaveDialog;
    Label1: TLabel;
    SaveDialogPdf: TSaveDialog;
    SaveDialogExcel: TSaveDialog;
    btnExportExcel: TButton;
    btnExportPdf: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnExportExcelClick(Sender: TObject);
    procedure btnExportPdfClick(Sender: TObject);
  private
    procedure RunReport(const SaveDialog: TSaveDialog; const ToPdf: boolean);
    function GetDataPath: string;
    procedure LoadData(const TravelItems: TTravelItemList);
    function GetOfflineDataPath: string;
    function GetImage(const FileName: string): TBytes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses XMLDoc, XMLIntf, IOUtils, DemoData, TripSearchResponse;

{$R *.dfm}

procedure TMainForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.btnExportExcelClick(Sender: TObject);
begin
  RunReport(SaveDialogExcel, false);
end;

procedure TMainForm.btnExportPdfClick(Sender: TObject);
begin
  RunReport(SaveDialogPdf, true);
end;

function TMainForm.GetDataPath: string;
begin
  Result := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), '..\..');
end;

function TMainForm.GetOfflineDataPath: string;
begin
  Result := TPath.Combine(GetDataPath, 'OfflineData');
end;

function TMainForm.GetImage(const FileName: string): TBytes;
var
  DiskFileName: string;
  fs: TFileStream;
begin
  DiskFileName := TPath.Combine(GetOfflineDataPath, TPath.GetFileName(FileName));

  fs := TFileStream.Create(DiskFileName, fmOpenRead);
  try
    SetLength(Result, fs.Size);
    if (Length(Result) > 0) then fs.Read(Result[0], Length(Result));
  finally
    fs.Free;
  end;
end;

procedure TMainForm.LoadData(const TravelItems: TTravelItemList);
var
  ResultSet: IXmlResultSetType;
  i: Integer;
begin
  ResultSet := LoadNewDataSet(TPath.Combine(GetOfflineDataPath, 'OfflineData.xml')).ResultSet;

  for i := 0 to ResultSet.Count - 1 do
  begin
    TravelItems.Add(TTravelItem.Create(ResultSet[i].Title, ResultSet[i].Summary, ResultSet[i].Url, GetImage(ResultSet[i].Image.Url)))
  end;

end;

procedure TMainForm.RunReport(const SaveDialog: TSaveDialog; const ToPdf: boolean);
var
  Xls: TXlsFile;
  Pdf: TFlexCelPdfExport;
  Report: TFlexCelReport;
  TravelItems: TTravelItemList;
begin
  if not SaveDialog.Execute then exit;

  Report := TFlexCelReport.Create(true);
  try
    Report.SetValue('Date', Now);
    TravelItems := TTravelItemList.Create;
    try
      LoadData(TravelItems);
      Report.AddTable<TTravelItem>('Result', TravelItems, TDisposeMode.DoNotDispose);

      if (ToPdf) then
      begin
        Xls := TXlsFile.Create(TPath.Combine(GetDataPath, 'HTML.template.xls'));
        try
          Report.Run(Xls);
          Pdf := TFlexCelPdfExport.Create(Xls, true);
          try
            Pdf.Export(SaveDialog.FileName);
          finally
            Pdf.Free;
          end;
        finally
          Xls.Free;
        end;
      end else
      begin
        Report.Run(TPath.Combine(GetDataPath , 'HTML.template') + TPath.GetExtension(SaveDialog.FileName), SaveDialog.FileName);
      end;
    finally
      TravelItems.Free;
    end;
  finally
    Report.Free;
  end;

  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(SaveDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;


end;

end.
