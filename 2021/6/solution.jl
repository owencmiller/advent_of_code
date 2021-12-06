#===
Advent of Code: 2021
Day: 6

===#

# Read Input Data
data = []
open("6/input.txt") do f
    while !eof(f)
        s = readline(f)
        append!(data, parse.(Int32, split(s, ',')))
    end
end

function answer(data, iter)
    store = fill(0, 9)

    for i in data
        store[i] += 1
    end
    for day in 1:iter
        nday = fill(0, 9)
        for i in 2:9
            nday[i-1] = store[i]
        end
        nday[7] = store[8] + store[1]
        nday[9] = store[1]
        store = copy(nday)
    end

    return sum(store)
end


# Part 1
println(answer(data, 79))
# Part 2
println(answer(data, 255))


# for i in 1:256
#     for f in 1:length(data)
#         if data[f] == 0
#             data[f] = 6
#             push!(data, 8)
#         else
#             data[f] -= 1
#         end
#     end
#     println("day : " * string(i))
# end