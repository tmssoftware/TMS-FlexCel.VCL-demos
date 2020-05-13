# Range reports

On the [GettingStarted](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/api/gettingstarted/index.html) demo we saw how to write tags on a template, and
have FlexCel replace them. Now we are going to replace whole ranges with
values from a database.

## Concepts

- To be able to use a database, you have to define a **named range**
  on the template, to tell FlexCel which rows or columns to use.
  Also, you need to add the table on the code.

- You can arrange the ranges in many different ways. Take a look at
  all the sheets, they have different reports from the Northwind
  demo recreated with FlexCel.

- There are **four kinds** of named ranges:

   - **\"\_\_\"** Ranges: They are the most common, and the ones you
     should probably use. The table will be inserted horizontally, and
     the full rows will be moved down.

   - **\"\_\"** Ranges: They work as the \"\_\_\" ranges, but only the
     range and not the full row is moved down. Row properties (like row
     height) are not copied because not the full row is copied.

   - **\"II\_\"** Ranges: Use them to insert the table by columns, not by
     rows. Full columns will be inserted.

   - **\"I\_\"** Ranges: Tables will be inserted by columns, but only the
     selected range will move. Column properties (like column width)
     are not copied.

- Ranges can be defined inside ranges, to create **Master-Detail**
  reports. On the dataset schema on your application, you have to
  define the corresponding relations for this to work.

- It might happen that you need to use the **same datatable**, lets
  say \_\_Categories\_\_ on **more than one sheet**. You can\'t
  define more than one \_\_Categories\_\_ named range, but you can
  define an alias on the Config sheet, (for example
  Categories2=Categories) and then use \_\_Categories2\_\_ on the
  second sheet.
  Another alternative not shown in this example would be to use [Alias Bands](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#alias-bands).

- We used [Intelligent Page Breaks](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#intelligent-page-breaks) in the first sheet so categories are
  kept in their own pages when printing.
