function part_1(expenses)
    comp_expenses = Set(2020 .- expenses)
    for expense in expenses
        if expense in comp_expenses
            return expense * (2020 - expense)
        end
    end
end

function part_2(expenses)
    for a in expenses, b in expenses, c in expenses
        if a + b + c == 2020
            return a * b * c
        end
    end
end
expenses = parse.(Int32, readlines("in/01.in"))
println(part_1(expenses))
println(part_2(expenses))