using HorizonSideRobots
r=Robot(11,12;animate=true)


function movements!(r, side)::Integer
    i::Integer = 0
    while !isborder(r, side)
        move!(r, side)
        i += 1
    end
    return i
end

function mark_all_field!(r::Robot, marker::Bool)
    side::HorizonSide = Ost
    while !(isborder(r, Nord) && (isborder(r, West) || isborder(r, Ost)))
        marker = mark_row!(r, side, marker)
        side, marker = switch_direction!(side, r, marker)
    end
    marker = mark_row!(r, side, marker)
end

function mark_row!(r::Robot, side::HorizonSide, marker::Bool)::Bool
    while !isborder(r, side)
        if marker
            putmarker!(r)
        end
        marker = !marker
        move!(r, side)
    end
    if marker
        putmarker!(r)
    end
    
    return marker
end

function switch_direction!(side::HorizonSide, r::Robot, marker::Bool)::Tuple{HorizonSide, Bool}
    move!(r, Nord)
    marker = !marker
    if marker
        putmarker!(r)
    end

    if side == West
        return (Ost, marker)
    else
        return (West, marker)
    end
end

function move_to_SW_corner!(r::Robot)::Tuple{Integer, Integer, Bool}
    b = movements!(r, Sud)
    a = movements!(r, West)
    marker::Bool = (a+b) % 2 == 0
    return (a, b, marker)
end

function move_back!(r::Robot, initial_coords::Tuple{Integer, Integer, Bool})::Nothing
    move_to_SW_corner!(r)
end

function chess_order!(r::Robot)
    marker::Bool = true
    putmarker!(r)
    coords::Tuple{Integer, Integer, Bool} = move_to_SW_corner!(r)
    marker = coords[3]
    mark_all_field!(r, marker)
    move_back!(r, coords)
end
chess_order!(r)