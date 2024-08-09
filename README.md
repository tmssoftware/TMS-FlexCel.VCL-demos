# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.22 - August 2024


- **Suspended Lazarus support.** Keeping on supporting Trunk FPC/Lazarus build has proven too complex, so we are suspending  the experimental Lazarus/FPC support until there is a stable FPC that we can use. See the [Lazarus guide](https://doc.tmssoftware.com/flexcel/vcl/guides/lazarus-guide.html)

- **Vastly improved memory usage in TFlexCelPreviewer when previewing thousands of sheets at the same time.** The component [FlexCelPreviewer](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Preview/TFlexCelPreviewer/index.html) used to have a cache per sheet, which could grow to the gigabytes when previewing all sheets at the same time. Now the cache is global, reducing the memory used considerably.  For a test file of 3000 sheets, memory went down from 3Gb to 215Mb.

- **FlexCel will now choose the best font to export to PDF if a font is repeated multiple times in the Fonts folder.** When a Font is present twice in the Fonts folder, FlexCel now will choose the best one instead of the last that it read. By best one we mean that if one font is licensed to embed and the other isn't, we prefer the one licensed. If both fonts have the same license, we prefer the one with higher version number. See [https://support.tmssoftware.com/t/tflexcelpdfexport-error-trying-to-embed-font-calibri-in-the-document/23079/12](https://support.tmssoftware.com/t/tflexcelpdfexport-error-trying-to-embed-font-calibri-in-the-document/23079/12)

- **Bug Fix.** FlexCel is now more strict in detecting fonts whose license doesn't allow embedding when exporting to PDF. You can set FlexCel to ignore licensing restrictions by setting the [UnlicensedFontAction](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Render/TFlexCelPdfExport/UnlicensedFontAction.html#syntax) property in the FlexCelPdfExport object.

- **Bug Fix.** Labels in a Legend when the label range had multiple rows and columns didn't show the same as Excel. See [https://support.tmssoftware.com/t/pie-chart-legend/23077](https://support.tmssoftware.com/t/pie-chart-legend/23077)

- **Bug Fix.** The =COLUMN function could return wrong values when used in an array formula.

- **Bug Fix.** When a sheet had a print area with an invalid sheet, like #REF!A1:A2, FlexCel would assume the print area was A1:A2 anyway in the current sheet. Now the print area is correctly ignored.

- **Bug Fix.** FlexCel could fail to save a file with multiple views of the same file when you added a new sheet to it.

- **Bug Fix.** Improved compatibility with invalid third party files.

