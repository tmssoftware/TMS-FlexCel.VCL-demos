#pragma once
#ifndef INCLUDED_UFLEXCELHDPI_H
#define INCLUDED_UFLEXCELHDPI_H
 

#include <Vcl.Forms.hpp>
#include <System.Classes.hpp>

typedef void __fastcall (__closure *TOnDPIChangedProc)(void);
void __fastcall RegisterForHDPI(Vcl::Forms::TForm* const Form, TOnDPIChangedProc OnChange);
#endif//INCLUDED_UFLEXCELHDPI_H

