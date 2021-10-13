# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.12 - October 2021


- **PowerBI Data models are now preserved.** FlexCel will now preserve PowerBI datamodels in xlsx files.

- **Bug Fix.** GetImageProperties could return an index out of bounds when passed a valid imageindex but there were grouped images.

- **Bug Fix.** [TFlexCelPrintDocument.PrintAllVisibleSheets](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Render/TFlexCelPrintDocument/PrintAllVisibleSheets.html#tflexcelprintdocumentprintallvisiblesheets-method) wouldn't print if resetPageNumberOnEachSheet was true.

- **Bug Fix.** In Delphi XE, XE2 and XE3 there could be issues with sheet names using accented characters. This was already working fine for XE4 or newer.

- **Setup now allows to enable full RTTI.** FlexCel by default disables RTTI on its classes and methods to produce smaller executables. But some apps like tms scripter studio require RTTI to work. Now the installer offers the option to enable RTTI. With RTTI enabled, you can expect a size increase in your exes of 2-3mb.

