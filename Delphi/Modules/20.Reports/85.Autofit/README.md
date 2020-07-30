# Autofiting rows and columns

When using FlexCel, you can opt for autofit certain rows so they adjust
to their content. By default, this is **not** done automatically for all
rows since most rows do not need autofit, and so you need to use a special
\<\#[Row Height](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#row-height)(autofit)\> tag. *Make sure you read 
[Autofitting Rows and Columns](https://doc.tmssoftware.com/flexcel/vcl/guides/api-developer-guide.html#autofitting-rows-and-columns) in the API developer's guide for more information on autofitting.*

## Concepts

- With default settings, autofitting rows in FlexCel will not change the
  autofitting status of the row. So, when you open this file in
  Excel, all row heights will be recalculated again, changing page
  breaks, but guaranteeing that all text is visible. If you prefer
  to keep autofitted row fixed when you open them on Excel, make the
  row fixed on the template or use the \<\#[Autofit Settings](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#autofit-settings)\> tag.

- You can use an **\"Adjustment\"** parameter on the \<\#[Row Height](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#row-height)\> and \<\#[Autofit Settings](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#autofit-settings)\> tags, to
  leave a margin for text. Remember that normally Excel text is a
  little wider than FlexCel\'s, so it might need more room.
  \"**AdjustmentFixed\"** is other parameter that can be used for
  the same thing.

- You can use different types of autofit depending on your needs, and
  they are shown on different sheets on this demo. There are
  normally 2 \"modes\" of autofit:

   1. The default. FlexCel autofits the rows so it can print/export
   fine, but leaves the rows to autofit so Excel will autofit them
     again when you open the file. This mode ensures text will not be
     \"cropped\" in Excel or FlexCel, but the row heights will be
     different in both.

   2. \"Fixed\" mode. Here, FlexCel calculates the Autofit and fixes
   the row to that size. When you open the file in Excel rows will
   not change, so the page will print the same. But, as Excel
   normally uses more space to print the words, some words might be
   cropped when opening on Excel. To avoid cropping, it is
   recommended that you use a large Adjustment, of about 150.
