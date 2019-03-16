# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.26 - March 2019


- **In Reports now you can reference tables which include dots by writing <#[db.something].field>.** Now you can use square brackets in both the table name or field name to reference tables or fields which include dots. This is useful especially for reports from classes as shown in the new [Advanced  Reports From Lists example](http://www.tmssoftware.biz/flexcel/doc/vcl/samples/delphi/reports/advanced-reports-from-lists/index.html).

- **Improved compatibility with LibreOffice/OpenOffice.** LibreOffice/OpenOffice can't at the time of this writing understand indexed colors inside xlsx files. Now we introduce a new property (false by default) named  [XlsxCompatibilityConvertIndexedColorsToRGB](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/XlsxCompatibilityConvertIndexedColorsToRGB.html) which when true, will make FlexCel convert the indexed colors to RGB colors when saving xlsx files. Set it to true if you have xlsx files with indexed colors and you want them  to be compatible with Libre/OpenOffice.

- **Now FlexCel won't throw an exception when reading custom properties in an xls file if the values of the property aren't defined.** Either because of corruption or because they were created with a tool that created wrong files,  some xls files might end up having a custom property but no value associated with them. FlexCel was throwing exceptions when you tried to read the properties of those files, but that didn't allow you to get other properties which might be set correctly. So now FlexCel will just ignore those errors.

- **Bug Fix.** The setup wasn't compiling c++ headers for Android and iOS in Rad Studio Rio.

- **Bug Fix.** Workaround a GDI+ bug which could cause Internal errors when using small path gradients.

- **Bug Fix.** FlexCel would fail to read xlsx files with formulas that contained unknown user-defined functions that returned a reference type.

- **Bug Fix.** FlexCel will now render labels in a 100% stacked chart as the values, not the percent in the charts.

- **Bug Fix.** If an xlsx file contained negative offsets to a shape, FlexCel could render the shape incorrectly.

- **Bug Fix.** FlexCel will now render labels in stacked charts more like Excel renders them.

- **Bug Fix.** When rendering charts, if the axis was reversed and the labels were aligned to the right, FlexCel would render them to the left and vice-versa.

