using HorizonSideRobots
r=Robot("4.sit", animate=true)


function creating_ladder(r::Robot)
    while isborder(r,HorizonSide(1))==false
        putmarker!(r)
        move!(r,HorizonSide(1))
        move!(r,HorizonSide(0))
        putmarker!(r)
    end
    while isborder(r,HorizonSide(2))==false
        move!(r,HorizonSide(2))
    end
    putmarker!(r)
    while isborder(r,HorizonSide(3))==false
        putmarker!(r)
        move!(r,HorizonSide(3))
        move!(r,HorizonSide(0))
    end
    putmarker!(r)
end
creating_ladder(r)