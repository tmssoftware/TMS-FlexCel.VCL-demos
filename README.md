# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.21 - July 2018


- **Bug Fix.** If a "rows to repeat at top" or "columns to repeat at left" range was outside the print area, FlexCel would ignore it, while Excel will use it anyway. Now FlexCel behaves like Excel and uses the repeating range even if it is outside the print area.

- **Bug Fix.** When in R1C1 mode, full ranges expanding more than 1 row or column like for example Sheet1!3:5 could be returned as Sheet1!5 only.

- **Bug Fix.** Sometimes cells formatted as "center on selection" were not rendered when exporting them to pdf or html.

- **Bug Fix.** When hiding a column without a given width and the default column width was different from the Excel default, the column wouldn't be hidden when saving as xls.

- **Bug Fix.** There could be an error in ClearSheet with some special images.

- **ApiMate now reports hidden sheets.** ApiMate will now tell you how to hide sheets.

- **Improved chm help.** The chm help shipped with FlexCel could show javascript errors in some Windows versions.

