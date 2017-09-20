//---------------------------------------------------------------------------

#pragma hdrstop

#include "UPdfExporting.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

__fastcall TPdfThread::TPdfThread(TExcelFile *aXls, TFeedbackMethod aProgressFeedback,
	  TFinalFeedbackMethod aFinalFeedback, String aFileName, bool aAllSheets)
	  : TProgressThread(aXls, aProgressFeedback, aFinalFeedback, aFileName, aAllSheets)
{
}


void __fastcall TPdfThread::Execute()
{
  TFlexCelPdfExport* pdf = new TFlexCelPdfExport(Xls, true);
  try
  {
	pdf->AfterGeneratePage = ShowProgress;

	if (AllSheets)
	{
	  TFileStream* fs = new TFileStream(FileName, fmCreate);
	  try
	  {
		pdf->BeginExport(fs);
		pdf->PageLayout = TPageLayout::Outlines;
		pdf->ExportAllVisibleSheets(false, TPath::GetFileNameWithoutExtension(FileName));
		pdf->EndExport();
	  }
	  __finally
	  {
		fs->Free();
	  }
	}
	else
	{
	  pdf->Export(FileName);
	}
  }
  __finally
  {
	pdf->Free();
  }
}

#if (__BORLANDC__ < 0x0650) //XE2 or older
//C++ builder header translations are wrong for XE2 or older
//see http://qc.embarcadero.com/wc/qcmain.aspx?d=42782
void __fastcall TPdfThread::ShowProgress(const TObject* sender, const TPageEventArgs* e)
#else
void __fastcall TPdfThread::ShowProgress(TObject* const sender, TPageEventArgs* const e)
#endif
{
  TFlexCelPdfExportProgress* Prog = ((TFlexCelPdfExport*)sender)->Progress;
  int Percent;
  if (Prog->TotalPage == 0) Percent = 100; else Percent = (int)(Prog->Page * 100.0 / Prog->TotalPage);

  ProgressFeedback_percent = Percent;
  ProgressFeedback_msg = String(L"Page ") + IntToStr(Prog->Page) + L" of " + IntToStr(Prog->TotalPage);
  Synchronize(&DoProgressFeedback);

}

