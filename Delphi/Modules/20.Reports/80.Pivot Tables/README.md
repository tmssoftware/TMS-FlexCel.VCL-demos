# Pivot tables

Pivot Tables are a very useful (and complex) Excel feature that allows
you to summarize data and see it from different points of view just by
clicking on fields.

FlexCel doesn't have support on the API for Pivot tables, but as usual,
you can define one on the template, fill in the data as you would in a
normal report, and the Pivot Table will be refreshed with it. There are
some issues and things you have to take in account to make it work, but it
is usually worth it.

Pivot tables work in both xls and xlsx, but FlexCel won\'t convert
between them. A report made from an xls template must be saved as xls,
and a report made from an xlsx template must be saved as xlsx for pivot
tables to be preserved.

## Concepts

- **Xls Templates**: Excel saves a cache data for opening the pivot
  faster next time, and you can\'t use this on FlexCel because it is
  not implemented (FlexCel does not calculate the data in the pivot
  table). So, in the template, right-click the table, **select
  \"Don\'t save on open"**, and **deselect \"Update on open\"**.
  *Note: FlexCel will make this automatically in xlsx templates, so
  you don\'t need to do it*.

- **Xls Templates**: **Defining a Named Range for the table data**:
  The only way to get the Pivot Table range updated as you insert
  rows, is to define a named range (\"TableData\" in this example).
  When asked for the range to the Pivot table, refer to it. Do not
  select the range directly, or it won\'t be expanded. *Note: This
  doesn\'t apply to xlsx templates, in those cases FlexCel will also
  expand direct ranges and you don\'t need to use a name, even when
  it isn\'t a bad idea anyway.*

- **[X ranges](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-designer-guide.html#x-ranges)** again! We need the pivot table range to be 2 rows at
  least, but we don\'t want the second row to be on the generated
  report. Same as in [Charts](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/reports/charts/index.html), we use an \"X\" range that will erase
  the last row once it is done.

- **\".\" Sheets and \"\_.\" ranges** . As FlexCel by default
  processes all sheets on the file, we would have a problem because
  it doesn\'t find the datasets on the Pivot Table sheet. One way to
  exclude FlexCel from reading a sheet, prefix its name with a dot
  \".\" The dot will be erased from the final sheet name. Here it
  doesn\'t work because the name of the sheet changes, and then the
  pivot chart loses its reference. So, we use a \".\" range. Ranges
  starting with a dot (\"\_.\", \"\_\_.\", \"I\_.\" and \"II\_.\")
  are ignored by FlexCel.

- When you insert cells the pivot table won\'t move. On this example,
  we included a file on cell A1, but we left the rows empty before
  inserting the pivot table. In general, the best you can do is to
  leave the pivot table alone on a sheet, without any \<\#tags\>,
  and inside a \"\_.\" range.

- There is a know issue with Excel and Internet explorer if you are
  doing a **web application** and trying to **open the file directly
  from ie.** When opening the file, ie will save it in a temporary
  folder with a name like \"filename\[1\].xls\" and then open it
  with Excel. The problem is that Excel does not allow **\[\]**
  characters in a filename, because it uses them in formulas to
  specify external files. In this case you will get an error and
  Excel won\'t update the pivot chart. **Note that this is not
  related in any way to FlexCel, nor we can do anything to solve
  it.** The problem happens with any Excel file with pivot tables
  that you open directly from ie, and the only solution is to save
  the file to disk before opening it, or use other browser. You can
  find more information at:
  <http://www.microsoft.com/office/community/en-us/default.mspx?mid=146e209c-7f5d-4c5c-865c-42cfdb09d79b&dg=microsoft.public.excel.crashesgpfs>
  and
  <http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=1398316&SiteID=1>

- Excel by default does not delete old entries in the comboboxes
  inside the pivot table, no matter how much you refresh the pivot
  table. This means that you will see "\...delete row\..." inside
  those comboboxes, since those entries were there when you created
  the template and they won't be deleted. You could get rid of them
  with a macro, but adding a macro to a sheet will add a security
  warning, so probably it is not worth it. But there is other
  undocumented way: If you can get a copy of Excel 2007 or newer to
  edit the template, you can set the "Pivot Table options", "Data"
  tab, "Number of items to retain per field" and set it to "none".
  The good thing about it is that once you change it, **it will work
  also in Excel 2003**, even when there is no way to change that
  option from Excel 2003 user interface.
