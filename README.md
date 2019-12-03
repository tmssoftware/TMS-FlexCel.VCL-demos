# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 7.1 - December 2019


- **Android64 Support.** Now we support Android 64bit in Rio 10.3.3

- **Improved chart rendering.** Many small tweaks. We now support different line cap and join styles. The chart axis now goes above bar charts but below line charts. There is support for arrows at the end of lines in charts. The legend items draw a little larger to be more like Excel. And many more details.

- **Reports can now use nested properties in Aggregates, Filters, Sort and Master-details relationships.** Now in the config sheet you can filter or sort by a nested property, like for example sorting in the value of field1.field2.field3. Also you can use nested properties in relationships and in aggregates like <#aggregate(max;table.field1.field2.field3)>

- **Now for reports you can set semi-absolute references in the config sheet.** Besides the old way to set semi-absolute references with [SemiAbsoluteReferences](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Report/TFlexCelReport/SemiAbsoluteReferences.html), now you can change the setting directly in the config sheet. There is also a new [tip on what semi-absolute references are](http://www.tmssoftware.biz/flexcel/doc/vcl/tips/semi-absolute-references.html).

- **Now you can use report expressions that call themselves recursively, as long as the recursion converges.** Now you can have a <#tag> that depends on other <#tag2> which at the end depends on <#tag1> again, as long as it is not an infinite recursion. FlexCel now limits the number of recursions via the new property [ExpressionRecursionLimit](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Report/TFlexCelReport/ExpressionRecursionLimit.html)

- **Improved recalculation speed and decreased memory usage.** We've fine tuned the calculation engine so it is faster and uses a less memory. We've also added 2 new methods: [StartBatchRecalcCells](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/StartBatchRecalcCells.html) and  [EndBatchRecalcCells](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/EndBatchRecalcCells.html). When you are doing multiple calls to  [RecalcCell](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/RecalcCell.html) you can speed up the recalculation by writing the calls between Start/EndBatchRecalcCell calls.

- **Breaking Change: Removed overload method TExcelFile.GetImage(Integer, string, TXlsImgType, TStream).** The method TExcelFile.GetImage(Integer, string, TXlsImgType, TStream) was confusing, because the ObjectPath (the second parameter), was always ignored. To use the objectPath, you needed to use [GetImage(Integer, string, TXlsImgType, TStream, Boolean)](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/GetImage.html#texcelfilegetimageinteger-string-txlsimgtype-tstream-boolean)  and set the last parameter to true. If you were passing an empty object path, then you could just call [GetImage(Integer, TXlsImgType, TStream)](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/GetImage.html#texcelfilegetimageinteger-txlsimgtype-tstream) 

- **The HTML engine can now parse <font style> tags.** When setting a cell or a RichString from an HTML string, the old FlexCel could parse HTML like font color="red" or font size=3 but not font style="color:red;size:16px" Now both ways are supported.

- **Support for calculating BAHTTEXT function.** Now FlexCel can calculate BAHTTEXT.

- **Improved compatibility with invalid xlsx files.** Now FlexCel will ignore some missing parts in a corrupt xlsx file the same way Excel ignores them.

- **Updated to the latest version of Skia for Linux.** We've updated the Skia graphics engine we use in Linux to the latest.

- **Bug Fix.** FlexCel might not preserve comment backgrounds in xlsx files if the background was an image or texture.

- **Bug Fix.** FlexCel would nor correctly read or write left and right cell borders in strict xlsx files.

- **Bug Fix.** FlexCel was failing to render images which had an image filled background.

- **Bug Fix.** FlexCel could fail to open some files which didn't completely implement the xlsx spec but which Excel could open.

