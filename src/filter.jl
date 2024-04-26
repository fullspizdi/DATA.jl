"""
    filter(df::DataFrame, condition)

Filter rows in DataFrame based on the specified condition.
"""
function filter(df::DataFrame, condition)
    return filter(condition, df)
end
