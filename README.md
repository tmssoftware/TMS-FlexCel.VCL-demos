# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://download.tmssoftware.com/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.6 - May 2020


- **Support for Rad Studio 10.4 Beta.** If you are in the Rad Studio 10.4 Beta, FlexCel setup will list it as an option for installing.

- **Support for rendering logarithmic charts.** Now FlexCel will render logarithmic charts to PDF or HTML.

- **When rendering pages to PDF and PNG, if an image or chart goes over the columns or rows in a page, now it won't overflow.** In previous FlexCel versions, if an image spilled over to the next page, it would also go over the last cell in the current page.

- **Now FlexCel will search in c:\Windows\Fonts and %localappdata%\Microsoft\Windows\Fonts for fonts when exporting to PDF.** Windows 10 version 1809 introduced the concept of "local fonts", that is fonts that are installed for the current user only. (see [https://blogs.windows.com/windowsexperience/2018/06/27/announcing-windows-10-insider-preview-build-17704/](https://blogs.windows.com/windowsexperience/2018/06/27/announcing-windows-10-insider-preview-build-17704/) ) So now FlexCel will search in the traditional Windows fonts folder and the current-user-font-folder by default. You can always change the behavior with the [GetFontFolder](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Render/TFlexCelPdfExport/GetFontFolder.html) event. See [the new section about fonts in Windows inside the PDF exporting guide](https://download.tmssoftware.com/flexcel/doc/vcl/guides/pdf-exporting-guide.html#fonts-in-windows)

- **Now FlexCel won't throw an Exception if a Font folder in the PDF FontFolder path doesn't exist.** Now when you specify multiple paths in the [GetFontFolder](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Render/TFlexCelPdfExport/GetFontFolder.html) event, FlexCel won't show an error unless none of those paths exist. In previous version, if you returned for example "c:\mypath1;c:\mypath2" and mypath2 didn't exist, FlexCel would shown an error. Now it will only show an error if both mypath1 and mypath2 don't exist. You can change this behavior with the new property [OnFontFolderNotFound](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Render/TFlexCelPdfExport/OnFontFolderNotFound.html)

- **Improved handling of chart gaps when there are null values.** In Excel 2003, an area chart would never have a gap: Null values would be considered 0. After Excel 2007, area charts can have gaps. FlexCel behaved like Excel 2003, never showing gaps for area charts. Now FlexCel will behave like Excel 2007 when reading newer xls/x files, while still behaving like 2003 when reading old xls files.

- **Bug Fix.** Sometimes when calling RenderObjects the border of a chart would not be exported to PDF or PNG.

- **Bug Fix.** Leader lines in stacked bar charts were wrong when the axis was reversed

- **Bug Fix.** Manually positioned labels in stacked bar charts were a little offset from their manual position.

- **Bug Fix.** Now FlexCel will draw a maximum of 10000 ticks per axis in charts, to avoid taking too long drawing too many ticks that aren't visible anyway.

- **Bug Fix.** Xlsm files containing macros and with sheet names starting with a number and bigger than 24 characters, could generate invalid files when saved in FlexCel.

- **Bug Fix.** Now FlexCel will validate when manually setting a sheet codename, that the name is ASCII and starts with a letter.

- **Bug Fix.** Bidirectional reports could fail to delete rows or columns in complex reports.

- **Bug Fix.** FlexCel would consider a protected range title containing a "?" invalid. This would prevent it from loading files that used "?" in protected ranges.

- **Bug Fix.** When manually installing FlexCel in Delphi XE, Delphi XE would raise an exception. Note that this is a fix only for manual installation: automatic installation worked fine.

