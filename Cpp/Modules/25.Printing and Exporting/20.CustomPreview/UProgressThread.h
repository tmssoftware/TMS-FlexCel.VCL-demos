//---------------------------------------------------------------------------

#ifndef UProgressThreadH
#define UProgressThreadH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include "FlexCel.Core.hpp"

typedef void __fastcall (__closure *TFeedbackMethod)(int Progress, String Msg);
typedef void __fastcall (__closure *TFinalFeedbackMethod)(bool Ok, String Msg);

//---------------------------------------------------------------------------
class TProgressThread: public TThread
{
  private:
	String FinalFeedback_msg;
	bool FinalFeedback_ok;
	void __fastcall DoFinalFeedback();
  protected:
	String ProgressFeedback_msg;
	bool ProgressFeedback_percent;
	void __fastcall DoProgressFeedback();

  protected:
	TFeedbackMethod ProgressFeedback;
	TFinalFeedbackMethod FinalFeedback;
	TExcelFile *Xls;
	String FileName;
	bool AllSheets;
	bool Canceled;

	virtual void __fastcall TerminatedSet();
	virtual void __fastcall DoTerminate();

  public:
	__fastcall TProgressThread(TExcelFile *aXls, TFeedbackMethod aProgressFeedback,
	  TFinalFeedbackMethod aFinalFeedback, String aFileName, bool aAllSheets);

};
//---------------------------------------------------------------------------
#endif
