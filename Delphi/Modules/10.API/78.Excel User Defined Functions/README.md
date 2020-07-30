# Excel user defined functions (UDF)

Here we will explore how to handle Excel files with UDFs. FlexCel has
full support for adding Excel UDFs to cells, retrieving UDFs from cells
or recalculating files containing UDFs. But you need to create Delphi/C++
functions that will mimic the UDF behavior, and add them to the FlexCel
recalculation engine.

**Make sure you read [Using Excel's User-defined Functions (UDF)](https://doc.tmssoftware.com/flexcel/vcl/guides/api-developer-guide.html#using-excels-user-defined-functions-udf) in the API developers guide for a conceptual explanation
of what we are doing here.**

## Concepts

- How to recalculate a sheet containing User Defined Functions (UDfs).

- How to read and write UDFs from and to an Excel file.

- In order to compare the results calculated by Excel and By FlexCel,
  this demo will save two files: one pdf (that will not use Excel
  recalculation) and one xls (that will be recalculated by Excel
  when opened).
