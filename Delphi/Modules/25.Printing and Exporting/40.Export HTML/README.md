# Exporting Excel files to HTML

FlexCel can natively export an Excel file to HTML, in many formats like XHTML 1.1, HTML 3.2, HTML 4.1 strict or HTML 5.

## Concepts

- HTML is a format that makes emphasis in semantics over presentation,
  and because of this reason the HTML file will not be as faithful
  to the original file as a PDF. PDF are targeted especially for
  handling presentation. Anyway, the output is very similar and in
  many ways better (and more cross-browser) than the HTML generated
  by Excel itself when saving to HTML.

- Among the things that are **not** exported you can find:

- ActiveX objects

- 3D Charts (They will be rendered as 2d)

- Not common AutoShapes (most used Autoshapes, as rectangles, rounded
  rectangles, ellipses, etc are exported)
