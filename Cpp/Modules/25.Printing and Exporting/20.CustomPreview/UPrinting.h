//---------------------------------------------------------------------------

#ifndef UPrintingH
#define UPrintingH
//---------------------------------------------------------------------------
#include "UProgressThread.h"
#include "FlexCel.Render.hpp"
//---------------------------------------------------------------------------
class TPrintingThread: public TProgressThread
{
  public:
	__fastcall TPrintingThread(TExcelFile *aXls, TFeedbackMethod aProgressFeedback,
	  TFinalFeedbackMethod aFinalFeedback, String aFileName, bool aAllSheets);


  virtual void __fastcall Execute();
#if (__BORLANDC__ < 0x0650) //XE2 or older
//C++ builder header translations are wrong for XE2 or older
//see http://qc.embarcadero.com/wc/qcmain.aspx?d=42782
void __fastcall ShowProgress(const TObject* sender, const TPrintPageEventArgs* e);
#else
void __fastcall ShowProgress(TObject* const sender, TPrintPageEventArgs* const e);
#endif
};
//---------------------------------------------------------------------------
#endif
