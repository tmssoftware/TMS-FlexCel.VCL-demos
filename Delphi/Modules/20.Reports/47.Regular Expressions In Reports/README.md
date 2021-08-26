# Regular expressions

Regular expressions give you both the power to transform the text in
your reports in any way you like, and also to obfuscate and make
unmaintainable your templates if you abuse them. The \<\#regex()\> tag
lets you write your own [Regular Expressions](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#regular-expressions) in a FlexCel report.

## Concepts

- There are 2 versions of the **\<\#regex\>** tag:

- RegEx(IgnoreCase, Expression, Search): This will search for the
  expression inside \"Search\" string, and return the part of
  \"Search\" that matches the expression.

- RegEx(IgnoreCase, Expression, Search, Replace): This will Replace
  the matching string inside \"Search\" by the \"Replace\" string.

- Both \"Search\" and \"Replace\" parameters are evaluated at runtime,
  so they will evaluate to different strings as the row changes. The
  \"Expression\" parameter is evaluated only once before starting
  the report, so it will not change.

- As formerly said, use regular expressions with care. Sometimes they
  are just invaluable to get your desired output, but on other times
  they can make maintaining the templates a lot of work. Depending
  on the case, you might find better to define your own user
  function to do a complex transformation. (See the [User Defined Functions](https://doc.tmssoftware.com/flexcel/vcl/samples/delphi/reports/user-defined-functions/index.html) example)

- Regular Expressions are a complex subject, and we will not explain
  how to use them here. There is a lot of information out there available on them.
