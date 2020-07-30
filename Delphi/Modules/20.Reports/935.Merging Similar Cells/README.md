# Merging similar cells

This demo is about how to perform a common task: Merging similar cells
into one.

## Concepts

- There are 2 ways to merge similar cells in a sheet:

   1. Use a master-detail relationship. This is normally the way to go,
   just merge the master cells and have the details not merged. You
   can use as many master-detail levels as you want, and you can see
   this in the technique used in the first column of this demo.

   2. Use \<\#[Merge Range](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#merge-range)\> tags together with \<\#[DbValue](https://doc.tmssoftware.com/flexcel/vcl/guides/reports-tag-reference.html#dbvalue)\> tags. This
   can be useful when you want to do the merging in every column and
   you don't want to define a master and a detail table for each one
   of them. You need to be careful when using this method to check
   all the columns at the left (as shown in the \"Ship country\"
   column comment), not just the value at the last record.
