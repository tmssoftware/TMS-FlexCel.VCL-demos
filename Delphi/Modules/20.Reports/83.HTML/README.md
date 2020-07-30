# HTML

A demo that shows how to use HTML formatted strings directly on FlexCel.
On this example we used to connect to **Yahoo Travel** web service, and
format the results into an Excel or pdf sheet. As Yahoo Travel doesn't exist anymore, 
some sample data is included to work offline without connecting.

## Concepts

- FlexCel supports a light subset of HTML commands, like *\<b\>,
  \<br\>,* and the escaped characters like *&amp;*. But this should
  be enough to for having rich format inside cells.

- Any HTML tag that FlexCel cannot parse will be ignored.

- Note how the word \"London\" is in bold in titles like \"**London**
  and Paris\". This is because the HTML returned contained
  those tags.

- You can allow HTML in a [TFlexCelReport](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Report/TFlexCelReport/index.html) in two ways:

   1. You can enable it globally by setting [TFlexCelReport.HTMLMode](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Report/TFlexCelReport/HTMLMode.html) =
   true, and disable it where not needed with the \<\#[HTML](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#html)(false)\>
   tag. This is not normally recommended, since when in HTML mode all
   strings have to be html strings, where for example two spaces mean
   only one, and carriage returns are created with \<br\> tags.

   2. You can enable it on a cell by cell basis, by using the
   \<\#[HTML](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#html)(true)\> tag. This is the approach we use here.

- How to set [Intelligent Page Breaks](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-designer-guide.html#intelligent-page-breaks). FlexCel will add page breaks so
  all entries are kept together when printing or exporting to pdf.

- You can also set an hyperlink in an image. In this case, we wrote an
  hyperlink in the image pointing to the URL in the database. This
  link is also exported to pdf.
