# Fixed footer

When doing simple headers and footers, like for example printing \"Page
n of m\" in every page, then Excel\'s built-in headers and footers
should be enough. But sometimes you need more complex headers or
footers, and you need to define them in the cells.

For headers, Excel provides a \"Rows to repeat at top\" and \"Columns to
repeat at left\" command that allow you to repeat a range of cells in
every printed page. But to do footers, Excel doesn't provide a similar
\"Rows to repeat at bottom\" or \"Columns to repeat at right\". If you
need complex footers, then the only option is to manually split the
dataset in groups of n rows, and manually copy the footer every time.

## Concepts

- How to use the SPLIT tag (look at [Splitting Tables](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#splitting-tables) in the Reports designer's guide) to create a report with 40 records per page.

- How to use the \"multiple of\" parameter in ATLEAST (look at [Ensuring a table has at least N records](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#ensuring-a-table-has-at-least-n-records) in the Reports designer's guide) to ensure the
  dataset has a number of records multiple of 40. This makes sure that
  the footer will be at the bottom of the last page, not after the
  last record.
