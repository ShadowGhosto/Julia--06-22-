using HorizonSideRobots
function recursive_putmarker!(robot::Robot, side::HorizonSide)
    if isborder(robot, side)
        putmarker!(robot)
    else
        move!(robot, side)
        recursive_putmarker!(robot, side)
        move!(robot, inverse(side))
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
