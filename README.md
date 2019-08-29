# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 7.0 - August 2019


- **Breaking Change: Support for rendering charts inside xlsx files.** We have fully rewritten the charting engine so it can now render charts inside xlsx files too. As charts inside xlsx files are completely different from charts inside xls files, this support meant that we had to modify some of the APIs to retrieve the chart information. If you are manually retrieving chart information like the color of the plot area or the title of a chart, some methods might have been moved or changed, so this is why this is a breaking change. But for most uses, nothing should break.

- **Support for Delphi Rio 10.3.2 including the new macOS 64 platform.** Now FlexCel can install in 10.3.2 and compile in macOS 64 apps.

- **Breaking Change: Improved compatibility with "Autosave" in Excel 2019.** When [OptionsCheckCompatibility](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/OptionsCheckCompatibility.html) is set in a file, Excel disables the Autosave function. To avoid accidentally writing this setting and thus diabling the Autosave function, now FlexCel will ignore this option by default and not write it to xlsx files. If you really want to save this setting to the file, you now also have to set [ForceUseOptionsCheckCompatibility](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/ForceUseOptionsCheckCompatibility.html) to true.

- **FlexCel will now generate "faux" bold and italics when exporting to PDF.** When exporting to pdf and the used font doesn't have italics or bold variants, FlexCel tries to simulate the styles by making the pen wider (for bold) or slanting the characters (for italics). The method used in older FlexCel versions  only worked when not embedding the fonts, but today most fonts are (and should be) embedded. This new FlexCel version creates "faux" italics or bold variants even when the fonts are embedded. To turn this feature off, you can use the property [UseFauxStyles](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Render/TFlexCelPdfExport/FallbackFonts.html) property in [FlexCelPdfExport](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Render/TFlexCelPdfExport) .

- **Ability to specify different fallback fonts for italic, bold or bold-italic variants when exporting to PDF.** In addition to the existing [FallBackFonts](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Render/TFlexCelPdfExport/FallbackFonts.html) property in [FlexCelPdfExport](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Render/TFlexCelPdfExport) we have now added 3 new properties: [FallBackFontsBold](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Render/TFlexCelPdfExport/FallbackFontsBold.html), [FallBackFontsItalic](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Render/TFlexCelPdfExport/FallbackFontsItalic.html) and [FallBackFontsBoldItalic](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Render/TFlexCelPdfExport/FallbackFontsBoldItalic.html). If set to empty (the default) then FlexCel will keep looking for fonts in the usual way with FallBackFonts. But if you have fonts that have only regular, bold, italic or bold-italic variants, now you can specify different fall back fonts for each. So for example, you could use "Font1Bold" as a bold fallback, and "Font3Regular" as the regular fallback.

