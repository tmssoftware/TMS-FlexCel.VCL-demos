# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.14 - January 2022


- **Support for bubble charts.** Now [FlexCel can render Bubble charts](https://doc.tmssoftware.com/flexcel/vcl/about/supported-excel-charts.html#bubble). You can also enter them with the API and APIMate will show you the code to do it.

- **New &lt;#Swap Series> tag for reports.** The new [&lt;#Swap Series>](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#swap-series) tag allows you to create charts that grow or decrease their number of series according to the data available.

- **New CustomizeChart event for reports.** The new [CustomizeChart](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Report/TFlexCelReport/CustomizeChart.html) event allows you to further customize the charts in the report once they have been generated.

- **Support for optional lambda parameters.** There is now full support for the new [optional lambda parameters in Excel](https://insider.office.com/blog/new-lambda-functions-available-in-excel).

- **IsOmitted function support.** There is now full support for the new [IsOmitted function](https://support.microsoft.com/en-us/office/isomitted-function-831d6fbc-0f07-40c4-9c5b-9c73fd1d60c1).

- **Improved recovery mode.** [RecoveryMode](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/RecoveryMode.html) can now load more types of invalid files.

- **Support for localized versions of the CELL function.** Now you can write the first argument of function CELL in 24 languages, and FlexCel will understand them anyway. Before only English was understood. The languages added are Catalan, Croatian, Czech, Danish, Dutch, Finnish, French, Galician, German, Hungarian, Italian, Kazakh, Korean, Norwegian, Polish, Portuguese-Brazil, Portuguese-Portugal, Russian, Slovak, Slovenian, Spanish, Swedish, Turkish and Ukrainian

- **Bug Fix.** Now FlexCel will throw an exception if you try to save a chart with more than 255 series. Before this release, FlexCel would just save the file, but a file with more than 255 series crashes Excel.

- **Bug Fix.** APIMate wouldn't report deleted chart titles, which could lead to chart titles appearing when there was a series with a name.

- **Bug Fix.** It was impossible to manually enter lambda formulas referring to names if [AllowEnteringUnknownFunctionsAndNames](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/AllowEnteringUnknownFunctionsAndNames.html) was false.

- **Bug Fix.** A horizontal fixed band in a report would insert columns if using more than the fixed space, instead of just overwriting the cells.

- **Bug Fix.** Sometimes it was not possible to read properties from xls files.

