# Meta templates

FlexCel allows self-modifying templates, that can adapt themselves to
the data that is going to be reported. This provides other way to create
generic reports, besides what is shown in the [Generic Reports](https://doc.tmssoftware.com/flexcel/vcl/samples/delphi/reports/generic-reports/index.html) example.
But the utility of meta templates can go much further.

In this example, we have a template that will show rss feeds. If the
feed contains a **pubDate** field, it will be added. If it doesn\'t, the
row will be deleted from the template before running the report.

## Concepts

- You can use the **\<\#[Preprocess](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#preprocess)\>** tag to evaluate expressions
  when the template is being read. You can delete columns and rows,
  clear fields, etc. Once the preprocessing is over, the report will
  be run on the modified template.

- Database fields and expressions can have default values, that will
  be applied when the field or expression does not exist. For
  example: **\<\#DataTable.field;20\>** will evaluate to the value
  in DataTable.Field if Field exists, or 20 otherwise.

- The **\<\#[Defined](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#defined)\>** tag can be used to know wheter a field or
  table is defined or not, and to for example delete the column if
  the field does not exist.
