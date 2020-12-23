input = readlines("in/07.in")

function parse_bags(bag_list)
    for bag in bag_list

    end
end

function parse_input(input_line)
    input_line = input_line[1:end-1]
    input = split(input_line, " contain ")
    bags = split(input[2], ", ")
    bags = split.(bags, r"[0-9]+")

    Dict(input[1] => bags)
end
input_line = input[1]
input_line = input_line[1:end-1]
input_line = split(input_line, " contain ")
bags = split(input_line[2], ", ")

new_bags = []
for bag in bags
    println(bag)
    my_match = match(r"([0-9]+) (.*)", bag)
    if bag != ""
        append!(new_bags, Dict(my_match[2] => my_match[1]))
    else
        append!(new_bags, nothing)
    end
end


rules = parse_input.(input)