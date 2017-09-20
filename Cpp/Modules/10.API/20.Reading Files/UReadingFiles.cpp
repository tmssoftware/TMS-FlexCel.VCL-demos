//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "UReadingFiles.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFReadingFiles *FReadingFiles;
//---------------------------------------------------------------------------
__fastcall TFReadingFiles::TFReadingFiles(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::ActionCloseExecute(TObject *Sender)
{
    Close();
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::ActionFormatValuesExecute(TObject *Sender)
{
	ActionFormatValues->Checked = !ActionFormatValues->Checked;
	FillGrid(ActionFormatValues->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::ActionInfoExecute(TObject *Sender)
{
  ShowMessage((AnsiString)"This demo shows how to read the contents of an xls file\n"  +
	  "The 'Open File' button will load an Excel file into a dataset.\n" +
	  "The 'Format Values' button will apply the format to the cells, or show the raw data.\n" +
	  "The 'Value in Current Cell' button will show more information about the cel selected in the grid. Try it with formulas.");
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::ActionOpenExecute(TObject *Sender)
{
	if (!OpenDialog->Execute()) return;
	ImportFile(OpenDialog->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::ActionValueInCurrentCellExecute(TObject *Sender)
{
	AnalizeFile(SheetData->Row, SheetData->Col);
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::FormDestroy(TObject *Sender)
{
	Xls->Free();
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::SheetDataSelectCell(TObject *Sender, int ACol, int ARow,
		  bool &CanSelect)
{
	SelectedCell(ACol, ARow);
	CanSelect = true;
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::TabsClick(TObject *Sender)
{
	FillGrid(ActionFormatValues->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::FillTabs()
{
  Tabs->Tabs->Clear();
  for (int s = 1; s <= Xls->SheetCount; s++)
  {
	Tabs->Tabs->Add(Xls->GetSheetName(s));
  }
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::ImportFile(String FileName)
{
	//Open the Excel file.
	if (Xls == NULL) Xls = new TXlsFile(false);
	TDateTime StartOpen = Now();
	Xls->Open(FileName);
	TDateTime EndOpen = Now();

	FillTabs();
	Tabs->TabIndex = Xls->ActiveSheet - 1;

	StatusBar->SimpleText = "Time to load file: " +  ElapsedTime(EndOpen, StartOpen);
	Caption = "Reading Files: " + ExtractFileName(FileName);
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::ClearGrid()
{
  for (int r = 1; r <= SheetData->RowCount; r++) SheetData->Rows[r]->Clear();
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::FillGrid(bool Formatted)
{
  if ((Tabs->TabIndex + 1 <= Xls->SheetCount) && (Tabs->TabIndex >= 0)) Xls->ActiveSheet = Tabs->TabIndex + 1; else Xls->ActiveSheet = 1;
  //Clear data in previous grid
  ClearGrid();
  SheetData->RowCount = 1;
  SheetData->ColCount = 1;
  FmtBox->Text = "";

  SheetData->RowCount = Xls->RowCount + 1; //Include fixed row
  SheetData->ColCount = Xls->ColCount + 1; //Include fixed col. NOTE THAT COLCOUNT IS SLOW. We use it here because we really need it. See the Performance.pdf doc.

  if (SheetData->ColCount > 1) SheetData->FixedCols = 1; //it is deleted when we set the width to 1.
  if (SheetData->RowCount > 1) SheetData->FixedRows = 1;

  for (int r = 1; r <= Xls->RowCount; r++)
  {
	//Instead of looping in all the columns, we will just loop in the ones that have data. This is much faster.
	for (int cIndex = 1; cIndex <= Xls->ColCountInRow(r); cIndex++)
	{
	  int c = Xls->ColFromIndex(r, cIndex); //The real column.
	  if (Formatted)
	  {
		 SheetData->Cells[c][r] = Xls->GetStringFromCell(r, c).ToString();
	  }
	  else
	  {
		TCellValue v = Xls->GetCellValue(r, c);
		SheetData->Cells[c][r] = v.ToString().ToString();
	  }
	}
  }

  ResizeGrid();
  SelectedCell(1,1);
}
//---------------------------------------------------------------------------
void __fastcall TFReadingFiles::ResizeGrid()
{
  if (Xls == NULL)
  {
	SheetData->DefaultColWidth = SimpleRoundTo(64.0 * PixelsPerInch / 96.0);
	SheetData->DefaultRowHeight = SimpleRoundTo(18.0 * PixelsPerInch / 96.0);
	return;
  }
  if (Tabs->TabIndex + 1 <= Xls->SheetCount && Tabs->TabIndex >= 0) Xls->ActiveSheet = Tabs->TabIndex + 1; else Xls->ActiveSheet = 1;

  SheetData->RowHeights[0] = SimpleRoundTo(20 * PixelsPerInch / 96.0);
  SheetData->ColWidths[0] = SimpleRoundTo(50 * PixelsPerInch / 96.0);


  //Fill the row headers
  for (int r = 1; r < SheetData->RowCount; r++)
  {
	SheetData->Cells[0][r] = IntToStr(r);
	SheetData->RowHeights[r] = SimpleRoundTo(Xls->GetRowHeight(r) / TExcelMetrics::RowMultDisplay(Xls->AsIRowColSize()) * PixelsPerInch / 96.0);
  }

  //Fill the column headers
  for (int c = 1; c < SheetData->ColCount; c++)
  {
	SheetData->Cells[c][0] = TCellAddress::EncodeColumn(c);
	SheetData->ColWidths[c] = SimpleRoundTo(Xls->GetColWidth(c) / TExcelMetrics::ColMult(Xls->AsIRowColSize()) * PixelsPerInch / 96.0);
  }
}


void __fastcall TFReadingFiles::SelectedCell(int aRow, int aCol)
{
  if  (Xls == NULL) return;
  if ((aRow < 1) || (aCol < 1)) return;

  TFlxFormat Fmt = Xls->GetCellVisibleFormatDef(aRow, aCol);
  FmtBox->Text = Fmt.Format;
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::AnalizeFile(int Row, int Col)
{
  if (Xls == NULL)
  {
	ShowMessage("You need to open a file first");
	return;
  }

  if ((Row < 1) || (Col < 1) || (Row > SheetData->RowCount - 1) || (Col > SheetData->ColCount - 1))
  {
	ShowMessage("The selected cell is not valid.");
	return;
  }

  ShowMessage(((String)"Active sheet is '" + Xls->SheetName) + "'");
  TCellValue v = Xls->GetCellValue(Row, Col);

  //First see if it is a formula
  if (v.IsFormula())
  {
	TFormula Fmla = v.AsFormula();
	TCellValue FValue = TCellValue::_op_Implicit(Fmla.FormulaResult);
	ShowMessage((String)"Cell " + TCellAddress::Create(Row, Col).CellRef + " contains the Formula: " + Fmla.Text + (Char)10 +
				"The result of the formula is " + FormatValue(FValue, Row, Col));
	return;
  }

  ShowMessage((String)"Cell " + TCellAddress::Create(Row, Col).CellRef + " is " + FormatValue(v, Row, Col));
}
//---------------------------------------------------------------------------

String __fastcall TFReadingFiles::FormatValue(TCellValue& v, int Row, int Col)
{
  switch( v.ValueType)
  {
	  case TCellValueType::Empty: return "empty";
	  case TCellValueType::Boolean: return (String)"a boolean: " + BoolToStr(v.AsBoolean(), true);
	  case TCellValueType::Error: return (String)"an error: " + TFormulaMessages::ErrString(v.AsError());

	  case TCellValueType::Number:
	  {  //Remember, dates are doubles with date format. Also, all numbers are returned as doubles, even if they are integers.
		  ARGB CellColor = ARGB::Empty();
		  bool HasDate, HasTime;
		  String CellValue = TFlxNumberFormat::FormatValue(v, Xls->GetCellVisibleFormatDef(Row, Col).Format, CellColor, Xls, HasDate, HasTime).ToString();
		  if (HasDate || HasTime)
		  {
			return (String)"a DateTime value: " + DateTimeToStr(v.ToDateTime(Xls->OptionsDates1904)) + (Char)10 + (String)"The value is displayed as: " + CellValue;
		  }
		  else
		  {
			return (String)"a double: " + FloatToStr(v.AsNumber()) + (Char)10 + "The value is displayed as: " + CellValue + (Char)10;
		  }
	  }

	  case TCellValueType::DateTime:  //FlexCel won't currently return DateTime values, as dates are numbers.
	  {
		return (String)"a DateTime value: " + DateTimeToStr(v.AsDateTime());
	  }

	  case TCellValueType::StringValue:
	  {
		  String Formatted;
		  if (v.AsString().RTFRunCount > 0) Formatted = L" FORMATTED "; else Formatted = " ";

		  String StrVal = v.AsString().ToString();
		  String HtmlVal = v.AsString().ToHtml(Xls, Xls->GetCellVisibleFormatDef(Row, Col), THtmlVersion::Html_32, THtmlStyle::Simple, TEncoding::UTF8);
		  return (String)L"a" + Formatted + L"string: " + StrVal
		  + (Char)10 + L"In html: " + HtmlVal;
	  }

	  default: throw new Exception("Unexpected value on cell");
  }

}
//---------------------------------------------------------------------------

String __fastcall TFReadingFiles::ElapsedTime(TDateTime et, TDateTime st)
{
  unsigned short Hour, Min, Sec, MSec;
  DecodeTime(et - st, Hour, Min, Sec, MSec);
  return  Format((String)L"%.2d:%.2d:%.2d", ARRAYOFCONST((Hour, Min, Sec)));
}
//---------------------------------------------------------------------------

void __fastcall TFReadingFiles::FormCreate(TObject *Sender)
{
  RegisterForHDPI(this, ResizeGrid);
}
//---------------------------------------------------------------------------

