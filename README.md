# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.17.4.0 - November 2017


- **Breaking Change: Subtotal command allows more customization.** Now the [Subtotal](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/Subtotal.html) command provides more parameters in the callbacks to allow for more customization. In addition, by default it will write a better text for non sum aggregates (like for example "Customers Average" instead of "Customers Total" if you are using the Average to aggregate). There is also a new example on how to use the command. **Note**: This is a breaking change if you are using the callbacks since now the callbacks have more parameters. But it is easy to fix at compile time, just add those parameters to the callbacks and recompile.

- **New SubtotalDefaultEnglishString command.** Now the [SubtotalDefaultEnglishString](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/SubtotalDefaultEnglishString.html) provides the string used by the different aggregate functions used in [Subtotal](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/Subtotal.html) . You can use this method as a parameter to subtotal to calculate the grand total and subtotal labels.

- **Ability to copy OLE objects between different files while using xlsx file format.** Now the restriction that you can't copy sheets from one file to another if they have embedded OLE object has been removed for xlsx files. It is still not possible to copy sheets between different files with embedded OLE objects in xls.

- **Ability to read custom document properties in xls files.** Up to now FlexCel could only read custom document properties in xlsx files. Now it can also read them in xls files. And now custom properties are migrated from xls files to xlsx too.

- **Better handling of URL encoding when encoding some filenames.** Now some filenames containing some characters like "#" will be correctly encoded when linked from FlexCel. The events that allow you to manually define the links have a new parameter "UrlNeedsEncoding" which you can set to false to avoid all encoding by FlexCel if you provide an already encoded URL to the event.

- **Bug Fix.** The **Last print time** document property wasn't read in xlsx files.

- **Bug Fix.** There was an error when linking **localized** projects using FlexCelReport.

- **Bug Fix.** When copying cells from one file to another autofilters would be copied even if they were not in the range being copied.

- **Bug Fix.** Formulas referencing sheets which could be interpreted like a R1C1 cell reference (like "R3C5") were saved without quotes in the sheet name, and thus became invalid formulas.

- **Bug Fix.** In some very complex bidirectional reports with sorting in the template the fields might end up not being sorted correctly, and some might appear twice.

