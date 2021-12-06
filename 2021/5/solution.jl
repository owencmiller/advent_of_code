#===
Advent of Code: 2021
Day: 5

===#

# Read Input Data
data = []
open("./5/input.txt") do f
    while !eof(f)
        s = readline(f)
        push!(data, split(s, ' '))
    end
end

struct Line
    x1
    y1
    x2
    y2
end

lines = [Line(parse.(Int32, split(d[1], ','))[1], parse.(Int32, split(d[1], ','))[2],parse.(Int32, split(d[3], ','))[1],parse.(Int32, split(d[3], ','))[2]) for d in data]

map = fill(0, 1000,1000)

for line in lines
    x1 = line.x1
    y1 = line.y1
    x2 = line.x2
    y2 = line.y2
    if x1 == x2
        smaller = (y1 < y2 ? y1 : y2)
        for i in 0:abs(y1 - y2)
            map[x1+1, smaller+i+1] += 1
        end
    elseif y1 == y2
        smaller = (x1 < x2 ? x1 : x2)
        for i in 0:abs(x1 - x2)
            map[smaller+i+1, y1+1] += 1
        end
    else
        if x1 < x2
            if y1 < y2
                for i in 0:abs(x1-x2)
                    map[x1+i+1, y1+i+1] += 1
                end
            elseif y2 < y1
                for i in 0:abs(x1-x2)
                    map[x1+i+1, y1-i+1] += 1
                end
            end
        else
            if y2 < y1
                for i in 0:abs(x1-x2)
                    map[x2+i+1, y2+i+1] += 1
                end
            elseif y1 < y2
                for i in 0:abs(x1-x2)
                    map[x2+i+1, y2-i+1] += 1
                end
            end
        end
    end
end


m = maximum(map)
println(m)

count = 0
for val in map
    if val >= 2
        count += 1
    end
end
println(count)

# println(data)
# println(lines)
Base.print_matrix(stdout, map')