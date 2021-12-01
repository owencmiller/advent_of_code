#===
Advent of Code: 2021
Day: 1


===#

# Read Input Data
data = []
open("1/input.txt") do f
    while !eof(f)
        s = readline(f)
        push!(data, parse(Int32, s))
    end
end

# Part 1 - count increasing values
count = 0
for i in 2:length(data)
    if data[i] > data[i-1]
        count += 1
    end
end

println("Part 1: " * string(count))

# Part 2 - count increasing sliding 3-window
count = 0
for i in 3:length(data)-1
    if data[i-1] + data[i] + data[i+1] > data[i-2] + data[i-1] + data[i]
        count += 1
    end
end


println("Part 2: " * string(count))