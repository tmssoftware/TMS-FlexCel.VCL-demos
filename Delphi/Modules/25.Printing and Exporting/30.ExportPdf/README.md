# Exporting Excel files to PDF

FlexCel can natively export an Excel file to PDF, without needing to
have Excel or Adobe Pdf installed.

## Concepts

- FlexCel PDF output is not 100% identical to Excel output, and it
  can't be that way. But it is very similar, and this includes
  fonts, colors, margins, headers/footers/images, etc. It can print
  cells with multiple fonts, it can replace the macros on headers
  and footers (like \"&CPage &P of &N\"), export headers and
  hyperlinks, correctly export conditional formats and the list goes
  on.

- Among the things that are **not** exported you can find:

  - ActiveX objects

  - 3D Charts (They will be rendered as 2d)

  - Not common AutoShapes (most used Autoshapes, as rectangles, rounded
    rectangles, ellipses, etc are exported)
