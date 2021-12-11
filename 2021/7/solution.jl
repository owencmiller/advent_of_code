#===
Advent of Code: 2021
Day: 7

===#
using Statistics

# Read Input Data
data = []
open("7/input.txt") do f
    while !eof(f)
        s = readline(f)
        append!(data, parse.(Int32, split(s, ',')))
    end
end


function fuel_loss(input, pos)
    return sum(map(x->abs(x-pos), input))
end

function fuel_loss2(input, pos)
    return sum(map(x->sum(1:abs(x-pos)), input))
end

#Part 1 
println(fuel_loss(data, median(data)))
#Part 2
println(fuel_loss2(data, floor(mean(data))))