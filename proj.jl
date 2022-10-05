
function numsteps_putmarkers!(robot, side)
    num_steps = 0
    while !isborder(robot, side)
        move!(robot, side)
        num_steps += 1
        putmarker!(robot)
    end
    return num_steps
end
function along!(robot, side, num_steps)
    for _ in 1:num_steps
        move!(robot, side)
    end
end
function inverse(side)
    HorizonSide((Int(side)+2)%4)
end

function cross!(robot)
    for side in (Nord, West, Sud, Ost)
        n = numsteps_putmarkers!(robot, side)
        along!(robot, inverse(side), n)
    end
    putmarker!(robot)
end
function square!(robot)
    for side in (Ost, Nord, West, Sud)
        while !isborder(robot, side)
            move!(r, side)
            putmarker!(r)
        end
    end
end

function diagonal!(robot)
    putmarker!(r)
    while !isborder(r, Nord)
        move!(r, Ost)
        move!(r, Nord)
        putmarker!(r)
    end
    while !isborder(r, West)
        move!(r, West)
    end
    putmarker!(r)
    while !isborder(r, Sud)
        move!(r, Ost)
        move!(r, Sud)
        putmarker!(r)
    end
end