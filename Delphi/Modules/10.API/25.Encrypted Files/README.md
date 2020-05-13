# Reading and writing encrypted files

How to read and write Encrypted Excel files using FlexCel.

## Concepts

- Concepts on this demo are similar to the ones shown in [Encryption And Subtotals](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/reports/encryption-and-subtotals/index.html) example, but are repeated here so you can see them
  even if you are not using reports.

- There are **4 ways to protect data** in Excel:

   1. A password to open. This is the **only** way that will actually
   **encrypt** the file. All other methods just will add a record
   telling Excel not to modify the file. On Excel, this option is on
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
  want to interactively ask for a password **if** the file is
  encrypted.
