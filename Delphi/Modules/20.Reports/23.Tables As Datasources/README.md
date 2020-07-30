# Tables as datasources

On the other examples here, we use \_\_NAMES\_\_ to define where the
data has to go in the template. Here, we use tables instead.

## Concepts

- Tables can work like names to define data bands, if they are named
  starting with "\_\_", "\_" and ending with the same, just as named
  ranges.

- To have the table expand when data is inserted, the table must have
  an empty row after the data.

- Tables behave like "X" ranges, even if you don't name them as
  "\_\_Table\_\_X". You can name them with an X at the end or not,
  but no matter what you do, they will behave as if the "X" was in
  the name, and remove the empty row that you need to have for the
  tables to expand.

- Tables will be renamed after the report runs, by removing the "\_"
  or "\_\_" from the start and the end. If you don't want them to be
  renamed, you can change the property
  [TFlexCelReport.RenameExcelTablesUsedAsBands](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Report/TFlexCelReport/RenameExcelTablesUsedAsBands.html).

- A \_\_Table\_\_ is just a shortcut for defining a \_\_Table\_\_X
  named range. In this example you could have got the same results
  by having the table named "Products" instead of "\_\_Products\_\_"
  and defining a name "\_\_Products\_\_X" from A38 to D38.

- \_\_Tables\_\_ can be embedded in a master detail relationship with
  other \_\_Names\_\_. It is impossible to have a table inside a
  table (this is an Excel limitation), but you can have a
  \_\_Table\_\_ inside a \_\_Name\_\_ as in this example and the
  table will be copied for every record of \_\_Name\_\_
