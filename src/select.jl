"""
    select(df::DataFrame, cols::Symbol...)

Select specific columns from a DataFrame.
"""
function select(df::DataFrame, cols::Symbol...)
    return select(df, Not(cols))
end
