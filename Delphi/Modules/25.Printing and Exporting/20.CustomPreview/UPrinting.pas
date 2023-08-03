unit UPrinting;

interface
uses UProgressThread, SysUtils, FlexCel.Core, FlexCel.Render, Classes;

type
  TPrintingThread = class(TProgressThread)
  private
    FirstPage, TotalPages: integer;
    procedure ShowProgress(const sender: TObject; const e: TPrintPageEventArgs);
  protected
    procedure Execute; override;
  public
    constructor Create(const aXls: TExcelFile; const aProgressFeedback: TProc<integer, string>;
    const aFinalFeedback: TProc<boolean, string>; const aFileName: string;
    const aAllSheets: boolean; const aFirstPage, aTotalPages: integer);
  end;


implementation

{ TPrintingThread }

constructor TPrintingThread.Create(const aXls: TExcelFile;
  const aProgressFeedback: TProc<integer, string>;
  const aFinalFeedback: TProc<boolean, string>; const aFileName: string;
  const aAllSheets: boolean; const aFirstPage, aTotalPages: integer);
begin
  inherited Create(aXls, aProgressFeedback, aFinalFeedback, aFileName, aAllSheets);
  FirstPage := aFirstPage;
  TotalPages := aTotalPages;
end;

procedure TPrintingThread.Execute;
var
  doc: TFlexCelPrintDocument;
begin
  inherited;
  doc := TFlexCelPrintDocument.Create(Xls);
  try
    doc.AfterGeneratePage := ShowProgress;
    if AllSheets then
    begin
      doc.BeginPrint;
      try
        doc.PrintAllVisibleSheets(false, FirstPage, TotalPages);
      finally
        doc.EndPrint;
      end;
    end else
    begin
      doc.BeginPrint;
      try
        doc.PrintSheet(1, -1, FirstPage, TotalPages);
      finally
        doc.EndPrint;
      end;
    end;
  finally
    FreeAndNil(doc);
  end;
end;

procedure TPrintingThread.ShowProgress(const sender: TObject;
  const e: TPrintPageEventArgs);
var
  Prog: TFlexCelPrintingProgress;
  Percent: Integer;
begin
  Prog := (Sender as TFlexCelPrintDocument).Progress;
  if (Prog.TotalPage = 0) then Percent := 100 else Percent := Round(Prog.Page * 100.0 / Prog.TotalPage);

  Synchronize(
  procedure
  begin
    ProgressFeedback(Percent, 'Page ' + IntToStr(Prog.Page) + ' of ' + IntToStr(Prog.TotalPage));
  end);
end;

end.
