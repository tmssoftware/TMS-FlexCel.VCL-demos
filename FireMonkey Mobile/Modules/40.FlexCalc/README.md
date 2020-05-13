# FlexCalc

This example shows how to use the FlexCel calculating engine as a calculator for the device.

## Concepts

- Under the hood, every textbox in the app is mapped to a cell in a spreadsheet (A1, A2, A3...),
  and whenever a textbox changes, the sheet is recalculated and the results of the new calculations
  are shown at the column on the right. You can use the full range of Excel functions in this demo,
  and reference cells in the usual way (for example, you can write "=A2 + 1" in the textbox for A3)

  As in Excel, any text that starts with "=" will be considered a formula.

  The backing spreadsheet will be saved when you exit the app and loaded when open it, and this will allow to 
  persist the formulas between sessions.
