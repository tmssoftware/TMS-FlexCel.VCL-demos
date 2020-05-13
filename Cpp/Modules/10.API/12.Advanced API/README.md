# Advanced API

This demo shows a lot of unrelated things you can do with the FlexCel
API.

It is a **complement** of what was shown in [GettingStarted](https://download.tmssoftware.com/flexcel/doc/vcl/samples/cpp/api/gettingstarted/index.html): this
means things that were shown there (like how to insert an image)
will not be repeated here. You should look at both demos when studying the
API.

The things shown here do not make much sense in the real world; they are
explicitly designed to show what can be done. Also remember that most of
this stuff can be found easier by running **APIMate** (in Start
menu-\>FlexCel-\>Tools)

The created file will be password protected, and all the passwords are
\"**flexcel**\" (without quotes)

## Concepts

- FlexCel shines at modifying existing Excel files. It has been
  designed from the start with that in mind, and to not losing
  anything in the original file. So we will
  start from an existing file with the skeleton of what we want to
  do, and modify it with code. This starting file (template.xls/x)
  could be embedded in the exe file, but this is not shown here. 
  To see an example on how to embed the template inside the exe, look at
  [Templates On The Exe](https://download.tmssoftware.com/flexcel/doc/vcl/samples/cpp/reports/templates-on-the-exe/index.html)

- The starting template has a macro. At this time we can not create
  macros with FlexCel, but we can modify a file with existing macros
  and those macros will be in the final file.

- How to copy a chart from other template and fill the values.

- How to add Outlines.

- How to freeze panes.

- How to add data validation.

- How to search and replace in a range of cells.

- How to sort a range of cells.

- How to Autofit the rows in a sheet.

- How to protect the file and cells with a password.

- As FlexCel doesn\'t convert charts between xlsx and xls, if you want
  to create an xls file you need to start with an xls template, and
  the same goes for xlsx. So we need two templates.
