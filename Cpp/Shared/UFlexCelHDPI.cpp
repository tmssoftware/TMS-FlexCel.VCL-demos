#include "UFlexCelHDPI.hpp"

#pragma warn -hid
#include <gdiplus.h>
#pragma warn .hid
	
#include "Controls.hpp"
#include "StrUtils.hpp"
#include "SysUtils.hpp"
#include "Graphics.hpp"
#include "Math.hpp"
#include <vector>
#include <map>


static UnicodeString const EndDelim = "scale";
static UnicodeString const StartDelim = "_";

struct TImageListScale {
  public:
	TImageList* ImageList;
	int Scale;
	TImageList* CorrectedList;
	bool PerfectFit;

	TImageListScale();
	TImageListScale(TImageList* aImageList);
};

using namespace Gdiplus;
using namespace DllExports;


#if (__BORLANDC__ < 0x0710)
typedef void __fastcall (__closure *TMonitorDpiChangedEvent)(System::TObject* Sender, int OldDPI, int NewDPI);
#endif

class TFlexCelHDPI : public System::Classes::TComponent {
  private:
	TForm* Form;
	int FirstScale;
	TOnDPIChangedProc OnChange;
	TMonitorDpiChangedEvent FOldEvent;
  public:
	TFlexCelHDPI(TForm* aForm, int const aFirstScale,
	TOnDPIChangedProc aOnChange, TMonitorDpiChangedEvent aOldEvent);
	void __fastcall FormAfterMonitorDpiChanged(TObject* Sender, int OldDPI, int NewDPI);

  public:
	/* TComponent.Create */ inline __fastcall virtual TFlexCelHDPI(System::Classes::TComponent* AOwner) : System::Classes::TComponent(AOwner) { }
	/* TComponent.Destroy */ inline __fastcall virtual ~TFlexCelHDPI(void) { }

};


void Check(Status st) {
	if (st != Status::Ok) {
		throw new Exception("Error in GDI+: " + IntToStr(Int32(st)));
	}
}

void InitGDIPlus(ULONG_PTR & GdiToken) {
	GdiplusStartupInput StartupInput;

	if (GdiToken != 0)
		return;

	StartupInput.DebugEventCallback = NULL;
	StartupInput.SuppressBackgroundThread = false;
	StartupInput.SuppressExternalCodecs = false;
	StartupInput.GdiplusVersion = 1;
	Check(GdiplusStartup(&GdiToken, &StartupInput, NULL));
}

void ShutdownGDIPlus(ULONG_PTR & GdiToken) {
	if (GdiToken != 0)
		GdiplusShutdown(GdiToken);
	GdiToken = 0;
}

UnicodeString GetRoot(UnicodeString const & s) {
	int p_ = LastDelimiter(StartDelim, s);
	if (p_ <= 2)
		throw new Exception("Internal error");

	return s.SubString(1, p_ - 1);
}

int ExtractResolution(UnicodeString const & s) {
	if (!EndsText(EndDelim, s))
		return 0;
	int p_ = LastDelimiter(StartDelim, s);
	if (p_ <= 2)
		return 0;

	return StrToInt(s.SubString(p_ + StartDelim.Length(),
		s.Length() - p_ + 1 - StartDelim.Length() - EndDelim.Length()));
}

bool IsRooted(UnicodeString const & s) {
	return ExtractResolution(s) == 0;
}

bool IsBetterScale(int const & CurrentScale, int const & ProposedScale,
	int const & TargetScale) {
	if (CurrentScale < 0)
		return true;
	if (CurrentScale < TargetScale) {
		return (ProposedScale > CurrentScale);
	}

	return (ProposedScale >= TargetScale) && (ProposedScale < CurrentScale);
}

