# Generic reports Part 2

In the previous example we saw how to use **\<\#DataTable.\*\>** and
**\<\#DataTable.\*\*\>** to create generic reports. While this works in
most common cases, there are times when you might need a more complex
but also more powerful approach.

## Concepts

- You can create a generic report by doing a report that grows both in
  columns and in rows.

- You can use **Columns(Dataset)** table definition in the config
  sheet to have a datasource that contains the columns of the
  dataset. You can then use this new datasource as a source for the
  horizontal report (with an I\_range\_I), so every column in the
  Excel file will have one entry in the datasource.

- Different from \"\*\" reports, here you can filter this column
  datasource and only show some columns, or order them.

- You can use **\<\#dbvalue\>** tag to get the value for a column or a
  row. Here we use it inside a report expression in the config sheet
  so we don\'t need to write the full dbvalue tag every time.

- Different from \"\*\" reports, columns here are not overwritten,
  they are inserted.

- A problem with this type of reports is formatting. You will want to
  format all dates as dates, not numbers, and you might want to
  format numbers as currency and so on. Here we will use a simple
  user-defined function to return the datatype of the value, and if
  it is a date then format it as date.
