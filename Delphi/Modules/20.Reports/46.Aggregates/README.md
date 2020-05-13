# Aggregates

FlexCel allows you to aggregate tables on the fly, providing you with
the sum, average, maximum or minimum of the records in a table.

> [!Note]
> You will normally **not** want to use in-memory aggregates,
> since they are slower and consume more memory than aggregates made
> directly in the database. (using an expression like \"select sum(field1)
> from table group by field2\")


## Concepts

- Different ways to use the **\<\#aggregate\>** tag to aggregate the
  values in a table.
