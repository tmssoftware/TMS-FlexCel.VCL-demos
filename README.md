# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.24 - April 2025


- **Support for Delphi 12.3 and installing in the 64 bit IDE.** Now FlexCel installs in both the 64bit and 32bit IDEs in Rad Studio 12.3

- **Support Grouping objects.** A new command [GroupObjects](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/GroupObjects.html) allows you to group existing shapes.

- **Exporting Conditional Format Icons and DataBars to HTML.** Now we export icons and databars in conditional formats to HTML. All other conditional formats were already exported, so this completes the HTML exporting of conditional formats. All other formats, like SVG or PDF, already exported everything.

- **Exporting gradient cell backgrounds to HTML.** Now gradient background in cells are exported to HTML

- **Faster rendering of files when there are thousands of hidden rows.** Now FlexCel can be up to an order of magnitude faster when converting to pdf or printing files with tens of thousands of hidden rows. Normal files shouldn't be affected much, but they could be a little faster too.

- **Improved rendering of conditional formats icons.** We redrew all icons in conditional formats to look like they do in the latest Excel version.

- **Improved recovery mode.** Recovery mode can now handle more types of invalid files.

- **Bug Fix.** In special cases, charts copied with InsertAndCopy commands wouldn't show in Excel online.

- **Bug Fix.** If a group (but not the shapes inside it) was marked as "do not print" FlexCel would print it anyway. Now we behave as Excel, and only print/don't print depending in the main shape of the group. You can't disable individually printing shapes inside a group.

- **Bug Fix.** When recalculating a formula with =AVERAGEIF that had a a bad argument (for example a string where there should be a reference) FlexCel would throw a Invalid Cast exception. Now it returns #N/A! for the value of the formula.

- **Bug Fix.** A bidirectional report having a full column range could raise a "too many rows" exception in some cases where there were enough rows left.

- **Bug Fix.** When inserting or deleting cell, pivot tables might not move.

- **Bug Fix.** Right-align indented text wasn't correctly exported to HTML.

- **Bug Fix.** When exporting cells with "WrapText=false" to HTML, FlexCel would wrap the enters inside anyway.

- **Bug Fix.** Depending on the font, when exporting a cell to PDF which had an enter but no wrap text, FlexCel could draw an empty rectangle instead of completely ignoring the enter.

- **Bug Fix.** FlexCel could fail to export some files with invalid characters to HTML, due to issues in GDI+.

- **Bug Fix.** FlexCel could fail to open old xlsx files which had notes with non-breaking spaces.

- **Bug Fix.** FlexCel failed to open xls files with a missing OPT record.

- **Gridlines colors are now exported to HTML.** You can change the default color for gridlines in Excel going to Options->Advanced. Now FlexCel will export the correct gridline color to HTML if you change it form silver (It already exported them to PDF and the other formats)

