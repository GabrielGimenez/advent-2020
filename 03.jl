map = readlines("in/03.in")

function part_1(map, right, down)
    h_pos = 1
    v_pos = 1
    count = 0
    while v_pos <= length(map)
        if map[v_pos][h_pos] == '#'
            count += 1
        end
        v_pos += down
        h_pos += right
        if h_pos > length(map[1])
            h_pos -= length(map[1])
        end
    end
    return count
end

println(part_1(map, 3, 1))

println(part_1(map, 1, 1) * part_1(map, 3, 1) * part_1(map, 5, 1) * part_1(map, 7, 1) * part_1(map, 1, 2))