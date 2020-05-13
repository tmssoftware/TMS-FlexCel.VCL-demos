# Reading Excel files

A demo showing how to read the contents of an Excel file using FlexCel.

## Concepts

- To read an Excel file you use the [TXlsFile](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/index.html) class, from where you
  can read and write to any Excel 2.0 or newer
  file.

- To get the value for a single cell, use [TXlsFile.GetCellValue](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/GetCellValue.html).

- To get the value for a cell when looping a full sheet, use
  [TXlsFile.GetCellValueIndexed](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/GetCellValueIndexed.html). It is faster than using
  GetCellValue since you will only read the used cells.


- [TXlsFile.GetCellValue](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/GetCellValue.html) and 
[TXlsFile.GetCellValueIndexed](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/GetCellValueIndexed.html) will return a 
TCellValue that will be one of the objects allowed in an Excel cell

- With GetCellValue and GetCellValueIndexed you will get the actual
  values. But if you want to actually display formatted data (for
  example if you have the number 2 with 2 decimals, and you want to
  display 2.00 instead of 2), you need to use other methods. There
  are 2 ways to do it:

   1. [TXlsFile.GetStringFromCell](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/GetStringFromCell.html) will return a rich string with the
   cell formatted.

   2. FormatValue will format an object with a
   specified format and then return the corresponding rich string.
   TFlxNumberFormat.FormatValue is used internally by
   GetStringFromCell.

- In Excel, **Dates are doubles**. The only difference between a date
  and a double is on the format on the cell. With
  FormatValue you can get the actual string that is
  displayed on Excel. Also, to convert this double to a DateTime,
  you can use [TFlxDateTime.FromOADate](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Core/TFlxDateTime/FromOADate.html).
