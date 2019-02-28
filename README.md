# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.25


- **New parameter in ATLEAST tag in reports allows for the number of rows of a dataset to be multiple of a number.** Now when using [ATLEAST](http://www.tmssoftware.biz/flexcel/doc/vcl/guides/reports-designer-guide.html#ensuring-a-table-has-at-least-n-records) you can specify that the number of rows must be a multiple of some number. That is, that the dataset must have for example 20, 40, 60... rows but not 30 or 45. Take a look at the new [Fixed Footer demo](http://www.tmssoftware.biz/flexcel/doc/vcl/samples/delphi/reports/fixed-footer/index.html)

- **Improved handling of invalid "," in numeric formats.** A comma in a numeric format means "thousands separator" if it goes after the 3rd digit, like in "#,000". But when a comma is at the end of the format, it means scale: A format like "0," means divide the number by 1000. FlexCel already handled those cases correctly, but there are some "impossible" cases like "0,0" which are not actually valid but might be saved to xlsx files. FlexCel was interpreting that the "," in some of those cases meant scale, while for the same cases Excel was interpreting "thousands separator". Now we should behave like Excel even in the invalid cases.

- **Improved rendering of TFlexCelPreview in FireMonkey in Windows when in High dpi.** While FlexCelPreview already handled most high-dpi cases correctly, it was failing to render correctly in Windows when using FireMonkey. Now it should work correctly as in the other cases.

- **Bug Fix.** FlexCelPreview wasn't working correctly in Android. Some changes in the Android API made some methods used by FlexCelPreview deprecated. Now we call the newer methods.

- **FlexCel could fail when rendering cells with more than 32000 characters.** A cell in Excel is limited to 32767 characters, but a string in GDI+ is limited to 32000 characters. So if a cell had between 32000 and 32767 characters, FlexCel would raise an Exception when rendering the file becaus eGDI+ would fail to render the string. Now it should render correctly.

- **Improved APIMate.** ApiMate was reporting code that wouldn't compile for cells with hyperlinks.

