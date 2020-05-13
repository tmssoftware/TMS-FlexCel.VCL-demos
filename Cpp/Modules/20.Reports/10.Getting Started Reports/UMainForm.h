//---------------------------------------------------------------------------

#ifndef UMainFormH
#define UMainFormH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <VCL.FlexCel.Core.hpp>
#include <FlexCel.XlsAdapter.hpp>
#include <FlexCel.Report.hpp>
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
	TLabeledEdit *edName;
	TLabeledEdit *edURL;
	TCheckBox *cbAutoOpen;
	TButton *btnCancel;
	TButton *btnGo;
	TSaveDialog *SaveDialog;
	void __fastcall btnCancelClick(TObject *Sender);
	void __fastcall btnGoClick(TObject *Sender);
private:	// User declarations

	void __fastcall AutoOpenRun();
	void __fastcall NormalRun();
	void __fastcall Setup(TFlexCelReport* ReportStart, String UserName, String UserUrl, String DataPath);

	String __fastcall GetDataPath();
public:		// User declarations
	__fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
