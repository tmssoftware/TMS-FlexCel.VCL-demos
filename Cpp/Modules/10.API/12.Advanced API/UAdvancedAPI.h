//---------------------------------------------------------------------------

#ifndef UAdvancedAPIH
#define UAdvancedAPIH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <FlexCel.VCLSupport.hpp>
#include <FlexCel.Core.hpp>
#include <FlexCel.XlsAdapter.hpp>
//---------------------------------------------------------------------------
class TFAdvancedAPI : public TForm
{
__published:	// IDE-managed Components
	TMemo *Memo1;
	TButton *btnCreateFile;
	TCheckBox *btnUseXlsx;
	TSaveDialog *SaveDialog;
	void __fastcall btnCreateFileClick(TObject *Sender);
private:	// User declarations

	void __fastcall AddChart(TXlsNamedRange DataCell, TExcelFile* Xls);
	String __fastcall GetCountryList();
	void __fastcall OpenFile(TExcelFile* Xls);
	void __fastcall AddData(TExcelFile* Xls);
	void __fastcall CreateFile();
public:		// User declarations
	__fastcall TFAdvancedAPI(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFAdvancedAPI *FAdvancedAPI;
//---------------------------------------------------------------------------
#endif
