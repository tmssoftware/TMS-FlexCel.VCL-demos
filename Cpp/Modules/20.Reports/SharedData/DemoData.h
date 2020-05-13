//---------------------------------------------------------------------------

#ifndef DemoDataH
#define DemoDataH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Data.DB.hpp>
#include <Data.Win.ADODB.hpp>
//---------------------------------------------------------------------------
class TDemoTables : public TDataModule
{
__published:	// IDE-managed Components
	TADOConnection *ADOConnection;
	TADODataSet *Categories;
	TADODataSet *Products;
	TDataSource *DsCategories;
	TADODataSet *OrderDetails;
	TDataSource *DsProducts;
	TADODataSet *Employees;
	TADODataSet *Orders;
	TDataSource *DsEmployees;
	TADODataSet *Suppliers;
	TADODataSet *Shippers;
	void __fastcall DataModuleCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TDemoTables(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDemoTables *DemoTables;
//---------------------------------------------------------------------------
#endif
