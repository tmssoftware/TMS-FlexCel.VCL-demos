# Charts With Dynamic Series

Examples of how to create a chart with one series per row. **Charts with one series per row are not a common thing to do.** You will normally want your series in columns, as shown in the example [Charts](https://doc.tmssoftware.com/flexcel/vcl/samples/delphi/reports/charts/index.html). Even for this demo, the charts would probably look better if we had them with one series per column. But if you need to do it, you can use this example as a base.

## Concepts

- How to use [swap series](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#swap-series) to create a chart with a series per row, as explained in [Creating charts with dynamic series](xref:ReportsDesignerGuide#creating-charts-with-dynamic-series).

- To use &lt;#swap series> in an embedded chart, you name the chart with a name containing &lt;#swap series>.The tag will be removed from the final chart name. To use &lt;#swap series> in a chart sheet, you write it on the sheet name. And again, the tag will be removed from the final sheet name.

- How to use the [TFlexCelReport.CustomizeChart](https://doc.tmssoftware.com/flexcel/vcl/api/FlexCel.Report/TFlexCelReport/CustomizeChart.html) event to further customize the chart.
