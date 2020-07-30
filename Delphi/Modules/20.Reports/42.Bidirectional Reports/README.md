# Bidirectional reports

In this example we will create a report that grows both horizontally and
vertically.

## Concepts

- Normally ranges in FlexCel reports can't intercept. But there is an
  exception: If you define a range in the shape of a cross, FlexCel
  will do a bidirectional report.

- In Bidirectional reports the **row range acts as the master**, and
  **the column range as the detail**. **You can have more than one
  column range for the same row**, but **not more than one row range
  for the same column**.

- In this example we have two different column reports using the same
  row report. In the first column we show which employees have
  orders for a given customer, and in the second we show the orders
  for that customer.

- Those two columns are conceptually different: In the first we use a
  column and row dataset which are not related. This will create a
  square with all the records of the column dataset for the column,
  and all the records of the row dataset for the rows. In the second
  column, the column dataset (orders) is related to the row dataset
  (customers). So the number of columns will be different for each
  row, depending in how many orders that customer has. FlexCel will
  insert as many columns as the maximum numbers of orders for any
  customer.

- You can look at the [User Defined Functions](https://doc.tmssoftware.com/flexcel/vcl/samples/delphi/reports/user-defined-functions/index.html) example for another
  demo on how bidirectional reports work.
