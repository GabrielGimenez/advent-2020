function part_1(seat_map)
    max_down, max_right = size(seat_map)
    while true
        next_map = copy(seat_map)
        for i in 1:max_down, j in 1:max_right

                up = max(1, i - 1)
                down = min(max_down, i + 1)

                left = max(1, j - 1)
                right = min(max_right, j + 1)

                occupied = count(==("#"), seat_map[up:down, left:right])
                if seat_map[i, j] == "L" && occupied == 0
                    next_map[i, j] = "#"
                elseif seat_map[i, j] == "#" && occupied > 4
                    next_map[i, j] = "L"
                end
        end
        if next_map == seat_map
            return count(==("#"), seat_map)
        else
            seat_map = next_map
        end
    end
end

function part_2(seat_map)
    max_down, max_right = size(seat_map)
    while true
        next_map = copy(seat_map)
        for i in 1:max_down, j in 1:max_right

                up = max(1, i - 1)
                down = min(max_down, i + 1)

                left = max(1, j - 1)
                right = min(max_right, j + 1)

                occupied = count(==("#"), seat_map[up:down, left:right])
                if seat_map[i, j] == "L" && occupied == 0
                    next_map[i, j] = "#"
                elseif seat_map[i, j] == "#" && occupied > 4
                    next_map[i, j] = "L"
                end
        end
        if next_map == seat_map
            return count(==("#"), seat_map)
        else
            seat_map = next_map
        end
    end
end

input = hcat(split.(readlines("in/11.in"), "")...)
part_1(input)
