# Includes

The \<\#[Include](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#include)\> tag is very useful to keep your reports modular.

## Concepts

- Included files can contain nested included files inside.

- There are two main ways to use the includes: As a common reusable
  part of your reports (like a header), or together with \<\#if\>
  tag to create different layouts of subreports depending on the
  data. Use the \"different layouts\" only if data on the detail
  changes in fact very much depending on the data on the parent. If
  not, using \<\#If\> and \<\#format cell\> will probably be better.

- An included report \"inherits\" all the variables and datasets of
  the parent. The included report is a subreport that is precompiled
  separated from the parent and run on its own sandbox. It is
  \*not\* pasted on the main report until it is run, and it can\'t
  modify things on the parent.

- When creating an included report it can happen that column widths
  are different on the including and the included report. You might
  have a template header.xls that you include on every report, but
  the including reports can have different column widths, changing
  the header. One solution to this is to **use only textboxes and
  images** on header.xls, **group them all together**, and finally
  right click on the group and select **\"Move but not size with
  cells\".** This way, the included header will look the same
  everywhere.
