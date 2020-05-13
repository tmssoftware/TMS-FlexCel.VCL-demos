# User defined functions

Here we will see how to define a user function to calculate the number
of orders by employee and shipper. This example is similar to the 
[Pivot Tables](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/reports/pivot-tables/index.html) example, but using only static normal cells.

## Concepts

- How to define user functions for non-standard needs. By the way: Try
  to define only as little user functions as you really need. User
  functions are on code, and a change on them means that you have to
  recompile the code.

- We defined two ranges here, one horizontal and one vertical. The
  user defined function here will return a value for a couple of
  those values, allowing us to create a "static" pivot table.
