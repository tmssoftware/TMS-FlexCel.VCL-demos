# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.20 - December 2023


- **Support for Delphi 12.** We now provide official support for Delphi 12. While Delphi 12 was already supported, we now optimized the codebase for Delphi12.

- **Improved Lazarus support.** We now require a trunk of December 1, 2023 or newer. This version is tested with FPC: 7ecb19f906 and Lazarus: 25c7f3c141

- **Support for creating your own cultures when rendering Excel files.** Now you can override the dates returned by your app so they look exactly like Excel. For more information read the tip  [localized month names](https://doc.tmssoftware.com/flexcel/vcl/tips/localized-month-names.html)

- **Better support for subnormal numbers.** Excel doesn't support [subnormal floating point numbers](https://en.wikipedia.org/wiki/Subnormal_number) and instead converts them to 0. Now FlexCel does the same, instead of saving those numbers to the files.

- **FlexCel is more forgiving with too long data validation formulas.** FlexCel used to raise an error if a formula in a Data Validation is longer than 255 characters, because that is what the spec says and what Excel allows you to enter in its Data Validation Dialog. But, if you save a longer formula by manually editing the xlsx file, Excel won't complain, and the formula will still work. It won't work well, since you won't be able to edit the formula with the UI (and you might be corrupting Excel memory), but Excel won't complain. In order to let you edit those files, now FlexCel won't complain either when you open a file with a longer formula, and it will preserve the formula when you save the file back. But it still will throw an Exception if you try to manually enter that formula, so you know it is invalid. You can still enter the invalid formula manually by turning [Recovery Mode](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/RecoveryMode.html) on.

- **Now FlexCel will use its own Random implementation.** This implementation not only is faster and better than Delphi's built-in, but also avoid FlexCel code calling Randomize, and changing the state of the Random Number generator if you were counting in some seed. See [https://support.tmssoftware.com/t/call-to-randomize-when-opening-an-xlsx-spreadsheet/22016/3](https://support.tmssoftware.com/t/call-to-randomize-when-opening-an-xlsx-spreadsheet/22016/3)

- **New setting FlexCelConfig.LocalizedTEXTFunction allows you to fine tune how FlexCel recalculates the "=TEXT()" function.** The setting [FlexCelConfig.LocalizedTEXTFunction](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TFlexCelConfig/LocalizedTEXTFunction.html) allows to change the way the =TEXT() function behaves in FlexCel. Look at the link above for more information.

- **Improved Label rendering when drawing charts.** Now we allow to show the fields "X Value" and "Y Value" in labels of scatter charts. Sometimes the marker if the label was set to show markers was drawn left-aligned, not centered.

- **Removed canvas.getMatrix calls in Android as they are deprecated.** FlexCel now keeps internal track of its Matrix, to avoid calling canvas.getMatrix which was deprecated in Android 16.

- **Bug Fix.** If the column names of a table had a format like "@_@" or similar, FlexCel would apply them and the column name would be wrong. Now the names are the same as in Excel. Some other improvements in handling of column names.

- **Bug Fix.** The XLOOKUP function would return "not found" when searching for a value bigger than any on the list and the match mode was "Exact match or next larger item", when there were empty entries in the list. This is the logical way to do it, it is how Google Sheets does it, and it is how Excel itself behaves in the other match modes. But for this match mode, Excel returns the first empty item in the list, not "not found". Now FlexCel mimics this behavior.

- **Bug Fix.** The SINGLE function could return wrong results in very special cases.

- **Bug Fix.** When autofitting rows FlexCel ignored empty columns formatted with big fonts.

- **Bug Fix.** When parsing some PNGs FlexCel could raise an arithmetic overflow.

- **Bug Fix.** FlexCel could fail to detect circular references in some corner cases, causing a Stack Overflow.

- **Bug Fix.** When drawing Error Bars in charts, if there was no line color assigned, FlexCel would not draw the lines instead of drawing them in Black.

- **Bug Fix.** Some files could show the error: "Value was either too large or too small for an Int32" when opened.

