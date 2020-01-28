# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 7.1.1 - January 2020


- **New __ALIAS postfix in named ranges allows multiple ranges to the same database.** Now if you need to define 2 names to the same dataset in the same sheet, you can name them like "__dataset1__ALIAS_SomeUniqueId" and "__dataset1__ALIAS_OtherUniqueId". Take a look at [Alias bands in the report designer's guide](http://www.tmssoftware.biz/flexcel/doc/vcl/guides/reports-designer-guide.html#alias-bands)

- **Bug Fix.** Sometimes in Android 32 or 64 bits you could get a BUS (10) error.

- **Bug Fix.** Effects for an image in the background of an image could be incorrectly saved. In some cases, this could cause Excel to crash.

- **Bug Fix.** When using a not standard row height for the whole sheet, FlexCel would create new rows to have automatic height, instead of having the standard row height for the sheet. This could confuse Excel.

- **Bug Fix.** FlexCel will now check that font sizes saved are between 1 and 409 points. Before it would let you save any font size, and invalid font sizes would crash Excel when opening the file.

- **Bug Fix.** In some corner cases charts saved by FlexCel inside xlsx files would fail to load.

