#===
Advent of Code: 2021
Day: 9


===#

# Read Input Data
data = []
open("9/input.txt") do f
    while !eof(f)
        s = readline(f)
        push!(data, parse.(Int32, collect(s)))
    end
end

# Helper Function
function get_neighs(i,j)
    neighs = []
    if i != length(data)
        push!(neighs, (i+1, j))
    end
    if j != length(data[i])
        push!(neighs, (i, j+1))
    end
    if i != 1
        push!(neighs, (i-1, j))
    end
    if j != 1
        push!(neighs, (i, j-1))
    end
    return neighs
end


# Recursive
function get_basin_size(x,y,seen)
    neighs = get_neighs(x,y)
    sum = 0
    for n in neighs
        if !(n in seen)
            if data[n[1]][n[2]] > data[x][y] && data[n[1]][n[2]] < 9
                sum += get_basin_size(n[1], n[2], push!(seen, (n[1],n[2])))
            end
        end
    end
    return sum+1
end

# Queue
function get_basin_size2(x,y)
    queue = [(x,y)]
    seen = []
    s = 1
    dups = 0
    while !isempty(queue)
        pos = popfirst!(queue)
        neighs = get_neighs(pos[1], pos[2])
        for n in neighs
            if !(n in seen)
                if data[n[1]][n[2]] > data[pos[1]][pos[2]]  && data[n[1]][n[2]] < 9
                    s += 1
                    push!(queue, (n[1], n[2]))
                    push!(seen, (n[1], n[2]))
                end
            end
        end
    end
    return s
end


# Main Loop
low_points = []
basins = []

for i in 1:length(data)
    for j in 1:length(data[i])
        neighs = get_neighs(i,j)
        low = true
        val = data[i][j]
        for n in neighs
            if val >= data[n[1]][n[2]]
                low = false
            end
        end
        if low
            push!(low_points, data[i][j])
            push!(basins, get_basin_size(i,j,[]))
        end
    end
end




# println(low_points)
# println(sum(low_points .+ 1))
prod = 1

println(basins)
for i in 1:3
    m = findmax(basins)
    prod *= m[1]
    basins[m[2]] = 0
end

println(prod)