# Validating FlexCel recalculation

By default, FlexCel recalculates the files it generates before saving.
This is not completely necessary for normal xls/x files, because Excel
will recalculate the file again when opening. But when natively printing
or exporting to PDF, you need the values from the recalculation, because
no Excel is involved in the process.

While most files will recalculate fine, if you have complex formulas and
need to verify they will recalculate ok, this is the application to use.

## Concepts

- **Button \"Validate Recalc\":**
  This will verify that flexcel can understand all the formulas on your
  sheet.

- **Button \"Compare with Excel\":**
  This will open a file you saved with Excel, force a recalculation in
  FlexCel and then compare all formula results with the original ones.
  You can use this to verify the results are actually what you expect
  them to be.
