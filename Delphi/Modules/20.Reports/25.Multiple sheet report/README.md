# Multiple sheet report

Here we are going to create a report using each entry on the table
Categories to create a new sheet. For each category, we will list the
products and the order details of each product.

## Concepts

- How to use a table to create a report on multiple sheets.

- [Defining Custom Formats](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-designer-guide.html#defining-custom-formats)
  to have alternating color rows

- This is a three level master detail report: Category -\> Products
  -\> Order Details. The first level is on the sheet, and this is
  handled automatically. Any datatable with a relation defined with
  \"category\" datatable will be filtered accordingly on each sheet.

- Grouping and Outlining. To create a report using outlining, just
  define the outline on the template and it will expand as needed.
