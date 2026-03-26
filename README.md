# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.26 - March 2026


- **Support for the Windows on ARM EC platform.** This release introduces support for Windows on ARM (EC) that was introduced in Delphi 13.1

- **Support for longer strings in formulas.** Before 2026, a hardcoded string in a formula like =len("ABC") was limited to 255 characters. Now the new limit it 4095, and FlexCel was updated to support the new strings. Note that if you save a formula with the new longer strings, it will show as #NAME in older Excel versions

- **Support for longer data validation lists.** In 2026, Excel added the ability to create data validation lists bigger than 255 characters. Now FlexCel can handle those too. Note: To use this feature, you need a very recent Excel, as older ones won't show those validations.

- **Support for new Error codes introduced by Excel.** Now FlexCel can understand the new  #CONNECT, #BLOCKED!, #PYTHON! and #TIMEOUT! errors.

- **Ability to abort a LoopOverUsedRange before the range has been fully visited.** [LoopOverUsedRange](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/LoopOverUsedRange.html) method now has an "abort" parameter which allows to end the loop before the range has been completed.

- **Bug fix.** Images added with the API weren't showing in the macOS26 or iOS26 previewers

- **Bug fix.** Fonts with spaces weren't quoted when creating SVG files, and some browsers wouldn't display the fonts

- **Bug fix.** Small glitches in rendering file could happen when zoom was very small (less than 10%)

- **Bug fix.** Some invalid xlsx files could throw an overflow exception

- **We support now the \n character as intersection operator.** Even when according to the xlsx spec, only space is the intersection operator, Excel also allows \n, so we now allow it too.

- **Bug fix.** When saving single cell tables, the files generated could be invalid

- **Bug fix.** When converting a xlsx file to xls, if the selected row or column was bigger than the maximum allowed in xls, FlexCel would throw an exception. Now it ignores it, and selects the larger cell address that can be saved in xls. This way you can still save the file as xls.

