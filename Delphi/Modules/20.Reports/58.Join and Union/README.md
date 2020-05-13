# Join and Union

Sometimes you want to run unrelated reports in columns. One option is to
run them as "\_" ranges instead of "\_\_" (see the [Balanced Columns](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/reports/balanced-columns/index.html)
example). But this will break merged cells and ranges might not expand
(see [Joining Tables](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#joining-tables) in the Report Designers guide). So other
option is to "join" those unrelated tables into a single table, and run
a single "\_\_" range.

Also shown in this example is how to do a [Union of Tables](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#union-of-tables).

## Concepts

- **How to join unrelated tables into a bigger table**. In this
  example we join Categories, Products and Shippers into a single
  table (CSP) which we use to run the report.

- How to access the fields of the joined table. If the joined tables
  have different column names, you can access those fields directly.
  For example, we write "\<\#CSP.CategoryName\>" and this will
  access the column CategoryName of the Categories table in the CSP
  table, as none of the other joined tables has a similar column.
  But when we want to access CategoryId, that column is present in
  both Categories and Products. **So we need to explicitly write the
  table name after CSP and before CategoryID**. In this example,
  \<\#CSP.Products.CategoryId\> references the column CategoryId of
  the table Prodcuts, and not Categories.

- **It might be a good idea to always prefix the table being accessed
  when using a joined table**. In this example we write
  \<\#CSP.Shippers.CompanyName\> even when CompanyName is not in the
  other tables and we could just write \<\#CSP.CompanyName\>. But
  somehow writing the full name will make it more future proof, not
  breaking if we later add another table. As in this example we
  wanted to show both variants, we used both forms (the short one:
  \<\#CSP.CategoryName\> and the long one:
  \<\#CSP.Shippers.CompanyName\>) But depending on your case and if
  there are chances of column names being the same, you might want
  to just use only the long form.

- How to use the "**UNION**" function to append the records of one
  table after another. In this example we do a union of Suppliers,
  Shippers and Customers and write the phone numbers of all of them
  into a single table.

*For more information in balanced columns please take a look at the
sections [Joining Tables](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#joining-tables) and [Union of Tables](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#union-of-tables) in the Report Designers guide.*
