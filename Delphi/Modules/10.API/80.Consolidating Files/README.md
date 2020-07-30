# Consolidating files

The FlexCel API is oriented to **modifying**
files, instead of reading and creating files as different things. So,
some most important commands on it are [TExcelFile.InsertAndCopyRange](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/InsertAndCopyRange.html) and
 [TExcelFile.DeleteRange](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/DeleteRange.html), that copy and delete ranges on existing sheets.

This is a real-world example on how you can use [TExcelFile.InsertAndCopyRange](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/InsertAndCopyRange.html) to
copy the first sheet of many different Excel files into one big file.

## Concepts

- You can use [TExcelFile.InsertAndCopyRange](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/InsertAndCopyRange.html) and/or [TExcelFile.InsertAndCopySheets](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/InsertAndCopySheets.html) to copy ranges
  across different files. Even when it is not as complete as copying
  from the same file, it does copy most of the things.

- [TExcelFile.InsertAndCopyRange](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/InsertAndCopyRange.html) behaves the same way as Excel. That is, if you
  copy whole rows, the row height and format will be copied, not
  only the values. The same happens with columns, only when copying
  full columns the format and width will be copied to the
  destination. On this demo, we want to copy all Column and Row
  format, so we **have to select the whole sheet**. If we selected a
  smaller range, say (1,1,65535,255) instead of (1,1,65536,256) no
  full column or full row would be selected and not column or row
  format would be copied.

- If the sheets you are copying have formulas or names with references to other files or sheets, you might not get the expected results. You could use [TExcelFile.ConvertFormulasToValues](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/ConvertFormulasToValues.html) and [TExcelFile.ConvertFormulasToValues](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/ConvertFormulasToValues.html)
