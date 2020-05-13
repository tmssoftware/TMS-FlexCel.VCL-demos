# Getting started

A really simple demo on how to create an Excel file with the API.

## Concepts


- Before using FlexCel, you have to add
  \"**uses VCL.FlexCel.Core**\" and \"**uses FlexCel.XlsAdapter**\" to
  your uses statements. 
  For a FireMonkey app, you would add \"**uses FMX.FlexCel.Core**\"
  instead of \"**uses VCL.FlexCel.Core**\"
  And for units that can be used in both VCL and FMX, you can add
  \"**uses FlexCel.Core**\" instead. Just make sure to have at least
  one uses with VCL or FMX in your app: The other units can use FlexCel.Core.

- The most important class here is the [TXlsFile](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/index.html) class, from where
  you can read and write to any Excel 2 or newer file.

- To set the value for a cell, use [TXlsFile.SetCellValue](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/SetCellValue.html). You can
  set any kind of object here, not just text. If you set it to
  a [TFormula](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Core/TFormula/index.html) object, you will enter a formula.

- As explained in the [FlexCel API Developer Guide](https://download.tmssoftware.com/flexcel/doc/vcl/guides/api-developer-guide.html), formats in Excel are indexes to an XF (e**X**tended **F**ormat list) 
  To modify the format on a cell, you have to assign an XF index to
  that cell. To create new XF formats, use [TXlsFile.AddFormat](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.XlsAdapter/TXlsFile/AddFormat.html)
