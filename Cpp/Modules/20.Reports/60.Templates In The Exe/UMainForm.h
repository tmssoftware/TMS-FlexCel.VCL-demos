//---------------------------------------------------------------------------

#ifndef UMainFormH
#define UMainFormH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Dialogs.hpp>
#include "DemoData.h"
#include <FlexCel.VCLSupport.hpp>
#include <FlexCel.Core.hpp>
#include <FlexCel.XlsAdapter.hpp>
#include <FlexCel.Report.hpp>


//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TButton *btnCancel;
	TButton *btnGo;
	TSaveDialog *SaveDialog;
	void __fastcall btnCancelClick(TObject *Sender);
	void __fastcall btnGoClick(TObject *Sender);
private:	// User declarations
	void __fastcall RunReport();
	void __fastcall GetIncludes(TObject* sender, TGetIncludeEventArgs* e);
public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
