# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.13 - December 2021


- **Support for office 2021.** While we already supported it since we support Office 365, we added enumerations to create files with office 2021 defaults, and identify the file as being created by Excel 2021.

- **Support for Radar charts.** Now FlexCel can render Radar (Spider) charts. You can also enter them with the API and APIMate will show you the code to do it.

- **Support for the "Black and white" printing option in Excel.** Now when exporting to pdf, html, or printing, FlexCel will honor the "Black and White" option in the print options. Note that Black and White priniting in Excel doesn't mean to print in grayscale, but printing all backgrounds white and all lines black no matter the actual colors. It also depends in what you render, for example colors in a chart bar will be replaced by patterns. There is also a new convenience method [PrintBlackAndWhite](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintBlackAndWhite.html) that will let you modify the [PrintOptions](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/PrintOptions.html) directly to print in black and white.

- **Ability to set the bottom row when specifying an autofilter.** Now [SetAutoFilter](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/SetAutoFilter.html) can have an extra parameter to specify the bottom row of the Autofilter. Note that if there are more rows after the bottom row, those will be included anyway. Setting the bottom row is only useful to ensure that rows *up to* bottom rows are included, no matter if there are blank cells in the middle.

- **New convenience method LoopOverUsedRange that can be used to loop over a range of cells.** There is a new method [LoopOverUsedRange](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/LoopOverUsedRange.html) which will let you loop over a range of cells in a simple and efficient way.

- **New properties TextHorizontalOverflow and TextVerticalOverflow in TShapeProperties.** The new properties  [TextHorizontalOverflow](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IShapeProperties/TextHorizontalOverflow.html) and [TextVerticalOverflow](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IShapeProperties/TextVerticalOverflow.html)  allow you to set how the text overflows a shape. This corresponds to the checkbox in Excel "Allow text to overflow shape"

- **New convenience properties TextRotated, TextVerticalAlignment, TextHorizontalAlignment and LockText in TShapeProperties.** The new properties  [LockText](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IShapeProperties/LockText.html), [TextVerticalAlignment](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IShapeProperties/TextVerticalAlignment.html) and [TextHorizontalAlignment ](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IShapeProperties/TextHorizontalAlignment.html) allow to set or get [TextFlags](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IShapeProperties/TextFlags.html) in a simpler way.
The new property [TextRotated](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IShapeProperties/TextRotated.html) allows to set [TextRotation](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IShapeProperties/TextRotation.html) in a simpler way. APIMate now shows those properties instead of TextFlags and TextRotation. Read more in the tip about [xlsx and xls approaches to text rotation](https://doc.tmssoftware.com/flexcel/vcl/tips/text-rotation-in-xls-and-xlsx.html).

- **New method  SetObjectProperties to set all the object properties in one step.** There is a new method [SetObjectProperties](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/SetObjectProperties.html) that will allow to easily change the properties of an object. You just call [GetObjectProperties](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/GetObjectProperties.html), modify the values you want and then call [SetObjectProperties](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/SetObjectProperties.html).

- **New property IsLocked in TShapeOptions.** There is a new property  [IsLocked](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IShapeProperties/IsLocked.html) which controls how if the shape is locked or not.

- **New overloaded version of SetObjectProperty for booleans.** There is a new overload of [SetObjectProperty](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/SetObjectProperty.html) that will allow you to set the property directly, without calculating the position in the set.

- **Improved legend drawing in charts.** Legends items in charts should render better now when some items are empty, and multiline items were improved too.

- **Bug Fix.** Background of Axis text set by the API was ignored.

- **Bug Fix.** Rotation of Axis text set by the API was ignored.

- **Bug Fix.** When setting an Axis position in a chart to cross in the max value with the API, the value was ignored and it always used the manual crossing point.

- **Bug Fix.** Some hidden fills in files could be read as normal fills and so would appear if reading and saving a file.

- **Android demos now use AndroidX instead of Support Library.** The [Android Support Library](https://developer.android.com/topic/libraries/support-library) is deprecated and replaced by [AndroidX](https://developer.android.com/jetpack/androidx). So we've modified the demos using the old Support library to use AndroidX instead. Also the [documentation](https://doc.tmssoftware.com/flexcel/vcl/guides/android-guide.html#sharing-files) has been updated to use AndroidX.

