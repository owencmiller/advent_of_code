#===
Advent of Code: 2021
Day: 11


===#


# Read Input Data
data = []
open("11/input.txt") do f
    while !eof(f)
        s = readline(f)
        push!(data, parse.(Int64, collect(s)))
    end
end
println(data)

function valid((i,j))
    if i<1 
        return false
    elseif j<1 
        return false
    elseif i>length(data)
        return false
    elseif j>length(data[i])
        return false
    end
    return true
end

function get_neighs(x,y)
    neighs = []
    for i in x-1:x+1
        for j in y-1:y+1
            if i==x && j==y
                continue
            end
            push!(neighs, (i,j))
        end
    end
    filter!(valid, neighs)
    return neighs
end

function flash()
    flashed = []
    to_flash = []
    for x in 1:length(data)
        for y in 1:length(data[x])
            if !((x,y) in flashed) && data[x][y] > 9
                push!(to_flash, (x,y))
                while !isempty(to_flash)
                    octo = pop!(to_flash)
                    push!(flashed, octo)
                    neighs = get_neighs(octo[1], octo[2])
                    for n in neighs
                        global data[n[1]][n[2]] += 1
                        if !((n[1],n[2]) in flashed) && !((n[1],n[2]) in to_flash) && data[n[1]][n[2]] > 9
                            push!(to_flash, (n[1],n[2]))
                        end
                    end
                end
            end
        end
    end
    return flashed
end


function solve(steps)
    flashes = 0
    for i in 1:steps
        flashed = []
        global data = map(x-> x .+1, data)
        flashed = flash()
        for f in flashed
            data[f[1]][f[2]] = 0
        end
        if all(map(x->all(map(y->y==0, x)), data))
            println("Syncronized: " * string(i))
        end
        flashes += length(flashed)
    end
    return flashes
end

solve(1000)