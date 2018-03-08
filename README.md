# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.19.0 - March 2018


- **Support for Khmer language when exporting to pdf.** The PDF engine in FlexCel now includes a Khmer shaper which is able to correctly create Khmer documents, as long as the Khmer fonts you are using are OpenType (that is they contain GSUB and GPOS tables).

- **Reduced memory usage when exporting.** Exporting to PDF and SVG were tweaked to consume less memory in high-performance environments where many threads are exporting at the same time. Also the performance of the pdf engine was improved.

- **Images made transparent with Excel now are converted between xls and xlsx files.** Now FlexCel will convert the transparent color parameter between xls and xlsx files.

- **Bug Fix.** In some cases after copying rows, then deleting sheets and then inserting or deleting rows, the formula bounds cache could be invalid and formulas would fail to update in the lase deleting of the rows.

- **Bug Fix.** The round function now behaves more like Excel and not like C# in some border cases.

- **Bug Fix.** A file with too many objects with the same name could cause an stack overflow.

- **Bug Fix.** Formulas with intersections of a name with a 3d range would be interpreted as #name instead of the correct formula.

- **Bug Fix.** In some invalid cases the indirect function would throw exceptions that would be later processed. While the result was still ok, those exceptions could slow down a lot recalculation in a file with thousands of formulas.

