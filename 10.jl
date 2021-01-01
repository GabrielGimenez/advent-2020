joltage(input) = count(==(1), input) * count(==(3), input)

input = sort(parse.(Int, readlines("in/10.in")))
input = vcat(0, input, input[end] + 3) |> diff
joltage(input)

part_2_input = join(string.(input))

part_2(data) = prod(binomial.(length.(split(data, '3', keepempty=false)), 2) .+ 1)
part_2(part_2_input)