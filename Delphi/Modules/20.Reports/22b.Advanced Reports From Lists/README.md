# Advanced Reports from Lists.

Most of the demos here use datasets as datasources. This is just for
convenience, so we share the same data layer in all demos, and also
because the focus is in the Excel templates, not so much in the data
layer. But you can use any TList\<T\> and TArray\<T\> as a datasource in
a FlexCel report, and this is what we will show here.

This demo shows some features not shown on the [Reports From Lists](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/reports/reports-from-lists/index.html)
example.

## Concepts

- How to do a master-detail report when the details are nested many
  levels inside the master. In this case, the class **Country** has
  a **People** class, and the People class has a list of
  **Language** objects. If People was a TList\<\> inside Country and
  you wanted to use that list, you would just define a
  **\_\_People\_\_** band (this is shown in the [Reports From Lists](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/reports/reports-from-lists/index.html) example). But
  as the TList\<\> is inside People which in turn is inside Country,
  you need to define a **\_\_People.Language\_\_** band.

- How to reference a table with dots using **\[square brackets\]**. If
  you write in a cell \<\#tablename.**section.field**\> FlexCel will
  interpret this as table "tablename", field "section.field". The
  text up to the first dot is always the table, and the rest is the
  field. But sometimes you might want this to being interpreted as
  table "tablename.section", field "field". To do so, you need to
  write \<\#**\[tablename.section\]**.field\>. In this particular
  case, we have a table \"People.Language\" which we defined in the
  previous point. If we wrote in cell B1:
  \"\<\#people.language.speakers.percent\> FlexCel would interpret
  this is the table \"people\", not \"people.language\" which is
  what we need. To make FlexCel understand that we want a table
  \"people.language\" we use
  **\<\#\[people.language\].speakers.percent\>**
