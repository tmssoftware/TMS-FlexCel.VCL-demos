# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.9 - April 2021


- **Support for functions LAMBDA and LET.** We've reworked the recalculation engine to add support for [LAMBDA](https://www.microsoft.com/en-us/research/blog/lambda-the-ultimatae-excel-worksheet-function/) and [LET](https://support.microsoft.com/en-us/office/let-function-34842dd8-b92b-4d3f-b325-b8b8f9908999) functions. With Lambda, the calculation engine is now turing-complete.

- **Support for functions SINGLE, VALUETOTEXT and VALUETOARRAY.** Added support for [SINGLE](https://support.microsoft.com/en-us/office/implicit-intersection-operator-ce3be07b-0101-4450-a24e-c1c999be2b34), [VALUETOTEXT](https://support.microsoft.com/en-us/office/valuetotext-function-5fff61a2-301a-4ab2-9ffa-0a5242a08fea) and [ARRAYTOTEXT](https://support.microsoft.com/en-us/office/arraytotext-function-9cdcad46-2fa5-4c6b-ac92-14e7bc862b8b) functions.

- **Support for rendering multi-level labels in category axis.** In Excel you can set a category axis to have more than one row/column, and Excel will render those multi-level ranges in a different way than normal ranges. Now FlexCel will behave the same.

- **Support for legend keys in chart labels.** Now when exporting to PDF/HTML, if the option "Legend key" is enabled in the label options of a chart, FlexCel will render them.

- **Support for "Label contains Value from range" option in charts.** Now FlexCel will correctly handle the "Label Contains: " "Value from Cells" options for chart labels available in newer Excel versions. They will be exported to PDF/HTML and APIMate will show the code to create them in your programs.

- **Breaking Change: The property LabelValues in IDataLabel changed from TArray&lt;TCellValue> to TArray&lt;TDrawingValue>.** In order to support the "Label contains Value range" options in charts, we needed to change the type of the array to a more complete type. The current type was used in xls files, but xlsx files have a more complex type.
While this is a breaking change, it should break at compile time. If you get an error compiling a line like `Title.LabelValues := TCellValueArray.Create('This is my Chart!');` change it to `Title.LabelValues := TDrawingValueArray.Create(TDrawingValue.Create('This is my Chart!'));`  ApiMate will now show the updated method.

- **Improved drawing of x-axis in charts.** Now FlexCel will automatically adjust the x-axis labels to 45 degrees if needed, and also take the space from near labels if those are empty.

- **TXls3DRange now supports an external filename.** The object [TXls3DRange](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TXls3DRange/index.html) now has a property with the filename, in case that the range is from another file. This allows to use external files in user-defined functions.

- **Hyperlink Base support.** Now FlexCel will correctly preserve [Hyperlink Base](https://support.microsoft.com/en-us/office/work-with-links-in-excel-7fc80d8d-68f9-482f-ab01-584c44d72b3e) in xlsx files (it was already preserved in xls). Now the hyperlink base is also used when exporting to HTML, SVG or PDF.

- **Support for using an expression like &lt;#joinedtable.tablejoined.\*> to make a generic report in only one of the joined tables.** Now when you join tables in the template you can use &lt;#joinedtable.tablejoined.\*> or &lt;#joinedtable.tablejoined.\**> to create a generic report only in the fields of that subtable.

- **The &lt;#ref> tag can now use tags in its parameters.** Now you can write something like &lt;#ref(&lt;#dataset.#rowcount>,3)>. Before this version tags were not allowed as parameters.

- **New property "IsCameraObject" in TImageProperties.** The new property [IsCameraObject](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/IImageProperties/IsCameraObject.html) lets you know if an image is a camera object or not.

- **Improved compatibility with xlsx files created by SoftMarker Office.** SoftMaker office adds many extensibility points in places of the xlsx where they are not allowed. FlexCel complained about that, but in the new version we ignore the ones we could identify.

- **The SKIA lib used in Linux now runs in Ubuntu 16.04 and newer.** We have updated the SKIA library we use for graphics support in Linux to the latest, and compiled it in Ubuntu 16.04 so it is compatible with 16.04 and newer.

- **Axis labels will now render with a background color if they have one.** Now the axis labels will render the background color if you assign a color to them.

- **Bug Fix.** FlexCel would always render labels in the category axis as not "linked to source" even if they were.

- **Bug Fix.** Labels which come from cells that are formatted to show negative values in different colors show with that color in Excel, except in pie charts. FlexCel used to ignore that color, not it will display it.

- **Bug Fix.** When rendering xlsx charts, labels which were manually positioned would ignore the default  numeric formatting.

- **Bug Fix.** Structured references with text formatting could be saved wrong to new xlsx files.

- **Bug Fix.** Rotated labels in charts could a little below or above from where they should go.

- **Bug Fix.** FlexCel could fail to parse a formula where the sheet name started with some Unicode characters, like for example "※MySheet"

- **Bug Fix.** When reading structured references in Virtual Mode, there could be an access violation.

- **Bug Fix.** FlexCel didn't preserve or render text linked to cells in shapes inside charts.

- **Bug Fix.** FlexCel would allow you to name a sheet starting with a single quote ('), and that would cause an invalid file. Now the quote at the start of the name will be replaced by a "_" as other invalid characters do.

- **Bug Fix.** There could be a memory leak when calling TFlexCelReport.ClearTables

