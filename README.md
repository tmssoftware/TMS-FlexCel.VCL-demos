# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://download.tmssoftware.com/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.6.2 - June 2020


- **Bug Fix.** When adding a chart to a file via the API and immediately rendering it to PDF without saving it, the chart might not be rendered in the PDF file.

- **Bug Fix.** Previously the last row in "X" Bands in reports was deleted before the detail bands were inserted. This could cause unwanted behavior if the details shared the same rows as the master. Now last rows in X Bands will be removed after the details are inserted.

- **Bug Fix.** A fixed band inside a master-detail bidirectional report would behave as non fixed.

- **Bug Fix.** DbValue could raise Exceptions in some cases.

