# Welcome to DATA.jl Documentation

Welcome to the official documentation for DATA.jl, your comprehensive toolkit for data manipulation and analysis in Julia. This guide will help you understand how to effectively use the DATA.jl package to simplify and enhance your data workflows.

## Installation

To get started with DATA.jl, you need to install the package using Julia's package manager. Run the following command in your Julia REPL to install DATA.jl:

```julia
using Pkg
Pkg.add("DATA")
```

## Features

DATA.jl offers a range of features designed to make data handling in Julia intuitive and efficient:

- **Intuitive Operations:** Functions like `filter`, `select`, `groupby`, `mutate`, and `join` are designed with clear names and consistent arguments to enhance usability.
- **Chainable Syntax:** Allows for clean and readable data transformation pipelines.
- **Missing Data Handling:** Includes built-in support for managing `NaN` and missing values effectively.
- **Performance:** Optimized for fast operations on tabular data.
- **Interoperability:** Designed to work seamlessly with other packages in the Julia data ecosystem.

## Basic Usage

Here's a quick example to show how you can use DATA.jl to perform common data manipulation tasks:

```julia
using DATA, CSV, DataFrames

# Load data from a CSV file
my_data = CSV.read("data.csv", DataFrame)

# Data transformation pipeline
result = my_data |>
         DATA.filter(:year .> 2020) |>
         DATA.select(:name, :sales) |>
         DATA.groupby(:name) |>
         DATA.summarize(total_sales = sum(:sales))
```

## Function Reference

### `filter`

Filter rows in a DataFrame based on a specified condition.

**Usage:**

```julia
filtered_data = DATA.filter(df, :column_name .> value)
```

### `select`

Select specific columns from a DataFrame.

**Usage:**

```julia
selected_data = DATA.select(df, :column1, :column2)
```

### `groupby`

Group DataFrame by specified columns.

**Usage:**

```julia
grouped_data = DATA.groupby(df, :column_name)
```

### `mutate`

Apply transformations or create new columns in a DataFrame.

**Usage:**

```julia
mutated_data = DATA.mutate(df, new_column = :existing_column .* 2)
```

### `join`

Join two DataFrames on specified columns. Supports various types of joins like `:inner`, `:outer`, `:left`, and `:right`.

**Usage:**

```julia
joined_data = DATA.join(df1, df2, on=:key_column, how=:inner)
```

## Contributing

Contributions to DATA.jl are always welcome, whether it's improving the documentation, adding new features, or reporting bugs. Please feel free to contribute to making DATA.jl even better.

## License

DATA.jl is released under the MIT license. Full license text is available in the LICENSE file in the repository.

Thank you for using DATA.jl!
