function parse_input(input::String)
    regex = match(r"([0-9]+)-([0-9]+) ([a-zA-Z]): (.*)", input)

    min = parse(Int64, regex[1])
    max = parse(Int64, regex[2])
    char = convert(Char, regex[3][1])

    return min, max, char, regex[4]
end

function valid_input(t)
    min, max, char, str = t
    return (min <= sum([1 for c in str if c == char]) <= max)
end

function part_1()
    in = parse_input.(readlines("in/02.in"))
    valids = valid_input.(in)
    return count(valids)
end

function valid_part_2(t)
    pos_1, pos_2, char, str = t
    return (str[pos_1] == char) ⊻ (str[pos_2] == char)
end

function part_2()
    in = parse_input.(readlines("in/02.in"))
    valids = valid_part_2.(in)
    return count(valids) 
end

println(part_1())
println(part_2())