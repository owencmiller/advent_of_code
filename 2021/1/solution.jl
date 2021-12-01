#===
Advent of Code: 2021
Day: 1


===#

data = []
open("1/test_input.txt") do f
    while !eof(f)
        s = readline(f)
        push!(data, parse(Int32, s))
    end
end
println(s)
