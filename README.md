# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.17.0.0


- **Full Support for Excel tables in xlsx files.** This  release completes the support for tables in the FlexCel API introduced in 6.11.
   * Tables are now exported to PDF/HTML/SVG/Images and printed with all the table formatting including banded columns and rows, etc. All formatting is supported.
   * Now FlexCel can recalculate the [structured references](https://support.office.com/en-us/article/Using-structured-references-with-Excel-tables-f5ed2452-2337-4f71-bed3-c8ae6d2b276e) used in tables. Everything is supported, from simple references like Table1[@column] to references in tables from another file. (for external table references you need to create a [Workspace](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TWorkspace/index.html) )
   * Complete API for adding, deleting or modifying tables with code. APIMate was modified to show how to use the new things in the API..
   * API for adding, deleting or modifying custom table styles. APIMate shows how to enter table styles with code.

- **Support for reading and writing Strict Open Xml files.** Now FlexCel can read and write [Strict Open XML spreadsheets](https://www.loc.gov/preservation/digital/formats/fdd/fdd000401.shtml)) The default is to save to strict xml only if you opened a strict xlsx file and saved it, in the other cases we fall back to the standard transitional xlsx. There is a new property [StrictOpenXml](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/StrictOpenXml.html) which you can set to force saving as strict xlsx, and read to know if the file you opened was strict xlsx.

- **Ability to add autoshapes to charts.** Now the existing method [ TExcelFile.AddAutoShape](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/AddAutoShape.html) works also in chart sheets, and there is a new method  [ TExcelChart.AddAutoShape](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelChart/AddAutoShape.html) that allows to add shapes to charts embedded inside a sheet.

- **FlexCel will now preserve embedded OLE objects in xlsx files.** Now FlexCel will preserve embedded OLE documents (like for example a word document) in xlsx files.

- **Improved perfomance in reports with thousands of hyperlinks.** Now FlexCel is much faster dealing with thousands of hyperlinks in reports.

- **<#row height> and <column widht> tags in reports now accept expressions.** Now you can write something like <#row height(<#someexpression>)> where expression will be calculated at the moment of running the report.

- **Now FlexCel converts strings with timestamps to dates more like Excel.** In Excel you can write a string with an invalid timestamp like "3:61" (3 hours 61 minutes, which is 4 hours 1 minute) and it will be accepted by the system. FlexCel was rejecting those timestamps, but now it accepts them just like Excel.

- **Support for #GETTING_DATA error in TFlxFormulaErrorValue.** The enumeration [TFlxFormulaErrorValue](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TFlxFormulaErrorValue.html) now contains a new ErrGettingData member which corresponds to the type in Excel. Also [Error.Type](https://support.office.com/en-us/article/ERROR-TYPE-function-10958677-7c8d-44f7-ae77-b9a9ee6eefaa) function will return 8 for this error. Note that Excel doesn't save this error in xlsx files (it saves #N/A instead), but it does save it in xls files. FlexCel preserves it in both.

- **Better support for comments in xlsx file in high dpi.** The size of the comments is preserved better now when ScreenScaling is > 0

- **Now TExcelFile.RenderObject can render shapes inside groups and use an objectPath parameter to specify the name of theobject to render.** There are new overloads in [ TExcelFile.RenderObjects](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/RenderObject.html) and [ TExcelFile.RenderObjectAsSVG](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/RenderObjectAsSVG.html) that take an **objectPath** parameter. This allows you to render an individual shape inside a group instead of the full group, and also to specify directly the name of the shape to render as in `xls.RenderObject(1,"@objectname")`

- **Reduced memory usage when loading fonts for exporting to PDF.** We've optimized the pdf font engine so it sues less memory when loading the fonts.

- **Suport for returning arrays with the INDIRECT function.** When doing a *Sum*, *SumIf* or N of an *Indirect* function which returned an array, FlexCel worked like Excel 2003 or older and only used the first value of the array. Now it uses the full array in *SumIf* and N like Excel 2007 or newer, and in *Sum*, like Excel 2010 or newer. This allows you to write formulas like the ones mentioned here: [https://www.pcreview.co.uk/threads/indirect-function-limitations.1750391/](https://www.pcreview.co.uk/threads/indirect-function-limitations.1750391/) 
Note that this formula behavior is exclusive to Excel 2010 or newer: Neither LibreOffice or Google docs implement it.

- **All examples available in Github.** Now besides being available with the setup and at the [documentation site](http://www.tmssoftware.biz/flexcel/doc/vcl/samples/index.html) the examples are also available on [Github](https://github.com/tmssoftware/TMS-FlexCel.VCL-demos)

