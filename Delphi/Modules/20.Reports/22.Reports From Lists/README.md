# Using List\<T> as datasource

Most of the demos here use datasets as datasources. This is just for
convenience, so we share the same data layer in all demos, and also
because the focus is in the Excel templates, not so much in the data
layer. But you can use any TList\<T\> and TArray\<T\> as a datasource in
a FlexCel report, and this is what we will show here.

## Concepts

- How to run a report from a TList\<\> of objects.

- When using TList\<T\> and TArray\<T\> as datasource, you can use any
  public property of T in the report, any public field and any
  public function which has no parameters. So if type T has a public
  property \"LastName\", you can access it with \<\#dt.LastName\>.

- **Master detail with implicit relationships**. When a public
  property of a collection of objects is other collection of
  objects, the property is considered as a detail of the main
  collection. In this example \"Elements\" is a property of
  \"Categories\", and so there is an implicit relationship between
  them.

- **Master detail with explicit relationships.** While when using
  TLists you will normally use implicit relationships, you can also
  relate any two collections of objects with a relationship, as you
  could with datasets. In this example, \"ElementName\" is
  explicitly related to \"Elements\" by calling [TFlexCelReport.AddRelationship](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Report/TFlexCelReport/AddRelationship.html).
