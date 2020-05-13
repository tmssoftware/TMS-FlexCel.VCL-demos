# Lookups

Sometimes you have a field with a value that is read from another table.
On this example, the field Employees.ReportsTo is a number, which points
to the EmployeeID of the supervisor. Using the \<\#lookup()\> tag, you
can write the name of the supervisor, not only his EmployeeID.

## Concepts

- How to use the **\<\#[Lookup](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-tag-reference.html#lookup)\>** tag to search for a field in another
  table.

- Normally you will make **lookup on one field**, as in the example:
  \<\#lookup(Employees;EmployeeID;\<\#Employees.ReportsTo\>;LastName)\>.
  (This code lookups the value of ReportsTo, on the table Employees,
  searches for the field EmployeeId and returns LastName. Now,
  sometimes you might want to **lookup on more than on field**.
  Imagine that you wanted to search on the table Employee, but the
  record that not only has EmployeeID = ReportsTo, but
  Country=\"Spain\". You can use the **[Array](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-tag-reference.html#array)\>** tag to search here:
  \<\#lookup(Employees;EmployeeID,Country;\<\#array(\<\#Employees.ReportsTo\>;Spain)\>;FirstName)\>

- Unrelated to Lookups, we show two other Excel features you can use:
  We froze the top panel so when you scroll down, the header is
  always visible, and we added an AutoFilter to find Employees. We
  just added them on the template, and they continue to exist on the
  generated report. Note that you can\'t define them in an include.
