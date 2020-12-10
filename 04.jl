function parse_input(input)

    atributes = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
    in = Dict()
    for (i, att) in enumerate(atributes)
        reg = Regex("$(att):([^ ]*)")
        m = match(reg, input)
        if !isnothing(m)
            in[att] = m.captures[1]
        end
    end
    return in
end

function part_1(input, required_fields)
    for field in required_fields
        if !haskey(input, field)
            return false
        end
    end
    return true
end

io = open("in/04.in", "r")

input = split(read(io, String), "\n\n")

input = parse_input.(input)
required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

count(part_1(x, required_fields) for x in input)