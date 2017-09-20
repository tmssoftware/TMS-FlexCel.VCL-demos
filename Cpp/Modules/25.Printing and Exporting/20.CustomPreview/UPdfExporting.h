//---------------------------------------------------------------------------

#ifndef UPdfExportingH
#define UPdfExportingH
//---------------------------------------------------------------------------

#include <IOUtils.hpp>
#include "UProgressThread.h"
#include "FlexCel.Pdf.hpp"
#include "FlexCel.Render.hpp"
#include "VCL.FlexCel.Core.hpp"
//---------------------------------------------------------------------------
class TPdfThread: public TProgressThread
{
  public:
	__fastcall TPdfThread(TExcelFile *aXls, TFeedbackMethod aProgressFeedback,
	  TFinalFeedbackMethod aFinalFeedback, String aFileName, bool aAllSheets);


  virtual void __fastcall Execute();
#if (__BORLANDC__ < 0x0650) //XE2 or older
//C++ builder header translations are wrong for XE2 or older
//see http://qc.embarcadero.com/wc/qcmain.aspx?d=42782
void __fastcall ShowProgress(const TObject* sender, const TPageEventArgs* e);
#else
void __fastcall ShowProgress(TObject* const sender, TPageEventArgs* const e);
#endif
};
//---------------------------------------------------------------------------

#endif
