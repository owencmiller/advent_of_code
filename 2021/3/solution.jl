#===
Advent of Code: 2021
Day: 3

===#

# Read Input Data
data = []
open("3/input.txt") do f
    while !eof(f)
        s = readline(f)
        push!(data, s)
    end
end


# Part 1
gamma = ""
epsilon = ""

for i in 1:length(data[1])
    ones = 0
    zeros = 0
    for j in data
        if j[i] == '1'
            ones += 1
        else
            zeros += 1
        end
    end
    if ones > zeros 
        gamma *= "1"
        epsilon *= "0"
    else 
        gamma *= "0"
        epsilon *= "1"
    end
end

gamma_val = parse(Int, gamma, base=2)
epsilon_val = parse(Int, epsilon, base=2)
println(gamma_val * epsilon_val)


# Part 2
data2 = copy(data)
ans = 0
for i in 1:length(data[1])
    bits = [x[i] for x in data2]
    val = count(x->x=='0', bits) > count(x->x=='1', bits) ? '0' : '1'
    data2 = filter(x->x[i]==val, data2)
    if length(data2) == 1
        ans = data2[1]
        break
    end
end

data2 = copy(data)
ans2 = 0
for i in 1:length(data[1])
    bits = [x[i] for x in data2]
    val = count(x->x=='0', bits) > count(x->x=='1', bits) ? '1' : '0'
    data2 = filter(x->x[i]==val, data2)
    if length(data2) == 1
        ans2 = data2[1]
        break
    end
end

println(parse(Int, ans, base=2) * parse(Int, ans2, base=2))