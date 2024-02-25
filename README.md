# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.21 - February 2024


- **Support for exporting Persian to PDF.** FlexCel supported arabic but not persian when exporting to PDF. Now both are supported.

- **Bug Fix.** Reviewed bidi algorithm because some arabic numbers could be written in the wrong order when exporting to PDF

- **Bug Fix.** Data labels in scatter chart were incorrect when the axis was reversed.

- **Bug Fix.** When rendering charts that had labels linked to "Value from Cells" FlexCel could fail to render the labels if they weren't manually specified.

- **Bug Fix.** There was an error when rendering PDF Khmer text in some corner cases.

- **Bug Fix.** Header images wouldn't be copied when calling the InsertAndCopySheets overload that takes an array of integers for the sheets to copy.

- **Bug Fix.** SetCellFromHtml could raise an exception with some surrogated unicode characters.

- **Bug Fix.** Charts with hidden series could raise an exception when drawing trendlines.

