# Generic reports

When you are reporting from an unknown database (for example if you are
writing a DbExport app) you can\'t use a fixed template, because you
don\'t know what the columns will be. While FlexCelReport is designed to
handle fixed-form templates, there is some support also for generic
reports. This example together with the [Meta Templates](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/reports/meta-templates/index.html) 
 and [Generic Reports 2](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/reports/generic-reports-2/index.html) examples show what
can be done. For more advanced generic reports, you should probably use
the API directly.

## Concepts

- You can use **\<\#DataTable.\*\>** to write a full row of data from
  a datatable. Cells at the right of the cell containing the
  \<\#DataTable.\*\> tag will be overwritten.

- You can use **\<\#DataTable.\*\*\>** to write a full row with the
  column captions on a datatable. Cells at the right of the cell
  containing the \<\#DataTable.\*\*\> tag will be overwritten.

- **\<DataTable.\*\*\>** can be placed anywhere, it doesn\'t need to
  be inside a named range. **\<DataTable.\*\>** should be inside a
  named range populating DataTable.

- **Dates:** As dates on Excel are just numbers formatted as date,
  \<\#DataTable.\*\> will format the cell when the column has a
  DateTime value. If the time part of the datetime is 0, time will
  not be entered.

- You can use expressions in cells with **\<\#DataTable.\*\>** and
  **\<\#DataTable.\*\*\>** tags. You can also get the current value
  of the tag in the cell by writing **\<\#DataTable.\*\> or
  \<\#DataTable.\*\*\>** again in the same cell. For example, the
  tags:
  ```
  <#Table.**><#Column Width(autofit;110)>
  ```
  Will autofit all the columns in the range expanded by the
  \<\#Table.\*\*\> tag. While the tags:
  
  ```
  <#Table.*><#if(<#evaluate(mod(column(),2)=0)>;<#format cell(light)>;)>
  <#if(<#table.*>="BONAP";<#format cell(blue)>;)>
  <#if(<#table.**>="OrderDate";<#format cell(longdate)>;)>
  ```
  will perform 3 things: On the first, it will paint alternating columns
  with the \"light\" format. On the second, it will it will highlight
  cells that contain the string \"BONAP\" in blue. On the third, it will
  format the cells in the \"OrderDate\" column to have a longer date
  format.

- **Autofilters** will be automatically expanded with the
  \<\#DataTable.\*\*\> tag. You only need to set them in the cell
  with the tag.
