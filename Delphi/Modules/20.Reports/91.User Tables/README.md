# User defined tables

User defined tables allow you to specify the datasets 
in the report part of the data
layer. Different from [Direct SQL](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/reports/direct-sql/index.html), user tables
work in a more controlled environment, where you can specifically deny or
grant access to the data. User Tables also allow access not SQL
databases.

## Concepts

- To use User Tables you need the following things:

   1. On the config sheet, write \"User Table(parameters)\" on the
   \"Source Name\" column, and something else on the \"Table Name\" column.
   What you write on the \"Table Name\" column is really not important, but
   you need to write something so FlexCel knows that the row has
   information. Normally you would use this column to tell FlexCel what is
   the name of the datatable you want to add, but this is not a
   requirement.

   2. On the code, you need to define a UserTable event that will actually
   add the tables to the report base on what you write on the
   \"parameters\" and \"table name\" columns.

- On this example, we just use the parameter as the name of the table
  we want to load, and use the \"table name\" column as the name of
  the table we will insert on the report. We could also use the
  parameter string as parameter to an SQL, but when doing this,
  please make sure you **validate** the parameter string against a
  hashtable of possible values, to avoid SQL injections attacks.

- Even when we do not show it here, you could pass many parameters on
  the \"Parameters\" string, using your own defined parameter
  separator, and process this string on the event.

- Unrelated to user tables, on this demo we also show how you can
  delete the categories that have no products, using a \<\#delete
  range\> tag inside a \<\#if(\<\#products.\#Rowcount\>0 ) = 0\>
  tag. ***Important note:** As FlexCel already deletes products that
  have no records, this will interfere with the \<#Delete range\> tag
  that will delete whole categories, and it would in fact delete one
  more row that what we need. So it is important that you make*
  **genericReport.DeleteEmptyRanges = false** *on the code before
  running the report*.
