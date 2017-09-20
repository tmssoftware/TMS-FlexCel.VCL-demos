//---------------------------------------------------------------------------

#pragma hdrstop

#include "UProgressThread.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

__fastcall TProgressThread::TProgressThread(TExcelFile *aXls, TFeedbackMethod aProgressFeedback,
	  TFinalFeedbackMethod aFinalFeedback, String aFileName, bool aAllSheets): TThread(true)
{
  FreeOnTerminate = false;
  Canceled = false;
  Xls = aXls;
  ProgressFeedback = aProgressFeedback;
  FinalFeedback = aFinalFeedback;
  FileName = aFileName;
  AllSheets = aAllSheets;

}

void __fastcall TProgressThread::TerminatedSet()
{
  TThread::TerminatedSet();
  Canceled = true;
}
//---------------------------------------------------------------------------

void __fastcall TProgressThread::DoTerminate()
{
  TThread::DoTerminate();
  FinalFeedback_msg = "";
  FinalFeedback_ok = !Canceled;
  if (FatalException != NULL)
  {
	FinalFeedback_ok = false;
	if (dynamic_cast<Exception*>(FatalException))
	{
	  FinalFeedback_msg = ((Exception*)FatalException)->Message;
	}
	else FinalFeedback_msg = "Unexpected error: " + FatalException->ClassName();
  }

  if (Canceled) FinalFeedback_msg = "Operation canceled by the user.";


  //DoTerminate runs in the thread context, not the main thread context as OnTerminate.
  Synchronize(&DoFinalFeedback);

}
//---------------------------------------------------------------------------

void __fastcall TProgressThread::DoFinalFeedback()
{
	FinalFeedback(FinalFeedback_ok, FinalFeedback_msg);
}

void __fastcall TProgressThread::DoProgressFeedback()
{
	ProgressFeedback(ProgressFeedback_percent, ProgressFeedback_msg);
}

