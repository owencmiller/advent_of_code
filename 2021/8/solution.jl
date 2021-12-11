#===
Advent of Code: 2021
Day: 8

===#
# Read Input Data
data = []
open("8/input.txt") do f
    while !eof(f)
        s = readline(f)
        append!(data, split(s, ' '))
    end
end

function is_permute(a, b)
    if length(a) != length(b)
        return false
    end
    for c in a
        if !in(c, b)
            return false
        end
    end
    return true
end

function length_to_poss_digits(l)
    if l == 2
        return [1]
    elseif l == 3
        return [7]
    elseif l == 4
        return [4]
    elseif l == 7
        return [8]
    elseif l == 6
        return [0,6,9]
    else
        return [2,3,5]
    end
end

function pos_to_num(pos)
    if pos == [3,6]
        return 1
    elseif pos == [1,3,4,5,7]
        return 2
    elseif pos == [1,3,4,6,7]
        return 3
    elseif pos == [2,3,4,6]
        return 4
    elseif pos == [1,2,4,6,7]
        return 5
    elseif pos == [1,2,4,5,6,7]
        return 6
    elseif pos == [1,3,6]
        return 7
    elseif pos == [1,2,3,4,5,6,7]
        return 8
    elseif pos == [1,2,3,4,6,7]
        return 9
    else
        return 0 
    end
end

function lights_to_pos(lets, answer)
    pos = []
    for c in lets
        push!(pos, findfirst((x->x==c), answer))
    end
    return pos_to_num(sort(pos))
end

s = 0
for i in 1:15:length(data)
    answer = fill([], 7)
    sorted = sort(data[i:i+9], by=length)
    answer[1] = [x for x in sorted[2] if !in(x, sorted[1])]
    answer[2] = [x for x in sorted[3] if !in(x, sorted[1])]
    for j in 4:6
        found = true
        for c in answer[2]
            if !in(c, sorted[j])
                found = false
                break
            end
        end
        if found 
            answer[6] = [x for x in sorted[j] if x in sorted[1]]
            answer[3] = [x for x in sorted[1] if !in(x, answer[6])]
            answer[7] = [x for x in sorted[j] if x != answer[6][1] && x != answer[1][1] && !in(x, answer[2])]
            break
        end
    end
    temp = [answer[1][1], answer[3][1], answer[6][1], answer[7][1]]
    for j in 4:6
        found = true
        for t in temp
            if !in(t, sorted[j])
                found = false
                break
            end
        end
        if found
            answer[4] = [x for x in sorted[j] if !in(x, temp)]
            answer[2] = [x for x in answer[2] if !in(x, answer[4])]
        end
    end
    temp = [answer[1][1], answer[2][1], answer[3][1], answer[4][1], answer[6][1], answer[7][1]]
    total = "abcdefg"
    answer[5] = [x for x in total if !in(x, temp)]

    answer = [x[1] for x in answer]
    sol = ""
    for j in 11:14
        sol *= string(lights_to_pos(data[i+j], answer))
    end
    s += parse(Int32, sol)
end
println(s)



# c = 0
# for i in 1:15:length(data)
#     for j in 0:9
#         for k in 11:14
#             if is_permute(data[i+j], data[i+k])
#                 if length(data[i+k]) == 2 || length(data[i+k]) == 3 || length(data[i+k]) ==4 || length(data[i+k]) == 7
#                     c += 1
#                 end
#             end
#         end
#     end
# end


println(c)