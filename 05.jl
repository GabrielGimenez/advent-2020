function get_row_seat(input)
    lower = 0
    upper = 127
    left = 0
    right = 7
    for instruction in input
        if instruction == 'F'
            upper = (lower + upper) ÷ 2
        elseif instruction == 'B'
            lower = (lower + upper) ÷ 2
        elseif instruction == 'L'
            right = (left + right) ÷ 2
        elseif instruction == 'R'
            left = (left + right) ÷ 2
        end
    end
    return 8 * upper + right
end

input = readlines("in/05.in")

ids = (get_row_seat.(input))

sort_ids = sort(ids)
sort_ids[findmax(diff(sort_ids))[2]] + 1
