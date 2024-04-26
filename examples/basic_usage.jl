# Example usage of DATA.jl for basic data manipulation tasks

using DATA
using CSV
using DataFrames

# Load data from a CSV file
df = CSV.read("data.csv", DataFrame)

# Example of filtering data
# Filter rows where the year is greater than 2020
filtered_data = DATA.filter(df, :year .> 2020)

# Example of selecting specific columns
# Select only the 'name' and 'sales' columns
selected_data = DATA.select(filtered_data, :name, :sales)

# Example of grouping data
# Group data by 'name'
grouped_data = DATA.groupby(selected_data, :name)

# Example of summarizing data
# Calculate total sales per group
summarized_data = combine(grouped_data, :sales => sum => :total_sales)

# Example of mutating data
# Add a new column 'avg_sales' which is total_sales divided by the number of entries in each group
mutated_data = DATA.mutate(summarized_data, avg_sales = :total_sales ./ nrow(grouped_data))

# Display the final DataFrame
println("Transformed Data:")
println(mutated_data)

# Save the transformed data to a new CSV file
CSV.write("transformed_data.csv", mutated_data)