void ConvertImage(GpBitmap* & Img, ColorMatrix const & cm) {
	GpImageAttributes* imgAtt;
	GpBitmap* _Result;
	GpGraphics* gr;
	unsigned int Width;
	unsigned int Height;

	Check(GdipGetImageWidth(Img, &Width));
	Check(GdipGetImageHeight(Img, &Height));

	Check(GdipCreateImageAttributes(&imgAtt));
	try {
		Check(GdipSetImageAttributesColorMatrix(imgAtt, ColorAdjustTypeDefault, true, &cm, NULL, ColorMatrixFlagsDefault));
	    Check(GdipCreateBitmapFromScan0(Width, Height, 0, PixelFormat32bppARGB, NULL, &_Result));
		try {
            Check(GdipGetImageGraphicsContext(_Result, &gr));
			try {
				Check(GdipDrawImageRectRect(gr, Img, 0, 0, Width, Height, 0, 0,
					Width, Height, UnitPixel, imgAtt, NULL, NULL));
			}
			__finally {
				GdipDeleteGraphics(gr);
			}

		}
		catch (...) { {
				GdipDisposeImage(_Result);
				throw;
			}
		}
		GdipDisposeImage(Img);
		Img = _Result;
	}
	__finally {
		GdipDisposeImageAttributes(imgAtt);
	}
}

void ConvertToGrayscale(GpBitmap* & Img) {
	static double const lum = 1.1;

	ColorMatrix cm;

	cm.m[0][0] = 0.3 * lum;
	cm.m[0][ 1] = cm.m[0][0];
	cm.m[0][ 2] = cm.m[0][0];
	cm.m[0][ 3] = 0;
	cm.m[0][ 4] = 0;

	cm.m[1][ 0] = 0.59 * lum;
	cm.m[1][ 1] = cm.m[1][0];
	cm.m[1][ 2] = cm.m[1][0];
	cm.m[1][ 3] = 0;
	cm.m[1][ 4] = 0;

	cm.m[2][ 0] = 0.11 * lum;
	cm.m[2][ 1] = cm.m[2][0];
	cm.m[2][ 2] = cm.m[2][0];
	cm.m[2][ 3] = 0;
	cm.m[2][ 4] = 0;

	cm.m[3][ 0] = 0;
	cm.m[3][ 1] = 0;
	cm.m[3][ 2] = 0;
	cm.m[3][ 3] = 1;
	cm.m[3][ 4] = 0;

	cm.m[4][ 0] = 0;
	cm.m[4][ 1] = 0;
	cm.m[4][ 2] = 0;
	cm.m[4][ 3] = 0;
	cm.m[4][ 4] = 1;

	ConvertImage(Img, cm);
}

TBitmap* ScaleBitmap(int const & TargetSize, TImageList * Iml,
	int const & i, bool const & DisableIcon) {
	TBitmap* result;
	TBitmap* Bmp;
	GpBitmap* GPImg;
	GpGraphics* GPResultGr;

	// Getting the alpha channel right is difficult. If we draw the imagelist in a TPngImage.Canvas.HAndle or in a GDI+ DC, it loses the alpha channel.
	// So we need to draw it in a TBitmap.Canvas.Handle. But then, if we use GetDCFromHBitmpap or assign this bitmap to a png image, alpha is lost again.
	// If we save the bitmap to a stream and then load it with GDI+, alpha channel is lost.

	Bmp = new TBitmap();
	try {
		Bmp->PixelFormat = TPixelFormat::pf32bit;
		Bmp->Transparent = true;
		SetBkMode(Bmp->Canvas->Handle, TRANSPARENT);
		Bmp->SetSize(Iml->Width, Iml->Height);
		Bmp->AlphaFormat = afIgnored;
		ImageList_Draw((_IMAGELIST*)Iml->Handle, i, Bmp->Canvas->Handle, 0, 0, ILD_TRANSPARENT);
		// Here we have a bmp with alpha channel. We need to convert it to something GDI+ can read.

		Check(GdipCreateBitmapFromScan0(Iml->Width, Iml->Height,
			(IntPtr)Bmp->ScanLine[1] - (IntPtr)Bmp->ScanLine[0], PixelFormat32bppARGB,
			(unsigned char*)Bmp->ScanLine[0], &GPImg));
		try {
			if (DisableIcon)
				ConvertToGrayscale(GPImg);

			result = new TBitmap();
			try {
				result->PixelFormat = TPixelFormat::pf32bit;
				result->Transparent = true;
				SetBkMode(result->Canvas->Handle, TRANSPARENT);
				result->SetSize(TargetSize, TargetSize);
				result->AlphaFormat = afIgnored;
				Check(GdipCreateFromHDC(result->Canvas->Handle, &GPResultGr));
				try {
					Check(GdipSetInterpolationMode(GPResultGr,
						InterpolationModeHighQualityBicubic));
					Check(GdipSetSmoothingMode(GPResultGr,
						SmoothingModeAntiAlias));
					Check(GdipSetCompositingMode(GPResultGr,
						CompositingModeSourceOver));
					Check(GdipDrawImageRectI(GPResultGr, GPImg, 0, 0,
						TargetSize, TargetSize));
				}
				__finally {
					GdipDeleteGraphics(GPResultGr);
				}

			}
			catch (...) {
				result->Free();
				throw;
			}
		}
		__finally {
			GdipDisposeImage(GPImg);
		}
	}
	__finally {
		Bmp->Free();
	}
	return result;
}

