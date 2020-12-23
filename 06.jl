io = open("in/06.in", "r")
input = split(read(io, String), "\n\n")
input_part_1 = filter.(x -> x != "\n", split.(input, ""))

input_part_2 = split.(input, "\n")

function part_1(input)
    sum(length.(Set.(input)))
end

function part_2(input)
    sets = [Set(split(i, "")) for i in input]
    return length(intersect(sets...))
end

println(part_1(input_part_1), " ", sum(part_2.(input_part_2)))