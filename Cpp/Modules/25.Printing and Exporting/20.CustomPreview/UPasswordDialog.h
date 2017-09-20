//---------------------------------------------------------------------------

#ifndef UPasswordDialogH
#define UPasswordDialogH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
//---------------------------------------------------------------------------
class TPasswordDialog : public TForm
{
__published:	// IDE-managed Components
	TLabel *Label1;
	TLabel *lblFileName;
	TButton *Button1;
	TButton *Button2;
	TEdit *edPassword;
private:	// User declarations
public:		// User declarations
	__fastcall TPasswordDialog(TComponent* Owner);

	__fastcall String Password();
	__fastcall void SetFileName(const String FileName);

};
//---------------------------------------------------------------------------
extern PACKAGE TPasswordDialog *PasswordDialog;
//---------------------------------------------------------------------------
#endif
