using HorizonSideRobots
r=Robot(11,12;animate=true)


function points_opposite(r) 
    stage=[]

    while isborder(r,Sud)==false || isborder(r,West) == false 
        push!(stage, moves!(r, West))
        push!(stage, moves!(r, Sud))
    end

    for (i,n) in enumerate(stage)
        side = isodd(i) ? Nord : Ost 
        movements!(r,side,n)
    end
end

    for side in (Nord,Ost,Sud,West)
        moves!(r,side)
        putmarker!(r)
    end

function moves!(r::Robot, side::HorizonSide)

    while isborder(r, side) == false 
        move!(r,side)
    end

    function movements!(r::Robot,side::HorizonSide,stage::Int) 
        for i in 1:stage
            move!(r,side)
        end
    end
end
points_opposite(r)