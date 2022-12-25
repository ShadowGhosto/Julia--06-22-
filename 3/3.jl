using HorizonSideRobots
r=Robot(11,11;animate=true)


function moves!(r::Robot, side::HorizonSide)
    steps = 0
    while isborder(r, side) == false 
        move!(r,side)
        steps += 1
    end
    return steps
end

function putmarkers_frame!(r::Robot,side::HorizonSide)
    while isborder(r,side) == false 
        putmarker!(r)
        move!(r,side)
    end
    if (isborder(r,Nord) == false)
        putmarker!(r)
        move!(r,Nord)
        side = HorizonSide(mod(Int(side) + 2,4))
        putmarkers_frame!(r,side)
    end
end

function movements!(r::Robot,side::HorizonSide,steps::Int) 
    for _ in 1:steps
        move!(r,side)
    end
end

function filling_entire_frame!(r::Robot) 
    vert = moves!(r, Sud)
    hor = moves!(r, West)
    side = Ost
    putmarkers_frame!(r,side) 
    putmarker!(r) 
    moves!(r,Sud)
    moves!(r, West)
    movements!(r,Ost,hor)
    movements!(r,Nord,vert)
end
filling_entire_frame!(r)