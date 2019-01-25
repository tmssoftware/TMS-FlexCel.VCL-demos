# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.24 - January 2019


- **The INDIRECT function can now understand structured references in tables.** Now FlexCel can calculate formulas where INDIRECT references a table. For example if you have a table named "Table1", FlexCel will now understand a formula like =SUM(INDIRECT("Table1[Column1]"))

- **Breaking Change: Cell indent is now printed and rendered to pdf/images proportional to the print scale.** Before this version, FlexCel behaved just like Excel and kept the cell indent always the same no matter the print scale. Now we behave in a more logical way, and if the print scale is 50%, the cell indents will be 50% smaller. If you want to revert to the old behavior (which is how Excel behaves), there is a new property [CellIndentationRendering](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/CellIndentationRendering.html) which allows to control this behavior and revert it back to what it was. For more information read the new [section about cell indentation in the API guide](http://www.tmssoftware.biz/flexcel/doc/vcl/guides/api-developer-guide.html#cell-indentation).

- **Breaking Change: TFlexCelDocExport now uses a different way to share files in Android.** If you have existing apps using FlexCelDocExport, make sure to review them and add a provider to them so FlexCelDocExport will keep working. This was needed so new Android apps can comply with the new Play store rules. Please read the [Android guide](http://www.tmssoftware.biz/flexcel/doc/vcl/guides/android-guide.html#sharing-files) for more information.

- **The examples for Android show a newer way to share the documents.** The revised examples for Android now use a sharing method that is compatible with Android Nougat or newer. TFlexCelDocExport will now use the new sharing method in Android. There is new documentation available at the [Android guide](http://www.tmssoftware.biz/flexcel/doc/vcl/guides/android-guide.html#sharing-files)

- **New methods SetRange3DRef and TrySetRange3DRef in TXls3DRange.** The new methods  [SetRange3DRef](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/SetRange3DRef.html) and [TrySetRange3DRef](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/TrySetRange3DRef.html) allow you to set a 3D range from a string like "=Sheet1:Sheet2!A1:A3"

- **DbValue in reports now supports fields with dots.** DbValue tag in reports will now work with fields with dots like "data.value"

- **Bug Fix.** When deleting columns the data validations formulas could be adapted wrong.

- **Bug Fix.** When a line in rich text inside a text box had a length 0 (an empty line), the font might not be preserved for that line.

- **Bug Fix.** FlexCel considered some special characters like "°" in a name to be invalid when they are not. This could cause that opening and saving an xlsx file with names like that would make Excel crash opening the file.

