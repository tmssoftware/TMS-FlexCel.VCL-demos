//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UCustomPreview.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFCustomPreview *FCustomPreview;
//---------------------------------------------------------------------------
__fastcall TFCustomPreview::TFCustomPreview(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::FormCreate(TObject *Sender)
{
  Xls = new TXlsFile(1, false);
  Xls->Protection->OnPassword = GetPassword;
  ImgExport = new TFlexCelImgExport(Xls, false);
  ImgExport->AllVisibleSheets = false;
  MainPreview->Document = ImgExport;
  Thumbs->Document = ImgExport;
  RegisterForHDPI(this, DPIChanged);
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::FormDestroy(TObject *Sender)
{
  PrintingThread->Free();
  PdfThread->Free();
  ImgExport->Free();
  Xls->Free(); //after freeing the threads, so we don't free the xls object while they are working.
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::ActionCloseExecute(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

#if (__BORLANDC__ < 0x0650) //XE2 or older
//C++ builder header translations are wrong for XE2 or older, this should be "TOnPasswordEventArgs * const e".
//see http://qc.embarcadero.com/wc/qcmain.aspx?d=42782
void __fastcall TFCustomPreview::GetPassword(const TOnPasswordEventArgs* e)
{
  TPasswordDialog* Pwd = new TPasswordDialog(NULL);
  try
  {
	Pwd->SetFileName(OpenDialog->FileName);
	if (Pwd->ShowModal() != mrOk) return;

	//We need this cast because the delphi object is a constant pointer, not a pointer to a constant.
	const_cast<TOnPasswordEventArgs*>(e)->Password = Pwd->Password();
  }
  __finally
  {
	Pwd->Free();
  }
}
#else
//XE3 has fixed the bug, now we need to define the event correctly
void __fastcall TFCustomPreview::GetPassword(TOnPasswordEventArgs* const e)
{
  TPasswordDialog* Pwd = new TPasswordDialog(NULL);
  try
  {
	Pwd->SetFileName(OpenDialog->FileName);
	if (Pwd->ShowModal() != mrOk) return;

	e->Password = Pwd->Password();
  }
  __finally
  {
	Pwd->Free();
  }
}
#endif


void __fastcall TFCustomPreview::ActionOpenExecute(TObject *Sender)
{
  if (!(OpenDialog->Execute())) return;
  LoadFile(OpenDialog->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::LoadFile(String FileName)
{
  PanelPdfOk->Visible = false;
  PanelPdfError->Visible = false;
  PanelPdf->Visible = false;
  PanelPrintingOk->Visible = false;
  PanelPrintingError->Visible = false;
  PanelPrinting->Visible = false;


  OpenDialog->FileName = FileName;
  lbSheets->Items->Clear();

  try
  {
	Xls->Open(FileName);
  }
  catch (Exception* ex)
  {
	EnableCommonActions(false);
	ActionPrint->Enabled = false;
	ActionPdf->Enabled = false;
	ActionZoom->Enabled = false;
	ActionAutofit->Enabled = false;
	ActionOpen->Enabled = true;
	PanelSelectPage->Visible = false;
	Xls->NewFile(1, TExcelFileFormat::v2019);
	Caption = "Custom Preview";
	ShowMessage("Error opening file: " + ex->Message);
	MainPreview->InvalidatePreview();
	return;
  }

  for (int i = 1; i <= Xls->SheetCount; i++)
  {
	lbSheets->Items->Add(Xls->GetSheetName(i));
  }
  lbSheets->ItemIndex = Xls->ActiveSheet - 1;

  EnableCommonActions(true);
  ActionPrint->Enabled = true;
  ActionPdf->Enabled = true;
  ActionZoom->Enabled = true;
  ActionAutofit->Enabled = true;
  Caption = "Custom Preview: " + OpenDialog->FileName;
  PanelSelectPage->Visible = true;
  ToolBarAutofit->Left = PanelSelectPage->Left + 10; //Make the panel appear to the left of the toolbar.
  MainPreview->InvalidatePreview();
}


void __fastcall TFCustomPreview::cbAllSheetsClick(TObject *Sender)
{
  PanelSheets->Visible = !cbAllSheets->Checked;
  ImgExport->AllVisibleSheets = cbAllSheets->Checked;
  MainPreview->InvalidatePreview();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::lbSheetsClick(TObject *Sender)
{
  if (lbSheets->Items->Count > Xls->SheetCount) return;
  Xls->ActiveSheet = lbSheets->ItemIndex + 1;
  MainPreview->InvalidatePreview();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::EnableCommonActions(bool Enable)
{
  if (Enable) DisabledCount--; else DisabledCount++;
  if (DisabledCount < 0) DisabledCount = 0;
  if (Enable && DisabledCount > 0) return; //we would be both printing and exporting to pdf, if one finishes, the buttons shouldn't be enabled util the other finishes too.


  ActionOpen->Enabled = Enable;
  ActionGridLines->Enabled = Enable;
  ActionHeadings->Enabled = Enable;
  ActionRecalc->Enabled = Enable;
}

void __fastcall TFCustomPreview::PdfProgressFeedback(int Progress, String Msg)
{
  PdfProgressBar->Position = Progress;
  lblPdfPage->Caption = Msg;
}

void __fastcall TFCustomPreview::PdfFinalFeedback(bool Ok, String Msg)
{
  PanelPdf->Visible = false;
  if (!Ok)
  {
	PanelPdfError->Visible = true;
	lblPdfError->Caption = "Error exporting to PDF: " + Msg;
  }
  else
  {
	PanelPdfOk->Visible = true;
  }

  EnableCommonActions(true);
  ActionPdf->Enabled = true;
}

void __fastcall TFCustomPreview::ActionPdfExecute(TObject *Sender)
{
  if (!(PdfSaveDialog->Execute())) return;

  PdfProgressBar->Position = 0;
  lblPdfPage->Caption = "Initializing";
  EnableCommonActions(false);
  ActionPdf->Enabled = false;
  btnPdfCancel->Enabled = true;
  btnPdfCancel->Caption = "Cancel";

  PanelPdfOk->Visible = false;
  PanelPdfError->Visible = false;
  PanelPdf->Visible = true;

  PdfThread->Free();

  PdfThread = new TPdfThread(
	Xls,
	PdfProgressFeedback,
	PdfFinalFeedback,
	PdfSaveDialog->FileName,
	cbAllSheets->Checked);

  PdfThread->Start();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::PrintProgressFeedback(int Progress, String Msg)
{
  PrintProgressBar->Position = Progress;
  lblPrintPage->Caption = Msg;
}

void __fastcall TFCustomPreview::PrintFinalFeedback(bool Ok, String Msg)
{
  PanelPrinting->Visible = false;
  if (!Ok)
  {
	PanelPrintingError->Visible = true;
	lblPrintingError->Caption = "Error printing: " + Msg;
  }
  else
  {
	PanelPrintingOk->Visible = true;
  }

  EnableCommonActions(true);
  ActionPrint->Enabled = true;
}

void __fastcall TFCustomPreview::ActionPrintExecute(TObject *Sender)
{
  if (!(PrintDialog->Execute())) return;

  PrintProgressBar->Position = 0;
  lblPrintPage->Caption = "Initializing";
  EnableCommonActions(false);
  ActionPrint->Enabled = false;

  btnPrintCancel->Enabled = true;
  btnPrintCancel->Caption = "Cancel";

  PanelPrintingOk->Visible = false;
  PanelPrintingError->Visible = false;
  PanelPrinting->Visible = true;

  PrintingThread->Free();
  PrintingThread = new TPrintingThread(
	Xls,
	&PrintProgressFeedback,
	&PrintFinalFeedback,
	"",
	cbAllSheets->Checked);

  PrintingThread->Start();

}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btnOpenGeneratedFileClick(TObject *Sender)
{
  ShellExecute(0, L"open", PdfSaveDialog->FileName.c_str(), L"", L"", SW_SHOWNORMAL);
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btnPdfCancelClick(TObject *Sender)
{
  if (PdfThread == NULL) //it shouldn't really happen
  {
	PanelPdf->Visible = false;
	return;
  }
  btnPdfCancel->Enabled = false;
  btnPdfCancel->Caption = "Canceling...";
  PdfThread->Terminate(); //FlexCel will check that we set terminated, and exit as fast as it can.
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btnPrintCancelClick(TObject *Sender)
{
  if (PrintingThread == NULL) //it shouldn't really happen
  {
	PanelPrinting->Visible = false;
	return;
  }
  btnPrintCancel->Enabled = false;
  btnPrintCancel->Caption = "Canceling...";
  PrintingThread->Terminate(); //FlexCel will check that we set terminated, and exit as fast as it can.
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btnPdfErrorCloseClick(TObject *Sender)
{
  PanelPdfError->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btnPrintingErrorCloseClick(TObject *Sender)
{
  PanelPrintingError->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btnPrintOkCloseClick(TObject *Sender)
{
  PanelPrintingOk->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btnPdfOkCloseClick(TObject *Sender)
{
  PanelPdfOk->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::UpdatePages()
{
  edPage->Text = IntToStr(MainPreview->StartPage);
  lblTotalPages->Caption = "of " + IntToStr(MainPreview->TotalPages);
}

void __fastcall TFCustomPreview::ChangePages()
{
  int pn;
  if (TryStrToInt(Trim(edPage->Text), pn)) MainPreview->StartPage = pn;
}

void __fastcall TFCustomPreview::DPIChanged()
{
  MainPreview->InvalidatePreview();
}

void __fastcall TFCustomPreview::MainPreviewStartPageChanged(TObject *Sender)
{
  UpdatePages();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::edPageExit(TObject *Sender)
{
  ChangePages();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::edPageKeyPress(TObject *Sender, System::WideChar &Key)

{
  if (Key == (char)13)
  {
	ChangePages();
	Key = (char)0;
  }
  else if (Key == (char)27)
  {
	UpdatePages();
	Key = (char)0;
  }
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::UpdateZoom()
{
  ActionZoom->Caption = IntToStr((int)(MainPreview->Zoom * 100)) + "%";
  if (MainPreview->AutofitPreview == TAutofitPreview::None) UpdateAutofitText();
  ChangingZoom = true;
  __try
  {
	TrackBarZoom->Position = (int)(MainPreview->Zoom * 100);
  }
  __finally
  {
	ChangingZoom = false;
  }
}
void __fastcall TFCustomPreview::MainPreviewZoomChanged(TObject *Sender)
{
   UpdateZoom();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::ActionZoomExecute(TObject *Sender)
{
  System::Types::TPoint p;
  p.X = ToolButtonZoom->Left;
  p.Y = ToolButtonZoom->Top + ToolButtonZoom->Height;
  p = ToolButtonZoom->ClientToParent(p, FCustomPreview);

  PanelZoom->Left = p.X;
  PanelZoom->Top = p.Y;
  PanelZoom->Visible = true;
  ActiveControl = TrackBarZoom;

}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btn25Click(TObject *Sender)
{
  MainPreview->Zoom = 0.25;
  PanelZoom->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btn50Click(TObject *Sender)
{
  MainPreview->Zoom = 0.50;
  PanelZoom->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btn75Click(TObject *Sender)
{
  MainPreview->Zoom = 0.75;
  PanelZoom->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btn100Click(TObject *Sender)
{
  MainPreview->Zoom = 1;
  PanelZoom->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::btn150Click(TObject *Sender)
{
  MainPreview->Zoom = 1.5;
  PanelZoom->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::TrackBarZoomChange(TObject *Sender)
{
  if (ChangingZoom) return; //avoid recursive calls.
  MainPreview->Zoom = TrackBarZoom->Position / 100.0;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::TrackBarZoomEnter(TObject *Sender)
{
  PanelZoom->SetFocus();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::PanelZoomExit(TObject *Sender)
{
  PanelZoom->Visible = false;
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::UpdateAutofitText()
{
  switch (MainPreview->AutofitPreview)
  {
	case TAutofitPreview::None: ActionAutofit->Caption = "No Autofit"; break;
	case TAutofitPreview::Width: ActionAutofit->Caption = "Fit to Width"; break;
	case TAutofitPreview::Height: ActionAutofit->Caption = "Fit to Height"; break;
	case TAutofitPreview::Full: ActionAutofit->Caption = "Fit to Page"; break;
  }
}


void __fastcall TFCustomPreview::ActionAutofitExecute(TObject *Sender)
{
  if (!(dynamic_cast<TControl* >(Sender))) return;

  System::Types::TPoint PopPoint;
  PopPoint.X = ((TControl*)Sender)->Left;
  PopPoint.Y = ((TControl*)Sender)->Top + ((TControl*)Sender)->Height;
  PopPoint = ClientToScreen(PopPoint);
  AutofitMenu->Popup(PopPoint.X, PopPoint.Y);

}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::NoAutofit1Click(TObject *Sender)
{
  MainPreview->AutofitPreview = TAutofitPreview::None;
  UpdateAutofitText();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::FittoWidth1Click(TObject *Sender)
{
  MainPreview->AutofitPreview = TAutofitPreview::Width;
  UpdateAutofitText();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::FittoHeight1Click(TObject *Sender)
{
  MainPreview->AutofitPreview = TAutofitPreview::Height;
  UpdateAutofitText();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::FittoPage1Click(TObject *Sender)
{
  MainPreview->AutofitPreview = TAutofitPreview::Full;
  UpdateAutofitText();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::ActionRecalcExecute(TObject *Sender)
{
  Xls->Recalc();
  MainPreview->InvalidatePreview();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::ActionGridLinesExecute(TObject *Sender)
{
  if (cbAllSheets->Checked)
  {
	int SaveActiveSheet = Xls->ActiveSheet;
	for (int i = 1; i <= Xls->SheetCount; i++)
	{
	  Xls->ActiveSheet = i;
	  Xls->PrintGridLines = ActionGridLines->Checked;
	}
	Xls->ActiveSheet = SaveActiveSheet;
  }
  else
  {
	Xls->PrintGridLines = ActionGridLines->Checked;
  }
  MainPreview->InvalidatePreview();
}
//---------------------------------------------------------------------------

void __fastcall TFCustomPreview::ActionHeadingsExecute(TObject *Sender)
{
  if (cbAllSheets->Checked)
  {
	int SaveActiveSheet = Xls->ActiveSheet;
	for (int i = 1; i <= Xls->SheetCount; i++)
	{
	  Xls->ActiveSheet = i;
	  Xls->PrintHeadings = ActionHeadings->Checked;
	}
	Xls->ActiveSheet = SaveActiveSheet;
  }
  else
  {
	Xls->PrintHeadings = ActionHeadings->Checked;
  }
  MainPreview->InvalidatePreview();
}
//---------------------------------------------------------------------------


