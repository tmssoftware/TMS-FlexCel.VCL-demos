unit UCopyAndPaste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, Clipbrd,
  FlexCel.VCLSupport, FlexCel.Core, FlexCel.XlsAdapter,
  FlexCel.Render;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnNewFile: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    btnPaste: TButton;
    Panel5: TPanel;
    Panel6: TPanel;
    btnCopy: TButton;
    btnOpenFile: TButton;
    OpenDialog: TOpenDialog;
    procedure btnNewFileClick(Sender: TObject);
    procedure btnPasteClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOpenFileClick(Sender: TObject);
  private
    Xls: TXlsFile;

    procedure DoPaste;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Xls);
end;

procedure TForm2.btnNewFileClick(Sender: TObject);
begin
  FreeAndNil(Xls);
  Xls := TXlsFile.Create(1, TExcelFileFormat.v2016, false);
end;

procedure TForm2.btnOpenFileClick(Sender: TObject);
begin
  if not OpenDialog.Execute then exit;

  FreeAndNil(Xls);
  Xls := TXlsFile.Create(OpenDialog.Filename, false);
end;

procedure TForm2.btnPasteClick(Sender: TObject);
begin
  DoPaste;
end;

procedure PasteFromBiff8(const Xls: TExcelFile; const Row, Col: integer);
var
  MyHandle: THandle;
  BiffPtr: pointer;
  BiffSize: Cardinal;
  MemStream: TMemoryStream;
begin
  ClipBoard.Open;
  try
    MyHandle := Clipboard.GetAsHandle(RegisterClipboardFormat('Biff8'));
    BiffPtr := GlobalLock(MyHandle);
    try
      BiffSize := GlobalSize(MyHandle);
      MemStream := TMemoryStream.Create;
      try
        MemStream.Write(BiffPtr^, BiffSize);
        MemStream.Position := 0;
        Xls.PasteFromXlsClipboardFormat(Row, Col, TFlxInsertMode.NoneDown, MemStream);

      finally
        FreeAndNil(MemStream);
      end; //finally
    finally
      GlobalUnlock(MyHandle);
    end;
  finally
    Clipboard.Close;
  end;
end;


procedure TForm2.DoPaste;
begin
  if (Xls = nil) then
  begin
    ShowMessage('Please push the New File button before pasting');
    exit;
  end;

  try
    if Clipboard.HasFormat(RegisterClipboardFormat('Biff8')) then
    begin
      PasteFromBiff8(Xls, 1, 1);
      ShowMessage('NATIVE Data has been pasted at cell A1');
      exit;
    end;

    if Clipboard.HasFormat(CF_TEXT) or Clipboard.HasFormat(CF_UNICODETEXT) then
    begin
      Xls.PasteFromTextClipboardFormat(1, 1, TFlxInsertMode.NoneDown, Clipboard.AsText);
      ShowMessage('TEXT Data has been pasted at cell A1');
      exit;
    end;

    ShowMessage('There is no Excel or Text data on the clipboard.');

  except on ex: Exception do
    begin
      ShowMessage(ex.Message);
      FreeAndNil(Xls);
      Xls := TXlsFile.Create(1, false);
    end;
  end;
end;

procedure CopyToClipboard(const DataFormat: TFlexCelClipboardFormat; const DataStream: TStream);
var
  MyHandle: THandle;
  BiffPtr: pointer;
  FreeHandle: boolean;
  Df: string;
begin
  DataStream.Position := 0;
  FreeHandle := true;
  MyHandle := GlobalAlloc(GMEM_MOVEABLE, DataStream.Size);
  try
    BiffPtr := GlobalLock(MyHandle);
    try
      DataStream.ReadBuffer(BiffPtr^, DataStream.Size);
    finally
      GlobalUnlock(MyHandle);
    end; //finally

    Clipboard.Open;
    try
      //Text format is standard, must be handled differently.
      if DataFormat = TFlexCelClipboardFormat.Text then
      begin
         //Setting CF_UNICODE_TEXT will also set CF_TEXT and CF_OEMTEXT
         Clipboard.SetAsHandle(CF_UNICODETEXT, MyHandle);
      end else
      begin
        //Other formats than TEXT must be registered with RegisterClipboardFormat.
        Df := TFlexCelDataFormats.GetString(DataFormat);
        Clipboard.SetAsHandle(RegisterClipboardFormat(PChar(Df)), MyHandle);
      end;
      FreeHandle := false;       //Note that we dont have to free MyHandle if the clipboard takes care of it
    finally
      Clipboard.Close;
    end; //Finally
  except
    if FreeHandle then GlobalFree(MyHandle);
    raise
  end; //except
end;

procedure TForm2.btnCopyClick(Sender: TObject);
var
  DataStream: TStream;
  cf: TFlexCelClipboardFormat;
begin
  if (Xls = nil) then
  begin
    ShowMessage('Please push the New File button before copying');
    exit;
  end;

  try
    Clipboard.Clear;
    Clipboard.Open; //The other open calls in CopyToCliboard will be ignored.
    try
      for cf := Low(TFlexCelClipboardFormat) to High(TFlexCelClipboardFormat) do
      begin
        DataStream := TMemoryStream.Create;
        try
          Xls.CopyToClipboard(cf, DataStream);
          CopyToClipboard(cf, DataStream);
        finally
          FreeAndNil(DataStream)
        end;
      end;
    finally
      Clipboard.Close;
    end;
    except on ex: Exception do
    begin
      ShowMessage(ex.Message);
    end;
  end;
end;

end.
