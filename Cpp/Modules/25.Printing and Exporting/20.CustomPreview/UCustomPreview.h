//---------------------------------------------------------------------------

#ifndef UCustomPreviewH
#define UCustomPreviewH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.ComCtrls.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.ToolWin.hpp>
#include "FlexCel.Preview.hpp"
#include "FlexCel.Render.hpp"
#include "FlexCel.XlsAdapter.hpp"
#include "FlexCel.VCLSupport.hpp"
#include "FlexCel.Core.hpp"
#include "UPdfExporting.h"
#include "UPrinting.h"
#include "UPasswordDialog.h"
#include "UFlexCelHDPI.hpp"
//---------------------------------------------------------------------------
class TFCustomPreview : public TForm
{
__published:	// IDE-managed Components
	TSplitter *Splitter1;
	TPanel *Panel1;
	TSplitter *Splitter2;
	TPanel *Panel3;
	TCheckBox *cbAllSheets;
	TPanel *Panel4;
	TPanel *Panel5;
	TPanel *Panel6;
	TFlexCelPreviewer *Thumbs;
	TPanel *PanelSheets;
	TListBox *lbSheets;
	TPanel *Panel2;
	TFlexCelPreviewer *MainPreview;
	TPanel *PanelPrinting;
	TLabel *lblProgressTask;
	TLabel *lblPrintPage;
	TProgressBar *PrintProgressBar;
	TButton *btnPrintCancel;
	TPanel *PanelPdf;
	TLabel *Label1;
	TLabel *lblPdfPage;
	TProgressBar *PdfProgressBar;
	TButton *btnPdfCancel;
	TPanel *PanelPdfError;
	TLabel *lblPdfError;
	TButton *btnPdfErrorClose;
	TPanel *PanelPrintingError;
	TLabel *lblPrintingError;
	TButton *btnPrintingErrorClose;
	TPanel *PanelPrintingOk;
	TLabel *Label2;
	TButton *btnPrintOkClose;
	TPanel *PanelPdfOk;
	TLabel *Label3;
	TButton *btnPdfOkClose;
	TButton *btnOpenGeneratedFile;
	TPanel *FlowPanel1;
	TToolBar *ToolBar2;
	TToolButton *ToolButton14;
	TToolButton *ToolButton15;
	TToolButton *ToolButton16;
	TToolButton *ToolButton17;
	TToolButton *ToolButton18;
	TPanel *PanelSelectPage;
	TLabel *Label4;
	TLabel *lblTotalPages;
	TEdit *edPage;
	TToolBar *ToolBar4;
	TToolButton *ToolButtonZoom;
	TToolButton *ToolButton27;
	TToolButton *ToolButton28;
	TToolButton *ToolButton29;
	TToolButton *ToolButton30;
	TToolButton *ToolButton31;
	TToolButton *ToolButton32;
	TPanel *PanelZoom;
	TTrackBar *TrackBarZoom;
	TButton *btn25;
	TButton *btn50;
	TButton *btn75;
	TButton *btn100;
	TButton *btn150;
	TPanel *PanelPrint;
	TButton *btnPrint;
	TActionList *Actions;
	TAction *ActionOpen;
	TAction *ActionAutofit;
	TAction *ActionRecalc;
	TAction *ActionHeadings;
	TAction *ActionPdf;
	TAction *ActionPrint;
	TAction *ActionGridLines;
	TAction *ActionClose;
	TAction *ActionZoom;
	TOpenDialog *OpenDialog;
	TImageList *ToolbarImages;
	TImageList *ToolbarImagesDisabled;
	TSaveDialog *PdfSaveDialog;
	TPrintDialog *PrintDialog;
	TPopupMenu *AutofitMenu;
	TMenuItem *NoAutofit1;
	TMenuItem *FittoWidth1;
	TMenuItem *FittoHeight1;
	TMenuItem *FittoPage1;
	TImageList *ToolbarImages_100Scale;
	TImageList *ToolbarImages_300Scale;
	TToolBar *ToolBarAutofit;
	TToolButton *ToolButton1;
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall ActionCloseExecute(TObject *Sender);
	void __fastcall ActionOpenExecute(TObject *Sender);
	void __fastcall cbAllSheetsClick(TObject *Sender);
	void __fastcall lbSheetsClick(TObject *Sender);
	void __fastcall ActionPdfExecute(TObject *Sender);
	void __fastcall ActionPrintExecute(TObject *Sender);
	void __fastcall btnOpenGeneratedFileClick(TObject *Sender);
	void __fastcall btnPdfCancelClick(TObject *Sender);
	void __fastcall btnPrintCancelClick(TObject *Sender);
	void __fastcall btnPdfErrorCloseClick(TObject *Sender);
	void __fastcall btnPrintingErrorCloseClick(TObject *Sender);
	void __fastcall btnPrintOkCloseClick(TObject *Sender);
	void __fastcall btnPdfOkCloseClick(TObject *Sender);
	void __fastcall MainPreviewStartPageChanged(TObject *Sender);
	void __fastcall edPageExit(TObject *Sender);
	void __fastcall edPageKeyPress(TObject *Sender, System::WideChar &Key);
	void __fastcall MainPreviewZoomChanged(TObject *Sender);
	void __fastcall ActionZoomExecute(TObject *Sender);
	void __fastcall btn25Click(TObject *Sender);
	void __fastcall btn50Click(TObject *Sender);
	void __fastcall btn75Click(TObject *Sender);
	void __fastcall btn100Click(TObject *Sender);
	void __fastcall btn150Click(TObject *Sender);
	void __fastcall TrackBarZoomChange(TObject *Sender);
	void __fastcall TrackBarZoomEnter(TObject *Sender);
	void __fastcall PanelZoomExit(TObject *Sender);
	void __fastcall ActionAutofitExecute(TObject *Sender);
	void __fastcall NoAutofit1Click(TObject *Sender);
	void __fastcall FittoWidth1Click(TObject *Sender);
	void __fastcall FittoHeight1Click(TObject *Sender);
	void __fastcall FittoPage1Click(TObject *Sender);
	void __fastcall ActionRecalcExecute(TObject *Sender);
	void __fastcall ActionGridLinesExecute(TObject *Sender);
	void __fastcall ActionHeadingsExecute(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
	TExcelFile *Xls;
	TFlexCelImgExport *ImgExport;
	TPrintingThread *PrintingThread;
	TPdfThread *PdfThread;
	int DisabledCount;
	bool ChangingZoom;
	void __fastcall EnableCommonActions(bool Enable);
	void __fastcall LoadFile(String FileName);
#if (__BORLANDC__ < 0x0650) //XE2 or older
//C++ builder header translations are wrong for XE2 or older, this should be "TOnPasswordEventArgs * const e".
//see http://qc.embarcadero.com/wc/qcmain.aspx?d=42782
	void __fastcall GetPassword(const TOnPasswordEventArgs *e);
#else
	void __fastcall GetPassword(TOnPasswordEventArgs* const e);
#endif

	void __fastcall UpdateZoom();
	void __fastcall UpdateAutofitText();
	void __fastcall UpdatePages();
	void __fastcall ChangePages();
	void __fastcall DPIChanged();
	void __fastcall PdfFinalFeedback(bool Ok, String  Msg);
	void __fastcall PdfProgressFeedback(int Progress, String Msg);
	void __fastcall PrintFinalFeedback(bool Ok, String  Msg);
	void __fastcall PrintProgressFeedback(int Progress, String Msg);

public:		// User declarations
	__fastcall TFCustomPreview(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFCustomPreview *FCustomPreview;
//---------------------------------------------------------------------------
#endif
