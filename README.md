# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.18 - August 2023


- **Support for the new Excel2023 default format including the default aptos font.** Now when calling [ExcelFile.NewFile](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/NewFile.html) there is a new option to create a file with the new office 2023 theme and fonts.

- **Added new units FlexCel.VCLSupport, FlexCel.FMXSupport, FlexCel.LCLSupport and FlexCel.SKIASupport to replace VCL.FlexCel.Core, FMX.FlexCel.Core, LCL.FlexCel.Core and SKIA.FlexCel.Core respectively.** The units  VCL.FlexCel.Core, FMX.FlexCel.Core, LCL.FlexCel.Core and SKIA.FlexCel.Core still work, but we added new units FlexCel.PlatformSupport which should be preferred now as they behave better in C++ builder. You can read more about this change at [VCL.FlexCel.Core vs FlexCel.VCLSupport](https://doc.tmssoftware.com/flexcel/vcl/tips/vcl-flexcel-core-vs-flexcel-vclsupport.html)

- **New property TExcelFile.PrintComments allows to directly manipulate how to print the comments.** The new property [ExcelFile.PrintComments](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintComments.html) allows you to directly change how comments are printed without having to use  [TExcelFile.PrintOptions](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintOptions.html).

- **FlexCel can now render comments "As displayed".** When  [ExcelFile.PrintComments](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintComments.html) is "As Displayed", FlexCel will now print and export to PDF/HTML/SVG the comments as they are displayed. See  [https://support.tmssoftware.com/t/excel-with-comments-export-to-pdf-with-comments-showing/19377](https://support.tmssoftware.com/t/excel-with-comments-export-to-pdf-with-comments-showing/19377)

- **New property TExcelFile.PrintErrors allows to directly manipulate how to print the errors in formulas inside the sheet.** The new property [ExcelFile.PrintErrors](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintErrors.html) allows you to change how the errors in the sheet will be printed.

- **FlexCel can now render error in formulas according to the printer settings.** When  [ExcelFile.PrintErrors](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintErrors.html) is not "As Displayed", FlexCel will now print and export to PDF/HTML/SVG the correct values.

- **New properties TExcelFile.PrintOptionsInitializedFromPrinter, TExcelFile.PrintOverThenDown and TExcelFile.PrintDraftQuality.** The new properties  [ExcelFile.PrintOptionsInitializedFromPrinter](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintOptionsInitializedFromPrinter.html), [ExcelFile.PrintOverThenDown](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintOverThenDown.html) and  [ExcelFile.PrintDraftQuality](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintDraftQuality.html)  allow to change the  [TExcelFile.PrintOptions](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintOptions.html) in a simpler way. Now there are properties to change every one of the individual  [PrintOptions](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintOptions.html), and so APIMate won't suggest changing  [PrintOptions](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintOptions.html), but the standalone properties instead. APIMate will still show the code to change  [PrintOptions](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintOptions.html), but commented out.

- **ApiMate won't show PrinterDriverSettings by default.** PrinterDriverSettings are a huge binary blob which can make the output of APIMate much harder to read. It was already commented out, but now it is not shown at all by default. There is a checkbox to show it if you need it.

- **Bug Fix.** When rendering charts inside xlsx files, sometimes FlexCel could fail to render the correct colors of some series, using black instead.

- **Bug Fix.** Formatted numbers inside cells with "Shrink to fit" didn't shrink when exporting to HTML

- **Bug Fix.** &lt;#if> tag in reports would consider the condition true if it evaluated to NAN or a number.

- **Bug Fix.** &lt;#ref> tag in reports now returns a real reference instead of a string with the cell reference. While for most uses it is the same, in some cases like in the "Cell" function, the old &lt;#ref> tag wouldn't work.

