#===
Advent of Code: 2021
Day: 

===#

# Read Input Data
data = []
open("/input.txt") do f
    while !eof(f)
        s = readline(f)
        push!(data, s)
    end
end