- **GetHtmlFromCell now can add the cell formatting to the resulting string.** The old version of [GetHtmlFromCell](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/GetHtmlFromCell.html) would return only the format of the rich string inside the cell, but not include the format of the cell itself. So if a cell was formatted as bold, but inside there was a plain "text" string, GetHtmlFromCell would return "text", and expect the text was hosted inside a table cell with style bold (<td style="bold">text</td>. Now there is a new parameter "includeCellFormatting" that when true, FlexCel will return "<b>text</b>" so you can use it outside formatted td tags.

- **Breaking Change: Support for semantic theme colors.** We added 4 new values for [TThemeColor](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TThemeColor.html) : Dark1, Light1, Dark2 and Light2. In the xlsx specification, there are 12 theme colors, which include "Dark1/2" and "Light1/2" variants. In Excel cells, the text color is "Dark" and the background color is "Light". But in drawings or charts, you can use 4 semantic colors: "Text1", "Text2", "Background1" and "Background2". While those colors are mapped Text->Dark and Background->Light, it is possible to manually edit an xlsx file and change the mapping. So now FlexCel differences between  [TThemeColor](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TThemeColor.html) (which now includes semantic colors) and  [TPrimaryThemeColor](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TPrimaryThemeColor.html) which includes only the 12 real theme colors and no semantic colors. Most of your code should stay the same, but if you are changing themes in code, you might need to replace some instances of TThemeColor by TPrimaryThemeColor. This is a compile-time breaking change: If your code compiles then nothing is broken. If your code doesn't compile anymore, you need to change TThemeColor by TPrimaryThemeColor where the compiler complains, and the code will keep working like before.

- **Breaking Change: Most properties in TDrawingRichString are now nullable.** Properties like bold or italics in a [TDrawingRichString](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TDrawingRichString/index.html) now can have a null value, which means that the value of the parent should be used. This change shouldn't affect most uses of TDrawingRichString, but if you were manually parsing DrawingRichStrings, you might now need to check if the nullable properties have a value before using them.

- **The <#evaluate> tag in reports can now evaluate a string multiple times.** There is a new optional parameter in the [evaluate tag](http://www.tmssoftware.biz/flexcel/doc/vcl/guides/reports-tag-reference.html#evaluate) in reports that allows you to evaluate a string multiple times. This is useful if you store tags in the database itself. For example, if you have a field in the database named "Expression" with value "<#other tag>", then <#evaluate(<#db.expression>;2>)> will evaluate first the value of expression, find out it is <#other tag>, then evaluate again <#other tag> and write the value of other tag in the cell.

- **Support for creating or reading xlsx files with uncompressed size bigger than 4 Gb.** FlexCel now uses the Zip64 file format automatically when creating xlsx files which won't fit in a standard zip container. It also can now read xlsx files saved with Zip64 file format.

- **New overloads for DeleteSheet allow to delete a sheet by its name or index.** There are now 2 new variants of [DeleteSheet](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/DeleteSheet.html). The first variant will let you delete a sheet given its name -- DeleteSheet("sheet1") --, and the other will let you delete n sheets since some index -- DeleteSheet(SheetIndex, NumberOfSheetsToDelete)

- **Improved bidirectional text handling.** We updated the Unicode bidi algorithm to the latest version, and added support for glyph mirroring and bracket matching algorithm. This should render right-to-left text in a way that is more compliant with the Unicode standard.

- **Improved drawing of autoshapes.** Excel 2007 changed the way in which it draws autoshapes in many small but visible ways. We made some tweaks in the autoshape algorithms and color handling routines to make autoshapes render even more like Excel 2007 and not Excel 2003.

- **Improved drawing of gradients and conversions from xls to xlsx.** We did a big rewrite of the gradient-handling code to better support the newer gradient styles in xlsx.

- **Improved drawing of patterns and conversions from xls to xlsx.** All pattern rendering code was reviewed and updated to better match Excel. Now every pattern style is exported to pdf/html/printed/etc.

- **Improved rendering in iOS, macOS, Android and Linux.** The rendering engines for CoreGraphics (used in iOS and macOS), SKIA (used in Linux) and Android have been updated to generate more accurate rendering of Excel files.

- **Improved support for Excel themes.** We've improved the theme engine to better handle files with wrong data in the themes. Now FlexCel can fix those files when you save them.

- **Improved compatibility when saving strict xlsx files.** While the strict xlsx files FlexCel created before were valid, now we create files that are more similar to what Excel creates when you save as strict xlsx.

- **Improved compatibility with invalid files created by third-party tools.** Now FlexCel can read files which have invalid cell references in the cell table, ignoring the reference completely as Excel does.

- **Improved conversion between strict and transitional xlsx files.** Now when preserving full parts of the xml of a strict or transitional file, FlexCel will convert the namespaces accordingly if you save as transitional or strict respectively.

- **Function Cell("filename") now returns the filename.** Now FlexCel can recalculate cell with Cell("filename"), which can be used to know the sheet where a cell is. Note that for security reasons, FlexCel won't return the folder there the file is, only the filename.

- **Breaking word in hyphens.** Now FlexCel will break words in hyphens when it has to fit multiple lines of text, same as Excel does.

- **Breaking Change: The Links property of TSheetSelector now is a readonly list of TSheetSelectorLink.** Now [Links](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Render/TSheetSelector/Links.html) in TSheetSelector contains not only the name of the html sheet but also the name of the corresponding excel sheet. If you were using this property, you will need to  use Links[index].HtmlSheetName instead of Links[index]. Anew method  [GetHtmlSheetNameFromExcel](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Render/TSheetSelector/GetHtmlSheetNameFromExcel.html) allows you to easily find the associated html sheet name from an Excel sheet name.

- **Bug Fix.** Some non visual characters like "right to left mark" were exported to pdf, even when they are invisible. Now they don't show in the generated pdfs.

- **Bug Fix.** FlexCel won't let you save files where tables have 0 rows of data, since that would become an invalid xlsx file. Now it will raise an exception if trying to save such file.

- **Bug Fix.** FlexCel won't let you enter empty array members anymore, like in the formula ={1,,2} which would create an xlsx file which could crash Excel. It will also automatically remove spaces before and after the element, so the formula ={ 1,  2,  3  } will be entered as {1,2,3}. Before this version, the formula ={ 1,  2,  3  } would be considered invalid.

- **Bug Fix.** When autofitting columns with line feeds (character 10) inside, FlexCel might fail to recognize them and try to fit everything in one line.

- **Bug Fix.** Arrows in lines were not scaling when printed or exported at a zoom different from 100%.

- **Bug Fix.** In html exporting, a cell which expanded over adjacent cells could cause the output to shift if there were hidden columns in the middle.

- **Bug Fix.** An unitialized variable when running reports could crash the report in rare cases

- **Bug Fix.** When exporting a file as HTML with tabs for sheets and there were hidden sheets between sheets, the links in cells to a different tab could be incorrect.

- **Bug Fix.** Some hyperlinks in xls files could return an empty string when read, even if they had data.

- **Bug Fix.** Lines with 0 width were not showing in SVG files.

- **Bug Fix.** Sometimes when copying cells between files the indexed colors could be converted to similar but not equal  RGB colors.

- **Bug Fix.** When using the SKIA/Android graphic stack some lines in the charts could appear not connected.

- **Bug Fix.** FlexCel was not exporting correctly to CSV when using Big-Endian UTF16 encoding.

