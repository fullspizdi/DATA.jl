module DATA

# Import necessary packages
using CSV
using DataFrames

# Include the individual function modules
include("filter.jl")
include("select.jl")
include("groupby.jl")
include("mutate.jl")
include("join.jl")

export filter, select, groupby, mutate, join

"""
    filter(df::DataFrame, condition)

Filter rows in DataFrame based on the specified condition.
"""
filter

"""
    select(df::DataFrame, cols::Symbol...)

Select specific columns from a DataFrame.
"""
select

"""
    groupby(df::DataFrame, cols::Symbol...)

Group DataFrame by specified columns.
"""
groupby

"""
    mutate(df::DataFrame, changes::Pair...)

Apply transformations or create new columns in DataFrame.
"""
mutate

"""
    join(df1::DataFrame, df2::DataFrame, on::Symbol, how::Symbol=:inner)

Join two DataFrames on specified columns. Supports `:inner`, `:outer`, `:left`, `:right` joins.
"""
join

end # module
