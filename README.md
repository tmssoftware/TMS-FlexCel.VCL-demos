# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.6.4 - July 2020


- **New syntax for ALIAS DataSets.** The ALIAS syntax introduced in FlexCel 7.1.1  could only be used in simple bands. The new "..ALIAS.." syntax doesn't have those limitations and can be used in all cases. Note that the old ALIAS syntax is still supported and you can use it for simple cases, but we recommend the new syntax for new development. Take a look at [Alias bands in the report designer's guide](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-designer-guide.html#alias-bands)

- **New "COUNT" parameter in &lt;#Aggregate> tag.** The [Aggregate Tag](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#aggregate) now accepts "Count" as aggregating method.

- **Bug Fix.** Now nested &lt;#aggregate> and &lt;#list> tags will be put in master-detail if they are related.

- **Bug Fix.** When inserting cell ranges with multiple rows used as data by pivot tables, the pivot table might not adapt correctly.

- **Bug Fix.** Sometimes when copying only format from cells, and the cells had only a column or row format, the format wouldn't be copied.

- **Bug Fix.** When exporting to HTML both headers and footers would be ignored if you specified THidePrintObjects.Header, and THidePrintObjects.Footer was ignored. Now footers will work with THidePrintObjects.Footer and THidePrintObjects.Header will only hide the headers.

- **Bug Fix.** Fixed issues with &lt;#evaluate> tag when it evaluates recursively

- **Bug Fix.** Some invalid third party xls files could fail to load.

