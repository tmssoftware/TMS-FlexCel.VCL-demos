//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UAdvancedAPI.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TFAdvancedAPI *FAdvancedAPI;

//some silly data to fill in the cells. A real app would read this from somewhere else.
const String Country[] = {"USA", "Canada", "Spain", "France", "United Kingdom", "Australia", "Brazil", "Unknown"};
const int Country_Length = 8;
const int DataRows = 100;

//---------------------------------------------------------------------------
__fastcall TFAdvancedAPI::TFAdvancedAPI(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFAdvancedAPI::btnCreateFileClick(TObject *Sender)
{
  CreateFile();
}
//---------------------------------------------------------------------------
void __fastcall TFAdvancedAPI::CreateFile()
{
   TExcelFile* Xls = new TXlsFile(true);
   __try
   {
	  AddData(Xls);
	  OpenFile(Xls);
   }
   __finally
   {
	   Xls->Free();
   }

}
//---------------------------------------------------------------------------
void __fastcall TFAdvancedAPI::AddData(TExcelFile* Xls)
{
  String Template;
  if (btnUseXlsx->Checked) Template = L"AdvancedAPI.template.xlsm"; else Template = L"AdvancedAPI.template.xls";

  // Open an existing file to be used as template. In this example this file has
  // little data, in a real situation it should have as much as possible. (Or even better, be a report)
  Xls->Open(ExtractFilePath(Application->ExeName) + L"\\..\\..\\" + Template);

  //Find the cell where we want to fill the data. In this case, we have created a named range "data" so the address
  //is not hardcoded here.
  TXlsNamedRange DataCell = Xls->GetNamedRange(L"Data", -1);

  //Add a chart with totals
  AddChart(DataCell, Xls);
  //Note that "DataCell" will change because we inserted rows above it when creating the chart. But we will keep using the old one.

  //Add the captions. This should probably go into the template, but in a dynamic environment it might go here.
  Xls->SetCellValue(DataCell.Top - 1, DataCell.Left, TCellValue::Create((String)L"Country"));
  Xls->SetCellValue(DataCell.Top - 1, DataCell.Left + 1, TCellValue::Create((String)L"Quantity"));

   //Add a rectangle around the cells
  TFlxApplyFormat ApplyFormat = TFlxApplyFormat::Create();
  ApplyFormat.SetAllMembers(false);
  ApplyFormat.Borders.SetAllMembers(true);  //We will only apply the borders to the existing cell formats

  TFlxFormat fmt = Xls->GetDefaultFormat;
  fmt.Borders.Left.Style = TFlxBorderStyle::Double;
  fmt.Borders.Right.Style = TFlxBorderStyle::Double;
  fmt.Borders.Top.Style = TFlxBorderStyle::Double;
  fmt.Borders.Bottom.Style = TFlxBorderStyle::Double;
  Xls->SetCellFormat(DataCell.Top - 1, DataCell.Left, DataCell.Top, DataCell.Left + 1, fmt, ApplyFormat, true);  //Set last parameter to true so it draws a box.


   //Freeze panes
  Xls->FreezePanes(TCellAddress::Create(DataCell.Top, 1));
  Randomize();
  int z = 0;  //Fill the data

  int OutlineLevel = 0;
  for (int r = 0; r <= DataRows; r++)
  {
	 //Fill the values.
	Xls->SetCellValue(DataCell.Top + r, DataCell.Left, TCellValue::Create(Country[z % Country_Length]));

	Xls->SetCellValue(DataCell.Top + r, DataCell.Left + 1, TCellValue::Create((double)Random(1000)));

	 //Add the country to the outline
	Xls->SetRowOutlineLevel(DataCell.Top + r, OutlineLevel);
	 //increment the country randomly
	if (Random(3) == 0)
	{
	  z++;
	  OutlineLevel = 0;  //Break the group and create a new one.
	}
	else
	{
	  OutlineLevel = 1;
	}
  }


   //Make the "+" signs of the outline appear at the top.
  Xls->OutlineSummaryRowsBelowDetail = false;

   //Collapse the outline to the first level.
  Xls->CollapseOutlineRows(1, TCollapseChildrenMode::Collapsed);

   //Add Data Validation for the first column, it must be a country.
  TDataValidationInfo dv = TDataValidationInfo::Create(TDataValidationDataType::List,  //We will use a built in list.
		   TDataValidationConditionType::Between, //This parameter does not matter since it is a list. It will not be used.
		   L"=\"" + GetCountryList() + L"\"",  //We could have used a range of cells here with the values (like "=C1..C4") Instead, we directly entered the list in the formula.
		   L"",  //no need for a second formula, not used in List
		   false,
		   true,
		   true, //Note that as we entered the data directly in FirstFormula, we need to set this to true
		   true,
		   L"Unknown country",
		   L"Please make sure that the country is in the list",
		   false, //We will not use an input box, so this is false and the 2 next entries are nil
		   L"",
		   L"",
		   TDataValidationIcon::Stop); //We will use the stop icon so no invalid input is permitted.

  Xls->AddDataValidation(TXlsCellRange::Create(DataCell.Top, DataCell.Left, DataCell.Top + DataRows, DataCell.Left), dv);

   //Add Data Validation for the second column, it must be an integer between 0 and 1000.
  dv = TDataValidationInfo::Create(
			TDataValidationDataType::WholeNumber, //We will request a number.
			TDataValidationConditionType::Between,
			L"=0", //First formula marks the first part of the "between" condition.
			L"=1000", //Second formula is the second part.
			false,
			false,
			false,
			true,
			L"Invalid Quantity",
			L"", //We will leave the default error message.
			true,
			L"Quantity:",
			L"Please enter a quantity between 0 and 1000",
			TDataValidationIcon::Stop); //We will use the stop icon so no invalid input is permitted.

  Xls->AddDataValidation(TXlsCellRange::Create(DataCell.Top, DataCell.Left + 1, DataCell.Top + DataRows, DataCell.Left + 1), dv);


   //Search country "Unknown" and replace it by "no".
   //This does not make any sense here (we could just have entered "no" to begin)
   //but it shows how to do it when modifying an existing file
   Xls->Replace(TCellValue::Create((String)L"Unknown"), TCellValue::Create((String)L"no"), TXlsCellRange::FullRange(), true, false, true);

   //Autofit the rows. As we keep the row height automatic this will not show when opening in Excel, but will work when directly printing from FlexCel.
   //This is not working yet on the preview since it needs the rendering framework.
   //Xls.AutofitRowsOnWorkbook(false, true, 1);

  Xls->Recalc();  //Calculate the SUMIF formulas so we can sort by them. Note that FlexCel automatically recalculates before saving,
			   //but in this case we haven't saved yet, so the sheet is not recalculated. You do not normally need to call Recalc directly.

  //Sort the data. As in the case with replace, this does not make much sense. We could have entered the data sorted to begin
  //But it shows how you can use the feature.

  //Find the cell where the chart goes.
  TXlsNamedRange ChartRange = Xls->GetNamedRange(L"ChartData", -1);
  DynamicArray<int> Keys; Keys.Length = 1; Keys[0] = 2;
  DynamicArray<TSortOrder> SortOrder; SortOrder.Length = 1; SortOrder[0] = TSortOrder::Descending;
  Xls->Sort(TXlsCellRange::Create(ChartRange.Top, ChartRange.Left, ChartRange.Top + Country_Length,
   ChartRange.Left + 1), true, Keys, SortOrder, NULL, TSortFormulaMode::MoveFormulas);

  TSheetProtectionOptions Sp = TSheetProtectionOptions::Create(false);  //Create default protection options that allows everything.
  Sp.InsertColumns = false;  //Restrict inserting columns.
  Xls->Protection->SetSheetProtection("flexcel", Sp);
   //Set a modify password. Note that this does *not* encrypt the file.
  Xls->Protection->SetModifyPassword("flexcel", true, "flexcel");
  Xls->Protection->OpenPassword = "flexcel";  //OpenPasword is the only password that will actually encrypt the file, so you will not be able to open it with flexcel if you do not know the password.


  //Select cell A1
  Xls->SelectCell(1, 1, true);

}
//---------------------------------------------------------------------------
void __fastcall TFAdvancedAPI::OpenFile(TExcelFile* Xls)
{
	if (!SaveDialog->Execute()) return;
	Xls->Save(SaveDialog->FileName);

	if (MessageDlg(L"Do you want to open the generated file?", mtConfirmation, mbYesNo, 0) == mrYes)
	{
		ShellExecute(0, L"open", SaveDialog->FileName.c_str(), NULL, NULL, SW_SHOWNORMAL);
	}
}
//---------------------------------------------------------------------------
String __fastcall TFAdvancedAPI::GetCountryList()
{
  String sep = "";
  String Result = "";
  for (int fIndex = 0; fIndex < Country_Length; fIndex++)
  {
	String c = Country[fIndex];
	Result += sep + c;
	sep = (_DCHAR)0;  //not very efficient method to concat, but good enough for this demo.
  }
  return Result;
}
//---------------------------------------------------------------------------
void __fastcall TFAdvancedAPI::AddChart(TXlsNamedRange DataCell, TExcelFile* Xls)
{
   //Find the cell where the cart will go.
  TXlsNamedRange ChartRange = Xls->GetNamedRange(L"ChartData", -1);

   //Insert cells to expand the range for the chart. It already has 2 rows, so we need to insert Country.Length - 2
   //Note also that we insert after ChartRange.Top, so the chart is updates with the new range.
  Xls->InsertAndCopyRange(TXlsCellRange::Create(ChartRange.Top, ChartRange.Left, ChartRange.Top, ChartRange.Left + 1), ChartRange.Top + 1, ChartRange.Left, Country_Length - 2, TFlxInsertMode::ShiftRangeDown);
   //we use shiftrangedown so not all the row goes down and the chart stays in place.

   //Get the cell addresses of the data range.
  TCellAddress FirstCell = TCellAddress::Create(DataCell.Top, DataCell.Left);
  TCellAddress SecondCell = TCellAddress::Create(DataCell.Top + DataRows, DataCell.Left + 1);
  TCellAddress FirstSumCell = TCellAddress::Create(DataCell.Top, DataCell.Left + 1);

   //Fill a table with the data to be used in the chart.
  for (int r = ChartRange.Top; r < ChartRange.Top + Country_Length; r++)
  {
	Xls->SetCellValue(r, ChartRange.Left, TCellValue::Create(Country[r - ChartRange.Top]));
	Xls->SetCellValue(r, ChartRange.Left + 1, TCellValue::Create(
		 TFormula::Create(L"=SUMIF(" + FirstCell.CellRef + L":"
		 + SecondCell.CellRef + L",\"" + Country[r - ChartRange.Top] + L"\", "
		 + FirstSumCell.CellRef + L":" + SecondCell.CellRef + L")")));
  }
}
//---------------------------------------------------------------------------
