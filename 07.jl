input = readlines("in/07.in")

function parse_input(input_line)
    input_line = input_line[1:end-1]
    input = split(input_line, " contain ")
    bags = split(input[2], ", ")
    new_bags = []
    for bag in bags
        my_match = match(r"([0-9]+) (.*)", bag)
        if !isnothing(my_match)
            bag = my_match[2]
            quantity = parse(Int, my_match[1])
            if quantity == 1
                bag *= 's'
            end
            append!(new_bags, Dict(bag => quantity))
        end
    end
    Dict(input[1] => new_bags)
end

function part_1(bag, rules, answer)
    if bag == answer
        return true
    else
        return any(part_1(b[1], rules, answer) for b in rules[bag])
    end
end

rules = merge(parse_input.(input)...)
count(part_1(key, rules, "shiny gold bags") for (key, _) in rules)

function part_2(bags, rules)
    if isempty(bags)
        return 0
    else
        return sum(bag[2] + bag[2] * part_2(rules[bag[1]], rules) for bag in bags)
    end
end

(part_2(rules["shiny gold bags"], rules))