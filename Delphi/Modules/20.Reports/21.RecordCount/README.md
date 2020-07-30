# Record count

FlexCel Reports need to know in advance how much records to insert. But
some DataSet components in Delphi don\'t return the correct RecordCount,
and we need to supply the number of rows to it. For more information read the section
[About Record Count in DataSets](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-developer-guide.html#about-record-count-in-datasets) in the Report developer's guide.

## Concepts

- We will be using ADO with a **CursorType** set to
  **ctOpenForwardOnly**. In this mode the record count returned is
  -1 (the other demos in this section use the default CursorType)

- We are showing 2 different ways to count the records:

   1. By using a \_\_FLEXCELCOUNT field.

   2. By setting the parameter **recordCountMode** to 
    SlowCount when
    calling [TFlexCelReport.AddTable](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Report/TFlexCelReport/AddTable.html) or
    [TFlexCelReport.AddConnection](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Report/TFlexCelReport/AddConnection.html).


> [!Note]
> In this specific case setting SlowCount to true isn\'t
> strictly necessary. As RecordCount is -1, FlexCel can figure out
> that the number is wrong and do the slow count automatically. You
> need to specify SlowCount for those components that return the
> number of records fetched, like for example 25 because in those
> cases FlexCel can\'t know that this number isn\'t the real record
> count.

