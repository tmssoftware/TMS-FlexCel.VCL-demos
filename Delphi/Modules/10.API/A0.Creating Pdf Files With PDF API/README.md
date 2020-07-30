# Creating pdf files with the PDF API

Even when FlexCel is not a full featured PDF package, it does have a
basic PDF API that you can use to create PDF files from scratch.

## Concepts

- How to create a PDF file using FlexCel\'s internal PDF API. The API
  is very similar to GDI+, and allows you to use a PDF \"Canvas\"
  where you can draw things in. To use the API, you need to use the class [TPdfWriter](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Pdf/TPdfWriter/index.html)

- The PDF API on FlexCel is designed to support exporting Excel
  documents to PDF using **[TFlexCelPdfExport](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Render/TFlexCelPdfExport/index.html)**. But you can use the
  same API [TFlexCelPdfExport](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Render/TFlexCelPdfExport/index.html) uses to create your own PDF files with
  code.
