//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UPasswordDialog.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

//---------------------------------------------------------------------------
__fastcall TPasswordDialog::TPasswordDialog(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

String __fastcall TPasswordDialog::Password()
{
   return edPassword->Text;
}

void __fastcall TPasswordDialog::SetFileName(const String FileName)
{
  lblFileName->Caption = ExtractFileName(FileName);
}

