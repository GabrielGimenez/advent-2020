function part_1(input)
    acc = 0
    runned_instructions = Set()
    idx = 1
    while (idx < length(input))
        instruction = input[idx][1]
        inc = parse(Int, input[idx][2])
        if idx in runned_instructions
            return acc
        end
        push!(runned_instructions, idx)
        if instruction == "nop"
            idx += 1
        elseif instruction == "acc"
            acc += inc
            idx += 1
        elseif instruction == "jmp"
            idx += inc
        end
    end
    return acc
end

function part_2(input)
    acc = 0
    runned_instructions = Set()
    idx = 1
    while (idx <= length(input))
        instruction = input[idx][1]
        inc = parse(Int, input[idx][2])
        if idx in runned_instructions
            return -1
        end
        push!(runned_instructions, idx)
        if instruction == "nop"
            idx += 1
        elseif instruction == "acc"
            acc += inc
            idx += 1
        elseif instruction == "jmp"
            idx += inc
        end
    end
    return acc
end

function fix_jmp(idx, instructions)
    instructions = deepcopy(instructions)
    instructions[idx][1] = "nop"
    return instructions
end

function fix_nop(idx, instructions)
    instructions = deepcopy(instructions)
    instructions[idx][1] = "jmp"
    return instructions
end

function inputs_part_2(input)

    jumps = [idx for (idx, inst) in enumerate(input) if inst[1] == "jmp"]
    nops = [idx for (idx, inst) in enumerate(input) if inst[1] == "nop"]
    
    j_insts = [fix_jmp(j, input) for j in jumps]
    n_insts = [fix_nop(n, input) for n in nops]

    return append!(j_insts, n_insts)
end

input = split.(readlines("in/08.in"))
part_1(input)

input_part_2 = inputs_part_2(input)
possible_outs = part_2.(input_part_2)

max(possible_outs...)