# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.19 - September 2023


- **New property FlexCelSVGExport.Encoding allows you to change the encoding when generating SVG files.** Now you can change the Encoding of generated SVG files by using the new property [FlexCelSVGExport.Encoding](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Render/TFlexCelSVGExport/Encoding.html)

- **Breaking Change: Now FlexCel will default the encoding when to exporting to CSV or SVG to UTF-8 without BOM.** FlexCel used to use UTF-8 with BOM to save CSV or SVG files if you didn't specify an encoding. Now the default encoding is UTF-8 with BOM, which is more common. You can still specify an explicit Encoding as UTF-8 with BOM when saving those files if you want to, but if you are not specifying a default, the generated text files will change.

- **Now FlexCel will write the xml inside xlsx files as UTF-8 without BOM.** FlexCel used to write the xml inside xlsx files as UTF-8 with BOM, which is valid and works fine, but some third party tools could have issues reading those files. Excel writes the xml as UTF-8 without BOM itself, so this is not a breaking change. See [https://support.tmssoftware.com/t/save-utf-8-without-bom/21577](https://support.tmssoftware.com/t/save-utf-8-without-bom/21577)

- **Bug Fix.** In some rare cases when you entered #N/A as a parameter in a formula, the full formula would become #N/A. See [https://support.tmssoftware.com/t/handling-of-n-a-in-formuals-on-loading-excel-file/21425](https://support.tmssoftware.com/t/handling-of-n-a-in-formuals-on-loading-excel-file/21425)

- **Bug Fix.** Page numbers in headers and footers were invalid when exporting to SVG.

- **Bug Fix.** GetStringFromCell could return invalid values when the cell contained a formula. This was a regression in v7.18 from v7.17. See [https://support.tmssoftware.com/t/xls-getstringfromcell-read-cell-in-version-7-17-but-not-in-v7-18/21545](https://support.tmssoftware.com/t/xls-getstringfromcell-read-cell-in-version-7-17-but-not-in-v7-18/21545)

- **Bug Fix.** FlexCel could write some invalid DXF records when saving table styles to xls files.

- **Bug Fix.** InsertAndCopyRange could fail to copy cells in some corner cases

