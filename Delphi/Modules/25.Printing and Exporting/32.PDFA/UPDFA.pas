unit UPDFA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ComCtrls, ToolWin, ImgList,
  {$if CompilerVersion >= 23.0} System.UITypes, {$IFEND}
  VCL.FlexCel.Core, FlexCel.XlsAdapter, FlexCel.Render, FlexCel.Pdf,
  ShellAPI, StdCtrls, ActnList;

type
  TFPDFA = class(TForm)
    Actions: TActionList;
    ActionExportAsPdf: TAction;
    ActionClose: TAction;
    ToolbarImages: TImageList;
    ExportDialog: TSaveDialog;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ToolButton6: TToolButton;
    cbPdfType: TComboBox;
    cbEmbed: TCheckBox;
    ToolbarImages_100Scale: TImageList;
    ToolbarImages_300Scale: TImageList;
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionExportAsPdfExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CreateFile(const FileName: String; const EmbedSource: Boolean;
      const PdfType: TPdfType; const TagMode: TTagMode);
    function CreateSourceFile: TExcelFile;
    function GetPdfType: TPdfType;
    function GetTagMode: TTagMode;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPDFA: TFPDFA;

implementation
uses UFlexCelHDPI;

{$R *.dfm}

procedure TFPDFA.ActionCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPDFA.ActionExportAsPdfExecute(Sender: TObject);
var
  EmbedSource: Boolean;
  PdfType: TPdfType;
  TagMode: TTagMode;
begin
  EmbedSource := cbEmbed.Checked;
  PdfType := GetPdfType;
  TagMode := GetTagMode;
  if EmbedSource then
  begin
    if (PdfType <> TPdfType.PDFA3) and (PdfType <> TPdfType.Standard) then
    begin
      ShowMessage('To embed a file, you need to use standard PDF or PDF/A3');
      exit;
    end;

  end;

  if not ExportDialog.Execute then
  begin
    exit;
  end;

  CreateFile(exportDialog.FileName, EmbedSource, PdfType, TagMode);
  if MessageDlg('Do you want to open the generated file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    ShellExecute(0, 'open', PCHAR(ExportDialog.FileName), nil, nil, SW_SHOWNORMAL);
  end;

end;


function TFPDFA.GetPdfType: TPdfType;
begin
  case cbPdfType.ItemIndex of
    0:
    begin
      exit(TPdfType.Standard);
    end;
    1, 2:
    begin
      exit(TPdfType.PDFA1);
    end;
    3, 4:
    begin
      exit(TPdfType.PDFA2);
    end;
    5, 6:
    begin
      exit(TPdfType.PDFA3);
    end;
  end;
  raise Exception.Create('Unexpected PDF type');
end;

function TFPDFA.GetTagMode: TTagMode;
begin
  case cbPdfType.ItemIndex of
    0, 1, 3, 5:
    begin
      exit(TTagMode.Full);
    end;
  end;
  Result := TTagMode.None;
end;

procedure TFPDFA.CreateFile(const FileName: String; const EmbedSource: Boolean; const PdfType: TPdfType; const TagMode: TTagMode);
var
  xls: TExcelFile;
  pdf: TFlexCelPdfExport;
begin
  xls := CreateSourceFile;
  try
    pdf := TFlexCelPdfExport.Create(xls, true);
    try
      pdf.PdfType := PdfType;
      pdf.TagMode := TagMode;
      if EmbedSource then
      begin
        pdf.AttachFile('Report.xlsx', TStandardMimeType.Xlsx,
          'This is the source file used to create the PDF', Now,
          TPdfAttachmentKind.Source,
          procedure (const attachWriter: TPdfAttachmentWriter)
          var
            ms: TMemoryStream;
          begin
            ms := TMemoryStream.Create;
            try
              xls.Save(ms, TFileFormats.Xlsx);
              ms.Position := 0;
              attachWriter.Write(ms);
            finally
              ms.Free;
            end;
          end);
      end;

      pdf.Export(FileName);
    finally
      pdf.Free;
    end;
  finally
    xls.Free;
  end;
end;

function TFPDFA.CreateSourceFile: TExcelFile;
var
  xls: TExcelFile;
begin
  xls := TXlsFile.Create;
  try
    xls.NewFile(1, TExcelFileFormat.v2019);
    xls.SetCellValue(1, 1, 'This is a test from FlexCel!');
    xls.SetCellValue(2, 1, 'Here is some emoji to show unicode surrogate support: '#$D83D#$DC1C#$D83D#$DC0F);
    xls.SetCellValue(3, 1, 'You might need a font able to show emoji for those characters to show');
    xls.SetCellValue(4, 1, 'Windows 7 and 8 have SegoeUISymbol, which can show them and is used automatically by FlexCel.');
    Result := xls;
  except
    xls.Free;
    raise;
  end;
end;

procedure TFPDFA.FormCreate(Sender: TObject);
begin
  RegisterForHDPI(Self, nil);
end;

end.
