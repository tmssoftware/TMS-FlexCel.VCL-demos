# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.10 - August 2021


- **Support for SVG images embedded in xlsx files.** Excel has recently started allowing SVG images inside xlsx files. This releases adds full support for adding and reading SVG images to/from xlsx files. Note that we don't currently have a SVG renderer, so to add a SVG image you need to provide both an SVG and a PNG image. you can get more details in [this tip](https://doc.tmssoftware.com/flexcel/vcl/tips/svg-files-inside-xlsx-files.html)

- **Breaking Change: Now when exporting to HTML and SVG, the SVG images stored inside the file will be embedded as SVG.** Before, FlexCel would always embed the PNG fallback image. To keep the old behavior, there are 2 new properties: [ TFlexCelHtmlExport.RasterizeSVGImages](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Render/TFlexCelHtmlExport/RasterizeSVGImages.html) and [ TFlexCelSvgExport.RasterizeSVGImages](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Render/TFlexCelSvgExport/RasterizeSVGImages.html)

- **Ability to add chart sheets with the API.** There is a new method [AddChartSheet](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/AddChartSheet.html) which will allow you to add chart sheets with the API. As usual, APIMate will show you the code needed to add a chart sheet.

- **Ability to link shape text to cells via the API.** The new methods [GetShapeLinkedCell](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/GetShapeLinkedCell.html),  [SetShapeLinkedCell](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/SetShapeLinkedCell.html) in [ TExcelFile](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/) and [GetShapeLinkedCell](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IExcelChart/GetShapeLinkedCell.html),  [SetShapeLinkedCell](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IExcelChart/SetShapeLinkedCell.html) in [ IExcelChart](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IExcelChart/) allow you to read and write linked text in shapes.

- **Full Window management via API.** There is a new property [ActiveWindow](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/ActiveWindow.html) which allows you to select the [window](https://support.microsoft.com/en-ie/office/close-workbooks-or-workbook-windows-ca74dca4-8d2f-43f9-84e1-f9a1b1621d26) you are working on. You can then set the zoom, selected cells, etc. for that window, leaving the other windows unaffected. The new commands  [AddWindow](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/AddWindow.html) and  [DeleteWindow](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/DeleteWindow.html) allow you to add or delete windows.  [WindowCount](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/WindowCount.html) will let you know how many windows you have in the file. [ActiveSheetForActiveWindow](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/ActiveSheetForActiveWindow.html) will let you select an active sheet for each window, even if the ActiveSheet for FlexCel won't change.

- **Includes in reports can now be FIXED.** Now you can use the word FIXED in the "Shift type" parameter of the [include tag](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#include) . Fixed includes won't insert rows or columns, just overwriting the cells in the main report.

- **Support for recalculation of function NUMBERVALUE.** Now FlexCel can recalculate the [NUMBERVALUE](https://support.microsoft.com/en-us/office/numbervalue-function-1b05c8cf-2bfa-4437-af70-596c7ea7d879) function introduced in Excel2013. As usual, the list of supported Excel functions is at [supported-excel-functions.html](https://doc.tmssoftware.com/flexcel/vcl/about/supported-excel-functions.html) in the docs

- **Ability to set shape effects like glow or shadow with the API.** Now you can set shape effects with the API, and APIMate will tell you the code to do it.

- **Improved recalculation speed.** We've implemented caches for some common formula patterns which should make your recalculations go much faster if your files use those patterns.

- **Improved support for Tiff and Gif images.** FlexCel used to convert tiff and giff images to png when loading them, so they could be saved inside xls files (xls files don't support those formats). Now FlexCel will preserve the file formats, and only convert them to pngs if you are saving in xls format.

- **Improved HTML5 exporting.** We've made the html5 files generated by FlexCel more compliant with html5 validators.

- **Improved drawing of shape shadows for xlsx files.** FlexCel will now render better the shadows in shapes inside xlsx files.

- **Improved drawing of log-chart gridlines.** Now the gridlines in logarithmic charts behave more similar to Excel in border cases

- **Comments added with the API won't include a shadow.** Now when you add a comment with the API, it won't include a shadow, same as modern Excel doesn't when you add a note. You can always use SetCommentProperties to add a shadow if you want to, and APIMate will show you the code.

- **Bug Fix.** Excel could crash with files including charts with Soft edges effect.

- **Improved handling of linked text in autoshapes.** Now FlexCel will preserve the properties of empty linked text in autoshapes. It will also handle better shapes with text linked to names that reference different sheets.

- **Bug Fix.** Sometimes FlexCel could fail to parse formulas with hard-coded arrays which had strings inside.

- **Bug Fix.** Conditional formats with iconsets where some values of the iconset were "No icon" could be saved wrong.

- **Bug Fix.** Comments could lose or gain a shadow when converting from xls to xlsx or xlsx-strict. Also colors in the comments could be wrong in border cases.

- **Bug Fix.** When renaming tables FlexCel wasn't renaming references in column formulas

- **Bug Fix.** FlexCel could crash when rendering chart labels with "Value from cells" if the range existed but was null.

- **Bug Fix.** Accessing some Conditional formats with inner borders could cause an Exception.

- **Bug Fix.** FlexCel would not export to pdf 3rd-party files which had unreadable file properties.

- **Bug Fix.** When using &lt;#database.#rowcount> in expressions outside the sheet, you could get an exception.

- **Bug Fix.** FlexCel could throw an exception when inserting columns in xls files with invalid external references

- **Bug Fix.** FlexCel could throw an Exception when manually adding an autoshape to a chart that was created via the API.

- **Bug Fix.** Better compatibility with files generated by FastReports. Excel ignores border style 0 and fill styles 0 and 1, and now FlexCel ignores those too.

- **Better handling of third-party xls files.** Now FlexCel will convert the deprecated labels in biff8 xls files to sstlabels instead of keeping them as-is, allowing for much decreased memory usage when reading those files, and smaller result files.

- **Bug Fix.** Text to autoshapes added with the API would always be left-aligned.

- **Bug Fix.** FlexCel could report the BOM when reading custom XML parts inside xlsx files. Now the BOM is stripped out as it should.

- **Bug Fix.** Reports using TDataSets in master-detail could get the wrong results if both master and detail had the same underlying dataset.

- **Bug Fix.** ApiMate would not suggest how to add a shape without borders

