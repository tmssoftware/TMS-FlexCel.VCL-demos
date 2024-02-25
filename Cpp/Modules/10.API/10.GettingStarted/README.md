# Getting started

A simple demo showing how to create an Excel file with the API from scratch.

## Concepts


- Before using FlexCel, you have to add
  \"**uses FlexCel.VCLSupport**\", \"**uses FlexCel.Core**\" and \"**uses FlexCel.XlsAdapter**\" to
  your uses statements. 
  For a FireMonkey app, you would add \"**uses FlexCel.FMXSupport**\"
  instead of \"**uses FlexCel.VCLSupport**\"
 You need to use FMXSupport/VCLSupport units once in your app, so FlexCel can initialize the correct graphics engine. There is no need to add them more than once.

- The most important class here is the [TXlsFile](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.XlsAdapter/TXlsFile/index.html) class, from where
  you can read and write to any Excel 2 or newer file.

- To set the value for a cell, use [TXlsFile.SetCellValue](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.XlsAdapter/TXlsFile/SetCellValue.html). You can
  set any kind of object here, not just text. If you set it to
  a [TFormula](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TFormula/index.html) object, you will enter a formula.

- As explained in the [FlexCel API Developer Guide](https://doc.tmssoftware.com/flexcel/vcl/guides/api-developer-guide.html), formats in Excel are indexes to an XF (e**X**tended **F**ormat list) 
  To modify the format on a cell, you have to assign an XF index to
  that cell. To create new XF formats, use [TXlsFile.AddFormat](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.XlsAdapter/TXlsFile/AddFormat.html)
