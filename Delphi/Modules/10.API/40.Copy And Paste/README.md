# Copy and paste

ExcelFile has a group of methods allowing you to copy/paste from/to
FlexCel to/from Excel in native Excel format. All methods copy and paste
the data on BIFF8 and Tabbed-Text format, to allow for copying/pasting
from other sources besides Excel.

Copying and pasting in native BIFF8 format is a great advance over
copying/pasting on plain text only. It allows you to keep cell
formats/colors/rounding decimals/merged cells/etc. It allows a new world
of interoperation between your applications and Excel. Your users will
be able to interchange data back and forward between your application
and Excel just by copying and pasting. But keep in mind that it has its
limitations too:

- It can\'t copy/paste images

- It can\'t copy/paste strings longer than 255 characters

- It can\'t copy the data on multiple sheets.

I would like to say that these limitations are not FlexCel\'s fault. The
BIFF8 specification is correctly implemented, those are limitations on
Excel\'s part.

Of course, Excel can copy and paste everything without problems, but
this is so because Excel doesn\'t use the clipboard to do the operation.
If you close all instances of Excel, open a Worksheet, copy some cells
to the clipboard, close Excel and open it again you will run into the
same limitations. Copy/paste limitations on Excel don\'t show when it is
kept in memory.

## Concepts

- FlexCel methods return datastreams for maximum flexibility. No data
  will be actually copied/pasted from/to the clipboard by FlexCel,
  this is your task. Here you can see how it is done.
