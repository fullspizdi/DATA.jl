"""
    mutate(df::DataFrame, changes::Pair...)

Apply transformations or create new columns in a DataFrame based on the provided changes.
Each change is specified as a pair where the key is the new column name and the value is an expression
defining how to calculate it.

# Examples
```julia
using DATA, DataFrames

# Create a sample DataFrame
df = DataFrame(a = 1:4, b = [2, 4, 6, 8])

# Add a new column `c` which is `a * b`
new_df = mutate(df, c = :a .* :b)

# Modify column `a` to be twice its value
modified_df = mutate(df, a = 2 .* :a)
```
"""
function mutate(df::DataFrame, changes::Pair...)
    for (new_col, transformation) in changes
        df[!, Symbol(new_col)] = eval(Meta.parse(string(transformation)))
    end
    return df
end
