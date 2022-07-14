# Examples for FlexCel Studio for VCL and FireMonkey

Here you can find all the demos for [FlexCel Studio for VCL and FireMonkey](http://www.tmssoftware.com/site/flexcel.asp)

You can find a description of each demo in the [documentation](https://doc.tmssoftware.com/flexcel/vcl/index.html)
**All the demos here are also available when you install FlexCel using the setup.**

**:book: Note** We update this repository automatically every time we release a new FlexCel version. So if you have notifications integrated with github, you can subscribe to this feed to be notified of new releases.


## New in v 7.15 - July 2022


- **Experimental Lazarus support.** We now experimentally support compiling in Lazarus. See the new [Lazarus guide](https://doc.tmssoftware.com/flexcel/vcl/guides/lazarus-guide.html) for more details.

- **Support for functions FILTER, SORT, SORTBY, and UNIQUE.** There is now support for the [functions introduced in office 2021](https://doc.tmssoftware.com/flexcel/vcl/about/supported-excel-functions.html#added-functions-in-office-2021) : [FILTER](https://support.microsoft.com/en-us/office/filter-function-f4f7cb66-82eb-4767-8f7c-4877ad80c759), [SORT](https://support.microsoft.com/en-us/office/sort-function-22f63bd0-ccc8-492f-953d-c20e8e44b86c), [SORTBY](https://support.microsoft.com/en-us/office/sortby-function-cd2d7a62-1b93-435c-b561-d6a35134f28f), and [UNIQUE](https://support.microsoft.com/en-us/office/unique-function-c5ab87fd-30a3-4ce9-9d1a-40204fb85e1e).

- **Support for functions MAP, REDUCE, SCAN, MAKEARRAY, BYROW, and BYCOL.** There is now support for the [functions introduced in office 365](https://doc.tmssoftware.com/flexcel/vcl/about/supported-excel-functions.html#added-functions-in-office-365) : [MAP](https://support.microsoft.com/en-us/office/map-function-48006093-f97c-47c1-bfcc-749263bb1f01), [REDUCE](https://support.microsoft.com/en-us/office/reduce-function-42e39910-b345-45f3-84b8-0642b568b7cb), [SCAN](https://support.microsoft.com/en-us/office/scan-function-d58dfd11-9969-4439-b2dc-e7062724de29), [MAKEARRAY](https://support.microsoft.com/en-us/office/makearray-function-b80da5ad-b338-4149-a523-5b221da09097), [BYROW](https://support.microsoft.com/en-us/office/byrow-function-2e04c677-78c8-4e6b-8c10-a4602f2602bb), and [BYCOL](https://support.microsoft.com/en-us/office/bycol-function-58463999-7de5-49ce-8f38-b7f7a2192bfb).

- **Support for functions TEXTBEFORE, TEXTAFTER, TEXTSPLIT, HSTACK, VSTACK, TOROW, TOCOL, WRAPROWS, WRAPCOLS, TAKE, DROP, CHOOSEROWS, CHOOSECOLS, and EXPAND.** There is now support for the new [functions introduced in office 365 beta](https://doc.tmssoftware.com/flexcel/vcl/about/supported-excel-functions.html#added-functions-in-office-365) : [TEXTBEFORE](https://support.microsoft.com/en-us/office/textbefore-function-d099c28a-dba8-448e-ac6c-f086d0fa1b29), [TEXTAFTER](https://support.microsoft.com/en-us/office/textafter-function-c8db2546-5b51-416a-9690-c7e6722e90b4), [TEXTSPLIT](https://support.microsoft.com/en-us/office/textsplit-function-b1ca414e-4c21-4ca0-b1b7-bdecace8a6e7), [HSTACK](https://support.microsoft.com/en-us/office/hstack-function-98c4ab76-10fe-4b4f-8d5f-af1c125fe8c2), [VSTACK](https://support.microsoft.com/en-us/office/vstack-function-a4b86897-be0f-48fc-adca-fcc10d795a9c), [TOROW](https://support.microsoft.com/en-us/office/torow-function-b90d0964-a7d9-44b7-816b-ffa5c2fe2289), [TOCOL](https://support.microsoft.com/en-us/office/tocol-function-22839d9b-0b55-4fc1-b4e6-2761f8f122ed), [WRAPROWS](https://support.microsoft.com/en-us/office/wraprows-function-796825f3-975a-4cee-9c84-1bbddf60ade0), [WRAPCOLS](https://support.microsoft.com/en-us/office/wrapcols-function-d038b05a-57b7-4ee0-be94-ded0792511e2), [TAKE](https://support.microsoft.com/en-us/office/take-function-25382ff1-5da1-4f78-ab43-f33bd2e4e003), [DROP](https://support.microsoft.com/en-us/office/drop-function-1cb4e151-9e17-4838-abe5-9ba48d8c6a34), [CHOOSEROWS](https://support.microsoft.com/en-us/office/chooserows-function-51ace882-9bab-4a44-9625-7274ef7507a3), [CHOOSECOLS](https://support.microsoft.com/en-us/office/choosecols-function-bf117976-2722-4466-9b9a-1c01ed9aebff), and [EXPAND](https://support.microsoft.com/en-us/office/expand-function-7433fba5-4ad1-41da-a904-d5d95808bc38).

- **New SHEET VISIBLE tag that allows to change the visibility of a sheet in a report.** You can now use the new [Sheet Visible](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#sheet-visible) tag to hide or unhide sheets. See [https://support.tmssoftware.com/t/hide-worksheet-in-report-tags/18336/2](https://support.tmssoftware.com/t/hide-worksheet-in-report-tags/18336/2)

- **You can now run reports on TList&lt;primitive> like  TList&lt;double>.** Now you can use a list of a primitive type like TList&lt;string> in reports. You have to write &lt;#list.Value> in the template for it to work. See the modified example of [using lists as datasets](https://doc.tmssoftware.com/flexcel/vcl/samples/delphi/reports/reports-from-lists/index.html). See [https://support.tmssoftware.com/t/using-list-as-datasource/18513/4](https://support.tmssoftware.com/t/using-list-as-datasource/18513/4)

- **Ability to change the newline separator when exporting to CSV or Fixed-lenght text files.** By default FlexCel exports to CSV or fixed length using the newline separator from the OS. (that's CR/LF in Windows and LF in Unix/macOS). Now you can explicitly define the newline string when calling [Export](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Core/TExcelFile/Export.html) See [https://support.tmssoftware.com/t/settings-for-new-line-character-when-saving-texcelfile-to-csv/17886/3](https://support.tmssoftware.com/t/settings-for-new-line-character-when-saving-texcelfile-to-csv/17886/3)

- **Support for Array formulas, UDFs, external names and Lambda names in Tokens.** [Tokens](https://doc.tmssoftware.com/flexcel/vcl/tips/using-tokens-to-get-information-from-formulas.html) now support Array formulas, user-defined functions (UDF), names that refer to external files, and Lambda names (like if you write in a formula "=MyName(4)" and MyName is a lambda function.). Standalone lambda functions (without using names) were already supported. The only thing not supported in tokens right now is what-if tables.

- **Function "INDEX" is now array-enabled.** Now you can pass arrays in the col and row parameters of the [INDEX](https://support.microsoft.com/en-us/office/index-function-a5dcf0dd-996d-40a4-a822-b56b061328bd) function and FlexCel will return an array of results.

- **Improved behavior when inside Docker containers.** Now when you try to run FlexCel in a Docker container without any fonts installed, FlexCel will tell you the problem and how to fix it. There is also a [new tip](https://doc.tmssoftware.com/flexcel/vcl/tips/running-flexcel-inside-docker-containers.html) explaining how to handle fonts inside docker containers.

- **Bug Fix.** The functions SWITCH and IFS could fail is some border cases.

- **Bug Fix.** Bubble charts could render bubbles of the wrong size if there were empty points in the chart data with bubble size different from 0.

- **Bug Fix.** Negative dates now show empty instead of "########" when they are labels of charts. This is the behavior Excel has too.

- **Bug Fix.** Cells with diagonal borders, but borders style set to none could be rendered by FlexCel in some cases.

- **Bug Fix.** Some files containing khmer characters (or other complex scripts) could raise an exception when exporting to pdf.

- **Bug Fix.** Sometimes RenderObjects would not render the images. See [https://support.tmssoftware.com/t/images-disappear-sometimes/18567/6](https://support.tmssoftware.com/t/images-disappear-sometimes/18567/6)

- **Bug Fix.** There could be errors in some specific cases when copying sheets from one file to another which had linked formulas.

- **Bug Fix.** The limit for custom formats in xls files was in 4000 when it really is 4050. We've updated FlexCel to allow 4050 custom formats when saving as xls.

- **Bug Fix.** The [TYPE](https://support.microsoft.com/en-us/office/type-function-45b4e688-4bc3-48b3-a105-ffa892995899) function didn't return 128 for lambda functions.

- **Bug Fix.** When third-party files had invalid modify/creation dates, FlexCel would refuse to open them. Now it will just ignore invalid dates and let those properties empty.

- **Bug Fix.** APIMate generated some code with invalid syntax in C++.

