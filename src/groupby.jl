"""
    groupby(df::DataFrame, cols::Symbol...)

Group DataFrame by specified columns.
"""
function groupby(df::DataFrame, cols::Symbol...)
    grouped_df = groupby(df, cols)
    return grouped_df
end
