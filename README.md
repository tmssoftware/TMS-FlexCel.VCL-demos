# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.16 - September 2022


- **Support iOSSimulator Arm64.** There is now support for the new iOS Simulator Arm in Delphi 11.2

- **Support for different numeric systems in cell formatting.** Now if you format a cell with a different numeric system like for example "[$-2000000]#,##0.00", FlexCel will render those numbers correctly. (see [https://ansarichat.wordpress.com/2018/02/20/how-to-type-arabic-numerals-in-excel/](https://ansarichat.wordpress.com/2018/02/20/how-to-type-arabic-numerals-in-excel/) )

- **Bug Fix.** When rendering charts that used =Offset to define the data, and some columns or rows were hidden, FlexCel could fail to hide the values when the chart was set to not plot hidden cells.

- **Bug Fix.** In some rare cases when there was merged cells whose first cell was hidden the background might not be exported to pdf.

- **Bug Fix.** If printing gridlines and there were hidden columns or rows, the gridlines could be printed over the real borders of a cell.

- **Bug Fix.** When exporting to CSV, there could be errors if you manually set cell values to NaN.

- **Bug Fix.** If exporting to PDF and the "normal" font of the spreadsheet was Calibri 9 columns could be wider than expected.

- **Bug Fix.** When exporting in Linux the pdfs could be wrong, due to a bug in Delphi. This release workarounds this bug and allows correct exporting from Linux.

- **Bug Fix.** FlexCel could hang while loading some invalid third-party files.

