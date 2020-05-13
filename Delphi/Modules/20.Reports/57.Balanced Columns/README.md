# Balanced columns

The FlexCel reporting engine will automatically balance the ranges that
are inside a master range so the master range will stay in place. You
can use this feature for creating master detail reports with balanced
columns inside (where the master will grow to cover the longest column),
or use a fake \"master\" report to ensure the columns inside the report
have the same number of rows.

## Concepts

- How to create a master detail report with detail columns, and where
  the master grows with the biggest of the columns. In columns where
  the number is less, **the last cell of the column will be copied**
  to fill the missing rows, so all columns have the same height.

- How to use [Fixed N Bands](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#fixed-n-bands) to avoid having empty rows at the
  end of each master record.

- How to use the \"**ROWS**\" function in the config sheet (see 
[Creating empty datasets with N rows](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#creating-empty-datasets-with-n-rows)) to create a
  database with a single row, that you can use as a master from the
  main report, and so ensure balanced columns.

*For more information in balanced columns please take a look at the
section [Fixed N Bands](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#fixed-n-bands) in the Reports designer's guide.*