void CopyImages(TImageListScale & Iml, int const & TargetScale) {
	int TargetSize;
	int i;
	TBitmap* Bmp;

	if (Iml.CorrectedList == NULL)
		return;
	TargetSize = SimpleRoundTo(Iml.CorrectedList->Width * 100.0 * 1.0 / ExtractResolution
		(Iml.CorrectedList->Name) * TargetScale * 1.0 / 100.0);
	Iml.ImageList->Clear();
	Iml.ImageList->Width = TargetSize;
	Iml.ImageList->Height = TargetSize; {
		long i_end = Iml.CorrectedList->Count;
		for (i = 0; i < i_end; ++i) {
			Bmp = ScaleBitmap(TargetSize, Iml.CorrectedList, i,
				!Iml.PerfectFit);
			try {
				Iml.ImageList->Add(Bmp, NULL);
			}
			__finally {
				Bmp->Free();
			}
		}
	}

}

void FixImageLists(TForm* Form, int const & TargetScale) {
	UnicodeString ImgRoot;

	std::map<UnicodeString, TImageListScale>BaseImageLists;
	std::vector<TImageList*>ResImageLists;
	long i_end = Form->ComponentCount;
	for (int i = 0; i < i_end; ++i) {
		if (Form->Components[i]->ClassType() == __classid(TImageList)) {
			if (IsRooted(Form->Components[i]->Name))
				BaseImageLists.insert(std::make_pair(Form->Components[i]->Name,
				TImageListScale((TImageList*)Form->Components[i])));
			else {
				ResImageLists.push_back((TImageList*)(Form->Components[i]));
			}
		}
	}

	{
		long i_end = ResImageLists.size();
		for (int i = 0; i < i_end; ++i) {
			ImgRoot = GetRoot(ResImageLists.at(i)->Name);
#if __clang__
			auto search =
#else
			std::_Tree<std::_Tmap_traits<UnicodeString, TImageListScale,
				std::less<UnicodeString>,
				std::allocator<std::pair< const UnicodeString,
				TImageListScale> >, 0> >::iterator search =
#endif
				BaseImageLists.find(ImgRoot);
			if (search == BaseImageLists.end())
				throw new Exception("Image list " + ResImageLists.at(i)->Name +
				" doesn\'t have a root. Verify it isn\'t misspelt.");

			TImageListScale RootImgList = search->second;

			if ((RootImgList.CorrectedList == NULL) || IsBetterScale
				(RootImgList.Scale,
				ExtractResolution(ResImageLists.at(i)->Name), TargetScale)) {
				RootImgList.CorrectedList = ResImageLists.at(i);
				RootImgList.Scale =
					ExtractResolution(ResImageLists.at(i)->Name);
				RootImgList.PerfectFit = true;
				BaseImageLists[ImgRoot] = RootImgList;
			}
		}

		{
			long i_end = ResImageLists.size();
			for (int i = 0; i < i_end;
			++i) // do disabled images after normal ones, so "real" disabled lists have preference.
			{
				ImgRoot = GetRoot(ResImageLists.at(i)->Name) + "Disabled";
      #if __clang__
  			auto search =
      #else
				std::_Tree<std::_Tmap_traits<UnicodeString, TImageListScale,
					std::less<UnicodeString>,
					std::allocator<std::pair< const UnicodeString,
					TImageListScale> >, 0> >::iterator search =
      #endif
					BaseImageLists.find(ImgRoot);
				if (search == BaseImageLists.end())
					continue;

				TImageListScale RootImgList = search->second;

				if (RootImgList.PerfectFit)
					continue;

				if ((RootImgList.CorrectedList == NULL) ||
					IsBetterScale(RootImgList.Scale,
					ExtractResolution(ResImageLists.at(i)->Name), TargetScale))
				{
					RootImgList.CorrectedList = ResImageLists.at(i);
					RootImgList.Scale =
						ExtractResolution(ResImageLists.at(i)->Name);
					BaseImageLists[ImgRoot] = RootImgList;
				}
			}
		}
#if __clang__
		for (auto i = BaseImageLists.begin(); i != BaseImageLists.end(); i++)
#else
		for (std::_Tree<std::_Tmap_traits<UnicodeString,TImageListScale,std::less<UnicodeString>,std::allocator<std::pair<const UnicodeString,TImageListScale> >,0> >::iterator i = BaseImageLists.begin(); i != BaseImageLists.end(); i++)
#endif
		{
			CopyImages(i->second, TargetScale);
		}
	}
}

