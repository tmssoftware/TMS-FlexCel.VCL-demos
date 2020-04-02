# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.5 - April 2020


- **Support for adding charts to a sheet with the API (xlsx files only).** A new method [AddChart](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxFile/AddChart.html) will allow you to add a chart to a sheet in xlsx files, which you can then customize with other methods like [AddSeries](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/AddSeries.html). There is a new demo [Chart API](http://www.tmssoftware.biz/flexcel/doc/vcl/samples/delphi/api/chart-api/index.html), and as usual, **APIMate** will show how to add a chart similar to one in Excel. Note that this method will work only in xlsx files, not xls.

- **New  methods SetTitle, SetOptions, SetChartLegend, SubchartCount, GetSeriesInSubchart, SetSeriesInSubchart and AddSubchart in ExcelChart.** The new method [SetTitle](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/SetTitle.html) will allow  you to set the title of a chart. [SetOptions](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/SetOptions.html) will allow you to customize the properties of the chart. [SetChartLegend](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/SetChartLegend.html) customizes the legend or adds a new one.  [SubchartCount](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/SubchartCount.html) will tell you how many subcharts there are in the main chart.  [GetSeriesInSubchart](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/GetSeriesInSubchart.html) and [SetSeriesInSubchart](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/SetSeriesInSubchart.html) allow you to read or set one series of one subchart. [AddSubchart](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/AddSubchart.html) adds a new subchart to the chart. Note that the methods are only for xlsx files.

- **New set method in the properties PlotArea, Background  in ExcelChart.** [PlotArea](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/PlotArea.html) can now change the properties of the plot area like the position or fill color. [Background](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/Background.html) can now change the background of the chart. Note that all the methods here will only work in xlsx files.

- **Now SetSeries and AddSeries, DeleteSeries work also in xlsx charts.** [SetSeries](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/SetSeries.html), [AddSeries](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/AddSeries.html) and [DeleteSeries](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsxChart/DeleteSeries.html) now work in xlsx charts the same as they work in xls charts.

- **Support for calculating the upcoming XLookup, XMatch, RandArray and Sequence functions.** FlexCel can now calculate the functions [XLookup](https://support.office.com/en-us/article/xlookup-function-b7fd680e-6d10-43e6-84f9-88eae8bf5929?ui=en-US&rs=en-US&ad=US), [XMatch](https://support.office.com/en-us/article/xmatch-function-d966da31-7a6b-4a13-a1c6-5a33ed6a0312?ui=en-US&rs=en-US&ad=US), [RandArray](https://support.microsoft.com/en-us/office/randarray-function-21261e55-3bec-4885-86a6-8b0a47fd4d33) and [Sequence](https://support.microsoft.com/en-us/office/sequence-function-57467a98-57e0-4817-9f14-2eb78519ca90) which are coming to Excel in July 2020.

- **Better chart rendering when there are date axis.** Now in some cases of date axis, FlexCel should render them better.

- **Support for importing bullet lists when importing html.** Now when calling [SetCellFromHtml](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/SetCellFromHtml.html), doing reports from html strings, or in general when importing html into a cell, FlexCel will import ordered and unordered bullet lists (<ol> and <ul>).

- **Preserving and adapting single cell mappings in XML Maps in xlsx files.** Now FlexCel will preserve and modify the references to single cells in an XML map inside an xlsx file.

- **Improved compatibility with invalid third party files.** Now FlexCel will ignore some parts of the xlsx file that should exist but might not when the xlsx files are manually edited. This will allow you to open those files anyway if there are no more errors besides that one.

- **Bug Fix.** FlexCel wasn't calculating conditional formats if the formulas defining the conditions were array formulas.

- **Bug Fix.** FlexCel could fail to process some files where a shape had an ending coordinate smaller than the starting coordinate.

- **Bug Fix.** When rendering charts you could get an index out of bounds in some corner cases.

- **FlexCel will ignore invalid themes when reading xls files.** Now when an xls file has an invalid theme, FlexCel will ignore it and just use the default theme instead of throwing an exception. This is the way Excel behaves.

