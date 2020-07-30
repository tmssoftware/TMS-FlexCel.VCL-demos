# Master detail report on one table

On this demo we see how to \"split\" one table into a master and a
detail table, in order to group the data. If you have the choice on how
to supply the report data is better to read different tables for
master-report (to avoid duplicate data). But if you already have the
data joined into one table, the Distinct and Relationship tags can help
you get it back into different tables.

Look at [Grouping Tables](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-designer-guide.html#grouping-tables) 
in the Report designer's guide for
more information.

## Concepts

- How to use the \"**DISTINCT**\" filter to create a new master
  dataset with the unique records on a table.

- You can use the DISTINCT filter on more than one column, by
  separating them with \";\". Only records that have any of the
  columns different will be included.

- How to use the \"**RELATIONSHIP**\" tag on the configuration sheet
  to relate two tables in master-detail. Note that different from
  the relationships you can set on the Data Layer, the relationships
  on the config sheet can be between tables on different datasets.

- The Relationship syntax is a little more complex than distinct. You
  need to write \"RELATIONSHIP\" on the table name, then
  \"Master-\>Detail\" on source name (where Master is the parent
  table and Detail the child). After that, you need to write the
  field names that relate both tables on the \"Filter\" column. You
  can relate more than one field, with the syntax:
  MasterTableField1-\>CDetailTableField1;MasterTableField2-\>CDetailTableField2\...etc.

- How to use the **\<\#[Merge Range](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#merge-range)\>** tag to merge all the cells in
  the country column.
