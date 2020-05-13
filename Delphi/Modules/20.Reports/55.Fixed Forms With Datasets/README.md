# Fixed forms with datasets

Sometimes you need to have a normal entry form, but a part of that form
is a table from a dataset. Under normal FlexCel mode, the rows will be
inserted, and the bottom of the form moved down, and this is what you
normally would like. But using **\_\_dataset\_\_FIXED** ranges, you can
create a band that will not insert any row, keeping the format of the
form unchanged. Look at [Fixed Bands](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#fixed-bands) in the Reports designer guide for more information.

## Concepts

- How to create bands that do not insert rows.

- How to use the \"TOP\" tag to filter the top 10 items in the list. 
  (look at [Retrieving TOP N Records from a table](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#retrieving-top-n-records-from-a-table) in the Reports designer guide)
  **Note**: The top tag is not recommended as a general way to
  filter datasets. If for example you need 10 records from a
  dataset, with this tag you will still retrieve the **full** table
  from the database. Whenever possible, you must filter at the data
  layer level, avoiding retrieving those records at all.
