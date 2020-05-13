# User defined formats

User defined formats are a way to format cells in a report with code.
Normally you will want to use them if the data to format the cells is in
the database and it is not known at compile time, so you can't use
conditional formatting or formats defined in the config sheet.

## Concepts

- How to define and use a user defined format.

- You can pass parameters to the user defined format by writing them
  after the format name. In this example we show passing one
  parameter (in user format \"ZipCode\") and two parameters (in user
  format \"ShipFormat\").

- If you don't want to modify the format then **return a null
  TFlxFormat and a null TFlxApplyFormat**. We do this in the ZipCode
  user format, when the zip code is not numeric. If you wanted to
  return a format but not apply, you could set only the
  TFlxApplyFormat to null and the full TFlxFormat would be applied.

- As you can see, the colors in this demo don't make much sense. There
  is a reason for that: trying to find an example of stuff that can
  only be made with user defined formats is not easy. If you wanted
  for example to mark red the cells where a value is \> 100, then
  you would just use an Excel conditional format instead. The
  recommended order of preference would be:

   1. If you can do it with Excel conditional formats, then use that.

   2. If you can't use conditional formats then use formats defined in the
      config sheet

   3. For more complex formats where you can't use any of the above (like
    for example if the color of the cell is stored in the database, or
    the rules are too complex to code them in a conditional format or
    the config sheet), then use user defined formats.

- You can use user defined formats to format rows, columns or cells.
  As format cell has more priority than format row, in this example
  there are cells which override the row format.
