# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](http://www.tmssoftware.biz/flexcel/doc/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New on v 6.17.3.0 - October 2017


- **New TFlxNumberFormat.PercentCount method.** The new method [TFlxNumberFormat.PercentCount](http://www.tmssoftware.biz/flexcel/doc/vcl/api/FlexCel.Core/TFlxNumberFormat/PercentCount.html) allows you to know how many non escaped % symbols are in a format string.

- **Better display of negative zero numbers.** Now a negative number that displays as zero like "-0.001" formatted with a "0.0" format string will display as "0.0" and not "-0.0"

- **Better handling of the Windows Font folder.** Now in we use a different set of APIs to retrieve the Windows font folder and fallback to other methods if the OS is XP or Server 2003 where those APIs are not supported.

