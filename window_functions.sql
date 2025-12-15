/*  SQL window functions allow performing calculations across a set of rows that are related to the current row, without collapsing the result
 

<window_function>() OVER (
    [PARTITION BY column1, column2, ...]
    [ORDER BY column3, ...]
)

PARTITION BY: splits rows into groups 

ORDER BY: defines the order within each partition


*/