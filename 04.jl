function parse_input(input)

    atributes = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid", "cid"]
    in = Dict()
    for (i, att) in enumerate(atributes)
        reg = Regex("$(att):([^ \n]*)")
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

function part_2(input)
    valid = []
    for (key, value) in input
        result = getfield(Main, Symbol("validate_", key))(value)
        append!(valid, result)
    end
    return all(valid)
end

function validate_byr(byr)
    if length(byr) == 4
        return 1920 <= parse(Int64, byr) <= 2002
    end
    return false
end

function validate_iyr(iyr)
    if length(iyr) == 4
        return 2010 <= parse(Int64, iyr) <= 2020
    end
    return false
end

function validate_eyr(eyr)
    if length(eyr) == 4
        return 2020 <= parse(Int64, eyr) <= 2030
    end
    return false
end

function validate_hgt(hgt)
    if occursin(r"[0-9]{2}in", hgt) | occursin(r"[0-9]{3}cm", hgt)
        if hgt[end-1:end] == "cm"
            hgt = parse(Int64, hgt[1:end-2])
            return 150 <= hgt <= 193
        elseif hgt[end-1:end] == "in"
            hgt = parse(Int64, hgt[1:end-2])
            return 59 <= hgt <= 76
        end
    end
    return false
end

function validate_hcl(hcl)
    return occursin(r"#[0-9a-f]{6}", hcl)
end

function validate_ecl(ecl)
    return ecl in ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
end

function validate_pid(pid)
    return occursin(r"^[0-9]{9}$", pid)
end

function validate_cid(cid)
    return true
end

io = open("in/04.in", "r")

input = split(read(io, String), "\n\n")

input = parse_input.(input)
required_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

println(count(part_1(x, required_fields) for x in input))
part_2_input = filter(x -> part_1(x, required_fields), input)
println(count(part_2.(part_2_input)))