# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.20 - June 2018


- **Full support for reading and writing Data Connections in xlsx files.** Now you can use the new methods [GetDataConnections](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/GetDataConnections.html) and [SetDataConnections](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/SetDataConnections.html) for reading and writing the data connections in xlsx files. As usual, APIMate will show you the commands needed to enter new DataConnections.
Note that the new methods only work in xlsx files, not xls, and there is no support for refreshing data queries from FlexCel. Only to read or write connections.

- **Improved performance with thousands of merged cells.** We rewrote the merged cell handling engine to make it faster and work better when there are thousands of merged cells.

- **Breaking Change: Improved chart rendering.** Now FlexCel recalculates the size of the legends of the charts if those are docked to the top, bottom, right, left or top-right. So if the size of the series change, the legend box and the rest of the chart will adapt.
There are also other small tweaks in the chart rendering engine to make xls charts more faithful to what Excel shows. **Note**: The Excel chart engine has changed a lot since the Excel 2003 times, and Excel 2003 doesn't display charts exactly as Excel 2016. We can't make it work both ways, so this update makes the chart rendering more like Excel 2016. If you were rendering old files and relied in the exact position of the legend, this update might move the position of the legend a little, to position it how Excel 2016 would and not how Excel 2003 would. This is why it is a breaking change.

- **New overloads for methods SetCellFromString and GetStringFromCell now accept cell references.** The methods [SetCellFromString](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/SetCellFromString.html) and [GetStringFromCell](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/GetStringFromCell.html) now can use references like A1 or "Sheet1!B3". This is a shortcut in using a [TCellAddress](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TCellAddress/index.html) object to get the row and column from the reference.

- **New overload for method TPartialExportStart.SaveCss which allows to save the css without the <style> and </style> tags.** There is now an overload of [TPartialExportState.SaveCss](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Render/TPartialExportState/SaveCss.html) with a parameter that allows to get the inner html of the classes definition, without the <style> and </style> enclosing tags.

- **Bug Fix.** Memory leak with color scale conditional formats when calling InsertAndCopyRange.

- **Bug Fix.** There could be an error in GDI+ when exporting emf images to html

- **Bug Fix.** The [Copy and Paste](http://www.tmssoftware.biz/flexcel/doc/vcl/samples/delphi/api/copy-and-paste/index.html) demo wasn't correctly copying the data in TEXT format. Now it shows the correct way to copy text to the clipboard.

- **Bug Fix.** Setup wasn't generating hpp files for iOS and Android with Delphi Tokyo.

