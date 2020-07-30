//---------------------------------------------------------------------------

#include <vcl.h>
#include <IOUtils.hpp>
#include <System.Threading.hpp>
#pragma hdrstop

#include "UMainForm.h"
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
if (cbAutoOpen->Checked) AutoOpenRun(); else NormalRun();
}
//---------------------------------------------------------------------------

String __fastcall TMainForm::GetDataPath()
{
	return TPath::Combine(TPath::GetDirectoryName(ParamStr(0)), "..\\..");
}
//---------------------------------------------------------------------------


void __fastcall TMainForm::Setup(TFlexCelReport* ReportStart, String UserName, String UserUrl, String DataPath)
{
  //Set report variables, including an image.

  ReportStart->SetValue("Date", TReportValue::Create(TCellValue::Create(Now())));
  ReportStart->SetValue("Name", TReportValue::Create(TCellValue::Create(UserName)));
  ReportStart->SetValue("TwoLines", TReportValue::Create(TCellValue::Create((String)L"First line\r\nSecond Line")));
  ReportStart->SetValue("Empty", TReportValue::Empty());
  ReportStart->SetValue("LinkPage", TReportValue::Create(TCellValue::Create(UserUrl)));

  //C++ builder defines assignment to TReportValue, but not creation. So we need to do this in 2 lines:
  //TReportValue ImgData = SomeBytes; wouldn't work.
  TReportValue ImgData;
  ImgData = TReportValue::_op_Implicit(TFile::ReadAllBytes(TPath::Combine(DataPath, "img.png")));
  ReportStart->SetValue("Img", ImgData);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::NormalRun()
{
 if (!SaveDialog->Execute()) return;

  TFlexCelReport* Report = new TFlexCelReport(true);
  __try
  {
	Setup(Report, edName->Text, edURL->Text, GetDataPath());
    //FlexCel doesn't do a 100% accurate conversion between xls and xlsx, it isn't designed for that
	//So to create an xls file is it best to use an xls template, and for xlsx and xlsx template.
    String FileExt;
	if (TPath::GetExtension(SaveDialog->FileName) == ".xlsx") FileExt = ".xlsx"; else FileExt = ".xls";

	Report->Run(
	  TPath::Combine(GetDataPath(), "Getting Started Reports.template" + FileExt),
	  SaveDialog->FileName);
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

#ifndef __clang__
class TDeleteFileTask : public TCppInterfacedObject<TProc> {
public:
  String FileName;

   TDeleteFileTask(String aFileName)
   {
		  FileName = aFileName;
   }

	void __fastcall Invoke() {
		 TThread::Sleep(30000); //wait for 30 secs to give Excel time to start.
		 TFile::Delete(FileName);  //As it is an xltx file, we can delete it even when it is open on Excel.
    }
};
#endif

void __fastcall TMainForm::AutoOpenRun()
{
  TFlexCelReport* Report = new TFlexCelReport(true);
  __try
  {
	Setup(Report, edName->Text, edURL->Text, GetDataPath());

	String FilePath = TPath::GetTempPath();  //GetTempFileName does not allow us to specify the "xltx" extension.
	GUID g;
	if (CreateGUID(g) != 0)
	{
		throw new Exception("Can't create GUID");
    }
	String FileName = TPath::Combine(FilePath, GUIDToString(g) + ".xltx");  //xltx is the extension for excel templates.
	__try
	{
	  Report->Run(
		TPath::Combine(GetDataPath(), "Getting Started Reports.template.xlsx"), FileName);
		ShellExecute(0, L"", FileName.c_str(), NULL, NULL,
			SW_SHOWNORMAL);
	}
	 __finally
	 {
       //See https://doc.tmssoftware.com/flexcel/vcl/tips/automatically-open-generated-excel-files.html

#ifdef __clang__
	   TTask::Run([&]() {
		 TThread::Sleep(30000); //wait for 30 secs to give Excel time to start.
		 TFile::Delete(FileName);  //As it is an xltx file, we can delete it even when it is open on Excel.
		 });
#else
   //Classic compiler doesn't support lambdas.
	   TTask::Run(_di_TProc(new TDeleteFileTask(FileName)));

#endif
	 }

  }
  __finally
  {
	Report->Free();
  }

}
//---------------------------------------------------------------------------

