#===
Advent of Code: 2021
Day: 10


===#


# Read Input Data
data = []
open("10/test_input.txt") do f
    while !eof(f)
        s = readline(f)
        push!(data, collect(s))
    end
end

function isopen(c)
    if c in ['(', '{', '[', '<']
        return true
    end
    return false
end

function ismatch(close, open)
    if close == '}'
        if open != '{'
            return false
        end
    elseif close == ']'
        if open != '['
            return false
        end
    elseif close == ')'
        if open != '('
            return false
        end
    elseif close == '>'
        if open != '<'
            return false
        end
    end
    return true
end


function solve(line)
    stack = []
    for c in line
        if isopen(c)
            push!(stack, c)
        else
            if ismatch(c, stack[end])
                pop!(stack)
            else
                return 1, c
            end
        end
    end
    return 0, ' '
end

function points(c)
    if c == ')'
        return 3
    elseif c == ']'
        return 57
    elseif c == '}'
        return 1197
    else
        return 25137
    end
end

currs = []
for d in data
    s = solve(d)
    if s[1] == 1
        push!(currs, solve(d)[2])
    end
end

println()
println(sum(map(points, currs)))



function points2(c)
    if c == '('
        return 1
    elseif c == '['
        return 2
    elseif c == '{'
        return 3
    else
        return 4
    end
end


function solve2(line)
    stack = []
    for c in line
        if isopen(c)
            push!(stack, c)
        else
            if ismatch(c, stack[end])
                pop!(stack)
            else
                return [], c
            end
        end
    end
    return copy(stack), ' '
end


function score(l)
    s = 0
    for c in l
        s *= 5
        s += points2(c)
    end
    return s
end


scores = []
for d in data
    s = solve2(d)
    if !isempty(s[1])
        println(s[1])
        push!(scores, score(reverse(s[1])))
    end
end

println(scores)

println(sort(scores)[trunc(Int, ceil(end/2))])