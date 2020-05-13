# Splitting datasets

It is a normal request when doing a report for printing, to be able to
manipulate the page breaks so there are no \"hanging\" lines at the end
or beginning of a page. Since Excel does not provide this functionality,
it is impossible for us to do it. But, you can use the \<\#SPLIT\> tag
on the config sheet to for example fit 40 records on each page.

## Concepts

- How to use the SPLIT tag to create a master-detail relationship of a
  dataset with itself, where each detail has a fixed number of
  records.

- The SPLIT tag is a little special in that it does not create a real
  dataset, but it filters the data on the fly instead. This has some
  restrictions, the most important being that the master dataset and
  the clhild must be in direct relationship one with the other. If
  *MasterOrders* and *Orders* are both master and detail, you can
  not have *MasterOrders/Other/Orders* ranges each one inside the
  other. You must have *Other/MasterOrders/Orders* or
  *Orders/MasterOrders/Other*. This restriction normally is
  harmless.

- It is not shown on this demo, but note that you could use a
  parameter on the \"record count\" parameter of the split tag. For
  example: \<\#Split(table;\<\#splitcount\>)\> and dinamically
  change the split range on the application before running the
  report.