void FixDynamicStuff(TForm* Form, int const & TargetScale) {
	ULONG_PTR GdipToken;

	GdipToken = 0;
	InitGDIPlus(GdipToken);
	try {
		FixImageLists(Form, TargetScale);
	}
	__finally {
		ShutdownGDIPlus(GdipToken);
	}
}

void __fastcall RegisterForHDPI(Vcl::Forms::TForm* const Form, TOnDPIChangedProc OnChange) {
	int TargetScale;
	TFlexCelHDPI* FlexCelHDPI;

	TargetScale = SimpleRoundTo(Form->PixelsPerInch * 1.0 / 96.0 * 100.0);
	#if (__BORLANDC__ >= 0x0710)
	FlexCelHDPI = new TFlexCelHDPI(Form, TargetScale, OnChange,
		Form->OnAfterMonitorDpiChanged);
	Form->InsertComponent(FlexCelHDPI);
	Form->OnAfterMonitorDpiChanged = FlexCelHDPI->FormAfterMonitorDpiChanged;
	#else
	FlexCelHDPI = new TFlexCelHDPI(Form, TargetScale, OnChange, (TMonitorDpiChangedEvent)NULL);
	Form->InsertComponent(FlexCelHDPI);
	#endif

	if (Form->PixelsPerInch == 96)
		return;
	FixDynamicStuff(Form, TargetScale);
	if (!!OnChange)
		OnChange();

}

/* TImageListScale */

 TImageListScale::TImageListScale() {
	ImageList = NULL;
	Scale = -1;
	CorrectedList = NULL;
	PerfectFit = false;
}

 TImageListScale::TImageListScale(TImageList* aImageList) {
	ImageList = aImageList;
	Scale = -1;
	CorrectedList = NULL;
	PerfectFit = false;
}

/* TFlexCelHDPI */

TFlexCelHDPI::TFlexCelHDPI(TForm* aForm, int const aFirstScale,
	TOnDPIChangedProc aOnChange,
	TMonitorDpiChangedEvent aOldEvent): TComponent(NULL){

	OnChange = aOnChange;
	FirstScale = aFirstScale;
	Form = aForm;
	FOldEvent = aOldEvent;
}

void __fastcall TFlexCelHDPI::FormAfterMonitorDpiChanged(TObject* Sender, int OldDPI,
	int NewDPI) {
	if (FOldEvent != NULL)
		FOldEvent(Sender, OldDPI, NewDPI);

	FixDynamicStuff(Form, NewDPI);
	if (OnChange != NULL)
		OnChange();
}

// END
