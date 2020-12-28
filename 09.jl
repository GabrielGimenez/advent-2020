using Combinatorics
function preamble(input, n)
    for (idx, i) in enumerate(input)
        if idx > n
            possibilities = (sum(x) for x in combinations(input[idx-n:idx], 2))
            if i ∉ possibilities
                return i
            end
        end
    end
end

function part_2(input, total)
    for idx in 1:length(input)
        i = idx
        s = []
        while (i <= length(input))
            s = append!(s, input[i])
            i += 1
            if sum(s) == total
                return sum(extrema(s))
            elseif sum(s) > total
                break
            end
        end
    end
end

input = parse.(Int, readlines("in/09.in"))
preamble(input, 25)

part_2(input, preamble(input, 25))