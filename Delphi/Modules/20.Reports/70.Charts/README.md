# Charts

Some examples of how to create Charts with FlexCel.

## Concepts

- Charts might be difficult: Sometimes Excel goes out of its way
  guessing what you want to do and what are the cells you want to
  use. While this is very good in normal situations (Excel almost
  always gets it right), it gets difficult when you are trying to
  define a chart out of \<\#xx.yy\> fields. So a nice trick is to
  write two rows of real data first, define the chart, and after
  that substitute the first row of real data with \<\#\...\> fields.
  You can leave the second with the test data, because as long as
  you use [x-ranges](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-designer-guide.html#x-ranges), it will be deleted.

- You can't use a  \<\#[delete row](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#delete-row)\> tag to remove the extra row. \<\#[delete row](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#delete-row)\> tags are
  executed from bottom to top, **at the same time** that the
  insertions are made. So, the row will be deleted before the actual
  data is inserted and the range will not expand. To solve this, we
  now have [x-ranges](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-designer-guide.html#x-ranges). If you put \"X\" as the last char on a
  named range (as in \"\_Products\_X\" on this demo), the range will
  work as a normal one, but after being inserted it will delete the
  next empty row. (or column if it is a column range)

- Usually when you create a chart, series remain fixed and the data
  range expands. But some special charts might need that the data range is fixed
  and new series are created. For those cases, you can use [swap series](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#swap-series)\> tags. Look at the example [Charts With Dynamic Series](https://doc.tmssoftware.com/flexcel/vcl/samples/delphi/reports/charts-with-dynamic-series/index.html) 

- FlexCelReport **will not replace \<\#tags\>** inside the main title
  or the x/y axis titles. But you can drop a textbox inside the
  chart, and this text will be replaced.

- Try and open the generated xls file with Custom Preview demo. You
  will see it looks very similar to the the way Excel displays it.
