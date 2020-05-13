# Encryption and subtotals

Two unrelated concepts are shown here. First, how to protect and encrypt
a report. Second a frequently asked question: how to make a grand total
out of sub totals.

## Concepts

- There are **4 ways to protect data** in Excel:

   1. A password to open. This is the **only** way that will actually
   **encrypt** the file. All other methods just will add a record
   telling Excel not to modify the file. In Excel, this option is on
   -\>Tools-\>Options\... Security tab.

   2. A password to modify. Also on -\>Tools-\>Options-\>Security tab,
   this password will allow you to open the file, but not to save it.
   The file will not be encrypted, and you can always use Save As to
   save the file.

   3. Protecting the workbook. This will cause a pseudo-encryption of
   the file, but the password used to encrypt will be always the
   same, no matter what password you enter. On Excel, this option is
   at -\>Tools-\>Protection-\>Protect Workbook.

   4. Protecting the sheet. This option will protect the cells,
   objects, etc on a particular sheet.
   -\>Tools-\>Protection-\>Protect Sheet.

- When the file is encrypted (using a password to open) FlexCel
  supports four different encryption modes: 
  **Excel 95**, **Standard Excel97/2000 encryption**, 
  **Excel 2007 xlsx encryption** and
  **Excel 2010 \"agile\" xlsx encryption**.

- To open an encrypted file, you can set the **OpenPassword** property
  or the **OnPassword** event. Use the OnPassword event when you
  want to interactively ask for a password \*if\* the file is
  encrypted.

- Calculating a **grand total**. This is not related with encryption,
  but we used this example to show how it can be done. It is not
  really 100% FlexCel related either, but it is a frequently asked
  question. Imagine you have a master-detail report, with subtotals, 
  and you want to calculate the sum of subtotals. You could do this
  on three ways:

   1. You could manually add a formula like \"=Sum(A50, A60,
   A63\...)\" after the report is generated to calculate the sum of sub
   totals. Even when this sound like the natural approach, it is
   highly **not recommended**. Besides the effort needed to
   dynamically calculate the formula, formulas on Excel have a
   maximum of characters and you could end up on a formula too long
   message. Also, the sheet will become slow to calculate, and the
   formulas too complicated to follow. And you would be adding a lot
   of code to the report, that will not let the final user change the
   cells on the template.

   2. You can do it all on the template. By using different columns to
   hold different values and then merging the cells and hiding a
   column, you can get it to look as if it were done with way 1. But
   the formulas are much simpler here, and you do not need code to
   adapt them. This way is what we show here.

   3. There is a third option using the [SubTotal](https://support.office.com/en-us/article/subtotal-function-7b027003-f060-4ade-9040-e478765b9939) Excel function. The
   SubTotal Excel function is unique in that it does not take other
   SubTotal() functions in account when doing its job. So you can
   have multiple SubTotal() functions in the same column, and they
   will not interfere with each other.
