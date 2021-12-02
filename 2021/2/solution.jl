#===
Advent of Code: 2021
Day: 2


===#

# Read Input Data
data = []
open("2/input.txt") do f
    while !eof(f)
        s = readline(f)
        push!(data, split(s, ' '))
    end
end

# Part 1
position = 0
depth = 0

for i in data
    if i[1] == "forward"
        position += parse(Int32, i[2])
    elseif i[1] == "down"
        depth += parse(Int32, i[2])
    elseif i[1] == "up"
        depth -= parse(Int32, i[2])
    end
end

print(string(position*depth))

# Part 2
position = 0
depth = 0
aim = 0

for i in data
    if i[1] == "forward"
        position += parse(Int32, i[2])
        depth += aim * parse(Int32, i[2])
    elseif i[1] == "down"
        aim += parse(Int32, i[2])
    elseif i[1] == "up"
        aim -= parse(Int32, i[2])
    end
end

print(string(position*depth))

