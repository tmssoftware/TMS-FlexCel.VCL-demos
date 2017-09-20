//---------------------------------------------------------------------------

#pragma hdrstop

#include "UPrinting.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

__fastcall TPrintingThread::TPrintingThread(TExcelFile *aXls, TFeedbackMethod aProgressFeedback,
	  TFinalFeedbackMethod aFinalFeedback, String aFileName, bool aAllSheets)
	  : TProgressThread(aXls, aProgressFeedback, aFinalFeedback, aFileName, aAllSheets)
{
}


void __fastcall TPrintingThread::Execute()
{
  TFlexCelPrintDocument* doc = new TFlexCelPrintDocument(Xls);
  try
  {
	doc->AfterGeneratePage = ShowProgress;

	if (AllSheets)
	{
		doc->BeginPrint();
		try
		{
		  doc->PrintAllVisibleSheets(false);
		}
		__finally
		{
		  doc->EndPrint();
		}
	}
	else
	{
	  doc->Print();
	}
  }
  __finally
  {
	doc->Free();
  }
}

#if (__BORLANDC__ < 0x0650) //XE2 or older
//C++ builder header translations are wrong for XE2 or older
//see http://qc.embarcadero.com/wc/qcmain.aspx?d=42782
void __fastcall TPrintingThread::ShowProgress(const TObject* sender, const TPrintPageEventArgs* e)
#else
void __fastcall TPrintingThread::ShowProgress(TObject* const sender, TPrintPageEventArgs* const e)
#endif
{
  TFlexCelPrintingProgress* Prog = ((TFlexCelPrintDocument*)sender)->Progress;
  int Percent;
  if (Prog->TotalPage == 0) Percent = 100; else Percent = (int)(Prog->Page * 100.0 / Prog->TotalPage);

  ProgressFeedback_percent = Percent;
  ProgressFeedback_msg = String(L"Page ") + IntToStr(Prog->Page) + L" of " + IntToStr(Prog->TotalPage);
  Synchronize(&DoProgressFeedback);
}



