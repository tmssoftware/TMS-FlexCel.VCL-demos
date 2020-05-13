# Rendering standalone objects

While you might normally want to render a full sheet (or a range of cells),
you can also use FlexCel to render specific objects in the workbook.

## Concepts

- This is a simple application where we periodically update a number,
  and use FlexCel to recalculate the formulas and render a chart of
  the values. While you would normally not use FlexCel this way (and
  it is probably better to use a separate chart package), it gives a
  nice tasting on FlexCel capabilities.

- How to use RenderObject to render a simple object in a sheet. In
  this demo, we are rendering the object named \"datachart\".

- As the chart and the calculations are defined in the spreadsheet,
  you can add new themes to the application or modify the existing
  ones by creating and modifying the xls files in the templates
  folders, without needing to recompile the application. You can
  even do it in real time. Have a template open in Excel, make
  changes, save, and reload the template in the application by
  selecting it again in the listbox. Changes will appear instantly
  without needing to close the main application. This technique can
  be quite useful to let users customize your application.

- In this example, we named the chart \"DataChart\", so we can
  identify it from the application. In order to name a chart object,
  ctrl-click in the chart (it should show white handles, not black),
  and then change the name in the name box at the top left in Excel.
