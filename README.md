# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.8 - November 2020


- **Support for reading fonts from the disk even if the graphics library returns that information.** There is a new property in FlexCelConfig: [ForcePdfFontsFromDisk](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/FlexCelConfig/ForcePdfFontsFromDisk) which allows you to select if FlexCel should use the font data returned by the graphics library if possible, or always scan a folder with fonts.

- **Improved compatibility with invalid xls files.** Now FlexCel can ignore invalid ministreams when reading corrupt/invalid xls files.

