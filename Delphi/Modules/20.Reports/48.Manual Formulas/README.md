# Manual formulas

Here we will create a small fully functional Minesweeper in Excel, and
without any macros.

Most of the time, you will just want to write the formulas directly on
the report, and let FlexCel change them when inserting rows. But
sometimes, you might want to create a formula using flexcel tags. You
can do it by using \<\#formula\> and \<\#ref\> tags, but don\'t do it
unless you really need to.

## Concepts

- How to replace \<\#tags\> inside a formula.

- When you use the \<\#[Formula](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-tag-reference.html#formula)\> tag, formulas are just strings on the
  template. So we could define inside a cell: \"\<\#formula\>=b3\",
  but then if we want to change the template, and insert a row below
  row 1, the string will still be \"\<\#formula\>=b3\". That is why
  we need to use a \<\#[Ref](https://download.tmssoftware.com/flexcel/doc/vcl/guides/reports-tag-reference.html#ref)\> tag. For example
  \<\#formula\>=\<\#ref(0;-1)\> on cell c3 will point to b3, but if
  you insert a row below row 1, it will point to b4 as it should be.

- There is never a real need to use the \<\#formula\> tag, you can
  always workaround it. On this particular case we used it so we
  could change the font, (since it is not possible to change the
  font on a conditional format), but we could have also used the
  approach we used on the [Expression Parameters](https://download.tmssoftware.com/flexcel/doc/vcl/samples/delphi/reports/expression-parameters/index.html) demo. In fact,
  it might have been better that way (by adding the \<\#format
  range\> tag in the data). But this demo is to show how to use this
  feature, it is up to you to decide if it is worth or not.

- How to use conditional formatting, locked cells and data validation
  to make a nice application.
