# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.23 - November 2018


- **Delphi 10.3 Rio Support.** FlexCel now supports Delphi 10.3 Rio.

- **New methods UnshareWorkbook and IsSharedWorkbook in TExcelFile.** The method [UnshareWorkbook](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/UnshareWorkbook.html) allows you to remove all tracking changes from an xls file. (FlexCel doesn't preserve tracking changes in xlsx files). [IsSharedWorkbook](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/IsSharedWorkbook.html) allows you to know if an xls file is a shared workbook.

- **New method PivotTableCountInSheet in TExcelFile.** The method [PivotTableCountInSheet](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/PivotTableCountInSheet.html) returns the number of pivot tables in the active sheet.

- **Support for calculating function RANK.AVG.** Added support to calculate the Excel function Rank.AVG which was introduced in Excel 2010. See [supported excel functions](http://www.tmssoftware.biz/flexcel/doc/vcl/about/supported-excel-functions.html#added-functions-in-excel-2010).

- **Now you can find see the call stack in circular formula references when you call RecalcAndVerify.** Now [RecalcAndVerify](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/RecalcAndVerify.html) will report the call stack that lead to a cell recursively calling itself, making it simpler for you to track those down in complex spreadsheets. Take a look at the modified [Validate Recalc demo](http://www.tmssoftware.biz/flexcel/doc/vcl/samples/delphi/api/validate-recalc/index.html) with a file with circular references to see how it works.

- **The installer should now install anyway even if your MSBuild command line is longer than 32000 characters.** FlexCel will now not check for invalid command lines and install anyway even if your Delphi installation has a search path which is too big.

- **Bug Fix.** Some xlsx files with legacy headers could fail to load.

- **Bug Fix.** The function IFNA could in very rare corner cases return #N/A if its first parameter was #N/A instead of returning the second parameter.

- **Bug Fix.** There could be an error when copying sheets between workbooks and the sheet copied had a shape with a gradient.

- **Bug Fix.** Floating point numbers that were either infinity or not-a-number were saved wrong in the files and Excel would complain when opening them. Now they will be saved as #NUM! errors. Note that this only happened if you set a cell value explicitly to Double.NAN or Double.Infinity. Formula results which were infinity or nan were already handled fine.

