#===
Advent of Code: 2021
Day: 4

===#

# Read Input Data
data = []
open("4/input.txt") do f
    while !eof(f)
        s = readline(f)
        push!(data, s)
    end
end

calls = parse.(Int32, split(data[1], ','))

boards = []
getting_boards = true
i = 2
for i in 2:6:length(data)
    board = parse.(Int32, filter(x->!isempty(x), rstrip.(lstrip.(split(data[i+1], ' '), ' '))))
    for j in 2:5
        board = hcat(board, parse.(Int32, filter(x->!isempty(x), rstrip.(lstrip.(split(data[i+j], ' '), ' ')))))
    end
    push!(boards, board)
end


function check_finished(board)
    for i in 1:5
        if all(map(x->x==-1, board[:,i]))
            return true
        end
        if all(map(x->x==-1, board[i,:]))
            return true
        end
    end
    return false
end

done = false
for c in calls
    for board in boards
        for i in 1:25
            if board[i] == c
                board[i] = -1
            end
        end
    end
    if length(boards) == 1
        println(boards)
        println(c)
        break
    end
    removeable = []
    for i in 1:length(boards)
        if check_finished(boards[i])
            push!(removeable, i)
        end
    end
    for i in reverse(removeable)
        deleteat!(boards, i)
    end
    if done
        break
    end
end

println(sum(map(x->(x == -1 ? 0 : x), boards[1])))