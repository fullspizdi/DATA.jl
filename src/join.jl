"""
    join(df1::DataFrame, df2::DataFrame, on::Symbol, how::Symbol=:inner)

Join two DataFrames on specified columns. Supports `:inner`, `:outer`, `:left`, `:right` joins.
"""
function join(df1::DataFrame, df2::DataFrame, on::Symbol, how::Symbol=:inner)
    if how == :inner
        return innerjoin(df1, df2, on=on)
    elseif how == :outer
        return outerjoin(df1, df2, on=on)
    elseif how == :left
        return leftjoin(df1, df2, on=on)
    elseif how == :right
        return rightjoin(df1, df2, on=on)
    else
        throw(ArgumentError("Unsupported join type: $how"))
    end
end
