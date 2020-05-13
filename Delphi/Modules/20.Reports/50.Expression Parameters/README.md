# Parameters inside expressions

In FlexCel it is possible to create Expressions that include
parameters.

## Concepts

- How to create report Expressions using parameters.

- How to apply an Expression Format to a formula. You can't directly
  write a formula like:
  **=a1+1\<\#format cell(blue)\>** because of course Excel will not
  recognize it as a valid formula.
    >
  But you can use the **\<\#format range\>** tag to format the formula.
  On this example, formula is on column \"D\" and the formatting tag for
  the formula is on column \"E\"
