//---------------------------------------------------------------------------

#ifndef UReadingFilesH
#define UReadingFilesH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <ImgList.hpp>
#include <Tabs.hpp>
#include <ToolWin.hpp>
#include <Math.hpp>
#include <FlexCel.VCLSupport.hpp>
#include <FlexCel.Core.hpp>
#include <FlexCel.XlsAdapter.hpp>
#include "UFlexCelHDPI.hpp"

//---------------------------------------------------------------------------
class TFReadingFiles : public TForm
{
__published:	// IDE-managed Components
	TToolBar *ToolBar1;
	TToolButton *ToolButton1;
	TToolButton *ToolButton7;
	TToolButton *ToolButton2;
	TToolButton *ToolButton3;
	TToolButton *ToolButton5;
	TToolButton *ToolButton4;
	TToolButton *ToolButton6;
	TStringGrid *SheetData;
	TTabSet *Tabs;
	TPanel *Panel2;
	TLabel *Label1;
	TEdit *FmtBox;
	TStatusBar *StatusBar;
	TActionList *Actions;
	TAction *ActionOpen;
	TAction *ActionValueInCurrentCell;
	TAction *ActionInfo;
	TAction *ActionFormatValues;
	TAction *ActionClose;
	TOpenDialog *OpenDialog;
	TImageList *ToolbarImages;
	TImageList *ToolbarImages_100Scale;
	TImageList *ToolbarImages_300Scale;
	TPanel *Panel1;
	void __fastcall ActionCloseExecute(TObject *Sender);
	void __fastcall ActionFormatValuesExecute(TObject *Sender);
	void __fastcall ActionInfoExecute(TObject *Sender);
	void __fastcall ActionOpenExecute(TObject *Sender);
	void __fastcall ActionValueInCurrentCellExecute(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
	void __fastcall SheetDataSelectCell(TObject *Sender, int ACol, int ARow, bool &CanSelect);
	void __fastcall TabsClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);

private:	// User declarations
	String __fastcall ElapsedTime(TDateTime et, TDateTime st);
	String __fastcall FormatValue(TCellValue& v, int Row, int Col);
	void __fastcall AnalizeFile(int Row, int Col);
    TExcelFile* Xls;

	void __fastcall SelectedCell(int aRow, int aCol);
	void __fastcall FillGrid(bool Formatted);
	void __fastcall ClearGrid();
	void __fastcall ResizeGrid();
	void __fastcall ImportFile(String FileName);
	void __fastcall FillTabs();
public:		// User declarations
	__fastcall TFReadingFiles(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFReadingFiles *FReadingFiles;
//---------------------------------------------------------------------------
#endif
