# Intelligent page breaks

While there is no direct support in Excel for Widow/Orphan control,
FlexCel has the capacity to add page breaks to your file, so you can keep
interesting sections together.

**Make sure to read the conceptual documentation 
about [Intelligent Page Breaks](https://download.tmssoftware.com/flexcel/doc/vcl/guides/api-developer-guide.html#intelligent-page-breaks)
to better understand what we are doing here.**

## Concepts

- How to add automatic page breaks to a sheet. In this case, we are
  dumping a Pascal file to PDF, and we want to keep procedures in the
  same page is possible.

- How to deal with different levels of \"keep together\". FlexCel
  allows you to make some rows more \"keep together\" than others,
  if it can\'t fit everything in the same page, it will try to keep
  the rows of higher \"keep together\". We use this here to try to
  keep full classes first, if it is not possible full procedures, if
  not full for/while loops, etc.\
  Each **begin** sign in the source file means higher level of \"keep
  together\", and each **end** decreases the level.

- The method [TExcelFile.AutoPageBreaks](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Core/TExcelFile/AutoPageBreaks.html) must be called after everything is
  done, so the sheet is in a final state when applying the page
  breaks.
