// ---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UGettingStarted.h"
// ---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFGettingStarted *FGettingStarted;

// ---------------------------------------------------------------------------
__fastcall TFGettingStarted::TFGettingStarted(TComponent* Owner) : TForm(Owner)
{
}

// ---------------------------------------------------------------------------
void __fastcall TFGettingStarted::btnCreateFileClick(TObject *Sender) {
	CreateFile();
}
// ---------------------------------------------------------------------------

void __fastcall TFGettingStarted::CreateFile() {
	TExcelFile *Xls = new TXlsFile(true);
	__try {
		AddData(Xls);
		ShowOpenDialog(Xls);
	}
	__finally {
		delete Xls;
	}
}

void __fastcall TFGettingStarted::ShowOpenDialog(TExcelFile *Xls) {
	if (!SaveDialog->Execute())
		return;
	Xls->Save(SaveDialog->FileName);
	// No need to delete the file first, since AllowOverWriteFiles is true in XlsAdapter.

	if (MessageDlg(L"Do you want to open the generated file?", mtConfirmation,
		 TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes) {
		ShellExecute(0, L"open", SaveDialog->FileName.c_str(), NULL, NULL,
			SW_SHOWNORMAL);
	}
}
// ---------------------------------------------------------------------------

void __fastcall TFGettingStarted::AddData(TExcelFile *Xls) {
	// Create a new file. We could also open an existing file with Xls.Open
	Xls->NewFile(1);

	// Set some cell values.
	Xls->SetCellValue(1, 1, TCellValue::Create((String)L"Hello to the world"));
	Xls->SetCellValue(2, 1, TCellValue::Create((double)3));
	Xls->SetCellValue(3, 1, TCellValue::Create((double)2.1));
	Xls->SetCellValue(4, 1, TCellValue::Create(TFormula::Create(L"=Sum(A2, A3)")));
	// Note that formulas always are in English. This means use "," to separate arguments, not ";".

	// Get path for images from disk.
	UnicodeString PathToImage = IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) +
		L"..\\..\\poweredbyflexcel.png";

	//Add a new image on cell F2
	Xls->AddImage(PathToImage,
		TImageProperties_Create(TClientAnchor::Create(TFlxAnchorType::MoveAndResize,
		2, 0, 6, 0, 5, 0, 8, 0), PathToImage, PathToImage));

	// Add a comment on cell a2
	Xls->SetComment(2, 1, L"This is a comment");

	// Custom Format cells a2 and a3
	TFlxFormat fmt = Xls->GetDefaultFormat;
	// Always initialize the record with an existing format.
	fmt.Font.Name = L"Times New Roman";
	fmt.Font.Color = TExcelColor::_op_Implicit(clRed);
	fmt.FillPattern.Pattern = TFlxPatternStyle::LightDown;
	fmt.FillPattern.FgColor = TExcelColor::_op_Implicit(clBlue);
	fmt.FillPattern.BgColor = TExcelColor::_op_Implicit(clWhite);

	// You can call AddFormat as many times as you want, it will never add a format twice.
	// But if you know the format you are going to use, you can get some extra CPU cycles by
	// calling addformat once and saving the result into a variable.
	int XF = Xls->AddFormat(fmt);

	Xls->SetCellFormat(2, 1, XF);
	Xls->SetCellFormat(3, 1, XF);

	fmt.Rotation = 45;
	fmt.Font.Size20 = 400;
	fmt.FillPattern.Pattern = TFlxPatternStyle::Solid;
	int XF2 = Xls->AddFormat(fmt);

	// Apply a custom format to all the row.
	Xls->SetRowFormat(1, XF2);

	// Merge cells
	Xls->MergeCells(5, 1, 10, 6);
	// Note how this one merges with the previous range, creating a final range (5,1,15,6)
	Xls->MergeCells(10, 6, 15, 6);

	// Make the page print in landscape or portrait mode
	Xls->PrintLandscape = true;

}
