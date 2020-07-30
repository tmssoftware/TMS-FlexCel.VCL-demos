# Printing, previewing and exporting files

FlexCel reporting is oriented to creating files, not to print them. Once you have the files you can
save them, email them or just print them if that's what you really need. But, sometimes you
might want to directly print the report, and here is where
[TFlexCelPrintDocument](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Render/TFlexCelPrintDocument/index.html) can be helpful. You might want also to export
the report to PDF, and then you would use [TFlexCelPdfExport](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Render/TFlexCelPdfExport/index.html). Or you might want to export
the Excel file as an image, or to fax it, using [TFlexCelImgExport](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Render/TFlexCelImgExport/index.html).

All of those components share a common rendering engine, that
\"renders\" the xls file to a canvas, so it can be printed or saved.
Keep in mind that results are not 100% the same, and they cannot be, but
they are very similar.

