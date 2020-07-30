# Intelligent page breaks in reports

Intelligent page breaks are a FlexCel feature that lets you keep
together selected rows when printing.

In this demo we will see how to use them on a report.

**Make sure to read the conceptual documentation 
about [Intelligent Page Breaks](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-designer-guide.html#intelligent-page-breaks)
to better understand what we are doing here.**

## Concepts

- How to create Multi-level \"keep together\" ranges. In most reports
  one level is normally enough, but in master detail cases or
  situations like this one, you might need more than one.

- Take a look at the \"keeprows\_x\_\" named ranges in the template.
  Those are the ranges you use to tell FlexCel which rows to keep
  together. To have an interesting data sample for our demo, we will
  write a chart of the customers only if they are from Germany or
  USA.

- In this example, we want to keep full customers in the same page.
  But if that isn\'t possible, we would like the chart not to split
  in the middle of a page break. That is why we defined a
  \"keeprows\_2\_\" inside \"keeprows\_1\_\" protecting the chart.
  You can see an example of how this works at pages 43-44 when doing
  a print preview. The chart is completely in a page 44, instead of
  half in 43 and half in the 44. If you remove the \"keeprows\_2\_\"
  range from the template you will see how that would be otherwise.

