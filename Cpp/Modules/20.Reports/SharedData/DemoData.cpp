//---------------------------------------------------------------------------


#pragma hdrstop

#include "DemoData.h"
#include <IOUtils.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TDemoTables *DemoTables;
//---------------------------------------------------------------------------
__fastcall TDemoTables::TDemoTables(TComponent* Owner)
	: TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

String DBFile()
{
  return TPath::Combine(TPath::GetDirectoryName(ParamStr(0)), "..\\..\\..\\SharedData\\Northwind.mdb");
};


void __fastcall TDemoTables::DataModuleCreate(TObject *Sender)
{
  ADOConnection->ConnectionString = StringReplace(ADOConnection->ConnectionString, "Northwind.mdb", DBFile(), TReplaceFlags());
}
//---------------------------------------------------------------------------

