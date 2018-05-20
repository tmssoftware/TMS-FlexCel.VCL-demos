# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.19.5 - May 2018


- **Now functions CUMIPMT and CUMPRINC are supported when recalculating.** Now FlexCel can recalculate the functions [CUMIPMT](https://support.office.com/en-us/article/cumipmt-function-61067bb0-9016-427d-b95b-1a752af0e606) and [CUMPRINC](https://support.office.com/en-us/article/cumprinc-function-94a4516d-bd65-41a1-bc16-053a6af4c04d)

- **New methods GetTokens and SetTokens in ExcelFile allow you to parse arbitrary text.** The new methods [GetTokens](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/GetTokens.html) and  [SetTokens](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/SetTokens.html) allow you to parse any text into tokens and then convert those tokens back into a string. Those methods complement the existing [GetFormulaTokens](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/GetFormulaTokens.html) and [SetFormulaTokens](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/SetFormulaTokens.html)

- **The XlsChart object now returns the 3D properties for xls charts.** Now you can read the 3D properties in charts inside xls files.

- **Improved Excel 95 compatibility.** Now FlexCel can read some Excel 95 files which would throw errors before.

- **Now FlexCel preserves "new style" sheet and workbook protections in xlsx files.** Both FlexCel and Excel use an old algorithm to compute sheet and workbook protections, and they both keep doing it this way as it is the only way to port the protections between xlsx and xls files. But some third party generated files could have a newer style of protections which are incompatible with xls and FlexCel wasn't understanding them. Now FlexCel will preserve those new style protections in xlsx files too. The new style protections will be lost if you save as xls, but that happens in Excel too.

- **When wrapping text, now FlexCel recognizes different kind of unicode spaces.** Now other spaces in addition of character 32 are used as separators when rendering the file and wrapping the text. Note that not breaking spaces (char 160) are still not used as separators as they aren't supposed to break a line.

- **Bug Fix.** SetCellFormat with ApplyFormat could format the cells wrong if the cells were empty and there was column or  row format applied.

- **Bug Fix.** Sometimes when copying sheets form different files, some named ranges would not be copied.

- **Bug Fix.** Khmer text could be rendered wrong is some rare cases.

- **Bug Fix.** When exporting to pdf you could get an error if a character didn't exist and fallbackfonts was empty.

