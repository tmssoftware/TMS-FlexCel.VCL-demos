# Direct SQL

In normal FlexCel reports, you create the data layer in code and the
template in Excel. This allows your user to easily modify the
presentation layer with Excel and without needing to modify the code.

While this is a very good choice for most reports (as the data layer
does not change much, and the presentation does), sometimes you might
want to allow your users to directly modify the data layer from Excel.
This is when you can use [Direct SQL in templates](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-designer-guide.html#direct-sql-in-templates).

## Concepts

- By default, you **can\'t use Direct SQL on reports**. To be able to
  use it, you need to add a connection to the report with
  [TFlexCelReport.AddConnection](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Report/TFlexCelReport/AddConnection.html) in the code.

- Allowing the final user to specify the SQL directly on the report
  might carry **big security risks**.

   1. A user might use the SQL to modify the data. For example, instead of
   a normal SQL like **\"select \* from customer\"** he might write
   **\"delete from customers\"** and erase all information. While
   FlexCel does a little validation on the SQL string, (for example
   it will not allow SQLs not starting with \"SELECT\") there are
   always ways to modify the data.

   2. A user might get access to data you don\'t intend him to. For
   example, he might know the user passwords are on the table
   \"Users\" and use an existing unrelated report to get the data
   from this table.

- To keep your application secure, it is recommended that:

-   You give **Read Only** access rights to the connection you add to
    the report, and **only give access to the tables the report needs
    to use**

-   You **enable Direct SQL** on cases **where you can control the
    templates**. For example on a web application (where the templates
    are always on the server) or a GUI App where templates are kept on
    a server. Or, of course, if you don\'t care about the data because
    it is not important, or the customer has administrator access to
    all the database anyway.

-   Do **not use Encrypted templates** to give security to the system.
    While this can give some extra security, encrypted xls files can
    be cracked with tools available in Internet.

- To use Direct SQL on the templates, you write **SQL(connection,
  sqlstring)** on the \"Source name\" column in the config sheet.

- **You can\'t use expressions inside an SQL statement**. The
  \"sqlstring\" you pass as parameter to the SQL() command will not
  allow any expression replacement. Again, **this is a security
  decision** to avoid **SQL Injection attacks.** (If you don\'t know
  what this is, you can search for \"SQL injection\" in Internet to
  get a more in-depth description of the problem)

- As you can\'t use expressions inside the SQL, you need to be able to
  pass parameters to it. **To pass a parameter to the SQL:**

- In SQL databases you can normally use two types of parameters: **positional** (\"?\") and
  **named** (\"\@param\" or \":param\"). On order to keep your
  templates database-independent, **FlexCel Templates will always use named
  parameters starting with \"@\"**. Even if you are accessing ODBC,
  you should write \"SELECT \* from table where field = \@field\"
  and never \"SELECT \* from table where field = ?\" in the
  template. The only supported syntax in templates is "@" parameters; FlexCel will convert the parameters to what's needed when calling the actual SQL.

- You then can set the parameters in the code, by using
  [TFlexCelReport.AddSqlParameter](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Report/TFlexCelReport/AddSqlParameter.html) This is not database
  independent, and you need to add the correct type of parameter for
  the actual database here.
