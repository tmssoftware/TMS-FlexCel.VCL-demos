# Getting started with Reports

A really simple demo on how to create an Excel report. No database is
used, only report variables.

## Concepts

- A template is an Excel file with tags that will be replaced by
  report variables or fields from a dataset. Tags are always on the
  form **\<\#tag\>** If a tag has parameters, it always has the form
  **\<\#tag(param1; param2\...)\>**. You can read the [FlexCel Reports Tag Reference.](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-tag-reference.html)
  for more information.

- To set the value for report variable, use
  [TFlexCelReport.SetValue](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Report/TFlexCelReport/SetValue.html). You can set any kind of object from
  here, not just text. If you set it to a [TFormula](https://download.tmssoftware.com/flexcel/doc/vcl/api/FlexCel.Core/TFormula/index.html) object, you
  will enter a formula.

- \<\#Tags\> will be replaced inside **Cells**, **Comments**, **Sheet
  names**, **Images**, **Hyperlinks**, **AutoShapes**, **Headers**
  and **Footers.** All of this is shown here. To see the
  headers and footers, you must do a print preview.

- There are 2 special datatypes you must be aware:

   1. **Dates:** Dates in Excel are just numbers, with an special cell
   format. To enter a date in Excel, make sure the cell has a date
   format.

   2. **Multiline Text**:To be able to show carriage return on a cell,
   it must have \"Wrap text\" enabled on its cell format.

- Hyperlinks are an special case for 2 reasons: 
   1. **You can\'t enter
   \<\#** into an hyperlink, as **\#** is a reserved keyword. So, tags in
   hyperlinks are on the form \"\*.TAG.\*\" (On older FlexCelVersions
   we would use \"\<.tag\>\". This will still work, but you can\'t
   enter this text into Excel 2003 or newer) 
  
   2. If you do not begin the
   hyperlink text with \"http://\" or \"https://" while
   creating the link in Excel, it will be created as local file. As
   this is not what you would normally want, all \"local file\"
   hyperlinks will be changed to URL hyperlinks **if the replaced
   text starts with \"http:\" or \"https:\"**. So do not create links like
   \"[www.tmssoftware.com](https://www.tmssoftware.com)\", make your
   hyperlinks \"<https://www.tmssoftware.com>\"

- To create an hyperlink to a cell in the same file using tags, start
  the definition of the hyperlink with a \"**\#**\", like
  \"\*.sheetvar.\*!\*.\#cellvar.\*\"

- There are special tags, like the \<\#If( condition, iftrue,
  iffalse)\> that might contain other tags inside. You can use any
  composition of tags on any of the places where they will be
  replaced.

- **Empty comments will be removed.** This is a feature so you can
  selectively comment cells based on the comment text. If comment
  text is blank, no comment will be made.

- To **replace images**, name them as \<\#tag\>. To see or change the
  name of an image, use the combo box at the upper left corner on
  Excel.

- You can use tags as usual on sheet names. But, as the maximum sheet
  name length is 32, it is kind of limited. You can use
  [Equal](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-tag-reference.html#equal) tag \(**\<\#=(cell)\>**\) to solve this limitation.

- You can **define reusable variables** on the config sheet. For
  example, here we define an expression containing the name and
  \"anonymous\" if the name is null, and we use it on the sheet name
  and the print header. Then we can use this expression on many
  places. \<\#=(cell)\> is conceptually the same as report
  expressions, but report expressions are normally cleaner on what
  they mean.

- Rich text will be preserved on cells. If for example you write
  \"\<\#name\> and \<\#date\>\", the result will be \"your name and
  thedate\"
