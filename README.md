# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.22 - October 2018


- **Support for Excel 2019.** Because we support Excel 365 and changes in Excel 2019 are a recollection from the changes in office 365 from 2016 up to now, FlexCel already supported Excel 2019. For example, support for recalculating the new functions introduced in Excel 2019 was introduced by [FlexCel 6.7.16](http://www.tmssoftware.biz/flexcel/doc/vcl/about/whatsnew.html#new-on-v-67160---march-2016) back in march 2016. But this new FlexCel version adds a new TRecalcVersion.Excel2019 enumeration which will [avoid the question about saving for changes when closing the file](http://www.tmssoftware.biz/flexcel/doc/vcl/guides/api-developer-guide.html#avoiding-the-want-to-save-your-changes-dialog-on-close). It also adds a "v2019" enumeration to TFileFormats, which allows you to specify you want the file to identify itself as office 2019 and comes with empty 2019 files to be created with NewFile. Empty 2019 files are virtually identical to empty 2016 files, but the colors "Accent1" and "Accent5" in Excel 2016 are swapped to correspond to "Accent5" and "Accent1" respectively in Excel 2019.

- **Reports now can use tables as datasources.** Now you can use Excel tables as sources for reports. Take a look at the new [Tables as datasources](http://www.tmssoftware.biz/flexcel/doc/vcl/samples/delphi/reports/tables-as-datasources/index.html) demo and the [section about excel tables in the Report designers guide](http://www.tmssoftware.biz/flexcel/doc/vcl/guides/reports-designer-guide.html#excel-table-bands).

- **New method to rename tables.** The new method [RenameTable](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/RenameTable.html) can rename a table to a newer name, changing all references in formulas to the new name.

- **New Debug mode for Intelligent Page Breaks.** Now you can use the property [DebugIntelligentPageBreaks](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Report/TFlexCelReport/DebugIntelligentPageBreaks.html) in a report, or the methods [DumpKeepRowsTogetherLevels](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/DumpKeepRowsTogetherLevels.html) and [DumpKeepColsTogetherLevels](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/DumpKeepColsTogetherLevels.html) in the API to debug how intelligent page breaks are working. Look at [intelligent page breaks in the API Guide](http://www.tmssoftware.biz/flexcel/doc/vcl/guides/api-developer-guide.html#intelligent-page-breaks) for more information on how to use the feature.

- **Better drawing of conditional formats at very low or high zoom levels.** Now icons and databars in conditional formats dynamically adjust the margins to look better at high or low zoom levels.

- **Bug Fix.** Cell indent was not being considered when autofitting rows or columns.

- **Bug Fix.** FlexCel wouldn't let you rename a sheet to the same name but with different upper or lower cases.

- **Bug Fix.** CountIF, CountIFs and similar xIf/xIfs functions could return ERRNA if one of the conditions was an unknown user function, instead of returning 0 as Excel does.

- **Bug Fix.** The function Rank.EQ was ignoring cells with errors while Excel returns the first cell with error if any cell in the range has an error.

- **Bug Fix.** Inside a <#preprocess> section of a report a <#delete row> or <#delete column> tag could end up deleting the wrong column.

- **Bug Fix.** Error when calculating What-If tables that had their variables in a different sheet.

- **Bug Fix.** When deleting rows in reports with multiple levels of intellignet page breaks the engine could calculate more page breaks than necessary.

- **Bug Fix.** FlexCel will now validate that a table isn't named the same as a defined name or vice-versa, to avoid creating invalid Excel files.

- **Bug Fix.** When rendering a file to pdf or images FlexCel could pick the wrong normal font in very rare cases.

- **Bug Fix.** Reports in DataSets with primary keys of type GUID could throw a null reference exception if the master key didn't exist for a detail instead of outputting an empty row.

- **Bug Fix.** APIMate could report code that wouldn't compile for embedded xml content.

