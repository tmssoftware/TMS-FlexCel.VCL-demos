//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "UMainForm.h"
#include <IOUtils.hpp>

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TMainForm *MainForm;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::btnCancelClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::btnGoClick(TObject *Sender)
{
  RunReport();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::GetIncludes(TObject* sender, TGetIncludeEventArgs* e)
{
  TResourceStream* IncReport = new TResourceStream((int)HInstance, TPath::GetFileNameWithoutExtension(e->FileName), RT_RCDATA);
  __try
  {
	TBytes b;
	b.Length = IncReport->Size;
	if (b.Length > 0) IncReport->Read(b, b.Length);
	e->IncludeData = b;
  }
  __finally
  {
	IncReport->Free();
  }
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::RunReport()
{
  if (!SaveDialog->Execute()) return;

  TFlexCelReport* Report = new TFlexCelReport(true);
  __try
  {
	Report->GetInclude = GetIncludes; //this is only needed if you have includes.
	Report->AddTable(DemoTables);
	Report->SetValue("Date", TReportValue::Create(TCellValue::Create(Now())));

	TResourceStream* TemplateStream = new TResourceStream((int)HInstance, "TemplatesOnTheExe", RT_RCDATA);
	__try
	{
	  TStream* OutputStream = new TFileStream(SaveDialog->FileName, fmCreate);
	  __try
	  {
		Report->Run(TemplateStream, OutputStream);
	  }
	  __finally
	  {
		OutputStream->Free();
	  }
	}
	__finally
	{
	  TemplateStream->Free();
	}
  }
  __finally
  {
	Report->Free();
  }

 if (MessageDlg(L"Do you want to open the generated file?", mtConfirmation,
	  TMsgDlgButtons() << mbYes << mbNo, 0) == mrYes)
	  {
			ShellExecute(0, L"open", SaveDialog->FileName.c_str(), NULL, NULL,
			SW_SHOWNORMAL);
	  }


}
//---------------------------------------------------------------------------

