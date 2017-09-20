//---------------------------------------------------------------------------
#ifndef UGettingStartedH
#define UGettingStartedH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <Vcl.FlexCel.Core.hpp>
#include <FlexCel.XlsAdapter.hpp>

//---------------------------------------------------------------------------
class TFGettingStarted : public TForm
{
__published:	// IDE-managed Components
	TButton *btnCreateFile;
	TSaveDialog *SaveDialog;
	TMemo* Memo1;
	void __fastcall btnCreateFileClick(TObject *Sender);
private:	// User declarations
	void __fastcall CreateFile();
	void __fastcall ShowOpenDialog(TExcelFile *Xls);
	void __fastcall AddData(TExcelFile *Xls);
public:		// User declarations
	__fastcall TFGettingStarted(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFGettingStarted *FGettingStarted;
//---------------------------------------------------------------------------
#endif
