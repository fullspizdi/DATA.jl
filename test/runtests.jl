using Test
using DATA
using DataFrames

# Sample data for testing
df = DataFrame(
    year = [2019, 2021, 2022, 2023],
    name = ["Alice", "Bob", "Charlie", "David"],
    sales = [150, 200, 250, 300]
)

# Test filter function
@testset "Filter Function Tests" begin
    filtered_df = DATA.filter(df, :year .> 2020)
    @test size(filtered_df, 1) == 3
    @test all(filtered_df.year .> 2020)
end

# Test select function
@testset "Select Function Tests" begin
    selected_df = DATA.select(df, :name, :sales)
    @test size(selected_df, 2) == 2
    @test names(selected_df) == [:name, :sales]
end

# Test groupby function
@testset "Groupby Function Tests" begin
    grouped_df = DATA.groupby(df, :name)
    @test typeof(grouped_df) == GroupedDataFrame
    @test length(grouped_df) == 4
end

# Test mutate function
@testset "Mutate Function Tests" begin
    mutated_df = DATA.mutate(df, total_sales = :sales .* 1.1)
    @test mutated_df.total_sales[1] ≈ 165
    @test names(mutated_df) == [:year, :name, :sales, :total_sales]
end

# Test join function
@testset "Join Function Tests" begin
    df2 = DataFrame(name = ["Alice", "Charlie"], bonus = [10, 20])
    joined_df = DATA.join(df, df2, :name)
    @test size(joined_df, 1) == 2
    @test joined_df.bonus == [10, 20]
end

println("All tests passed successfully!")
