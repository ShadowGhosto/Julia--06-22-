using HorizonSideRobots
r=Robot("5.sit"; animate=true)


function horizon(r::Robot)
i = 3
while !(isborder(r,HorizonSide(2))==true && i == 2)
    if isborder(r,HorizonSide(i))==false
        putmarker!(r)
        move!(r,HorizonSide(i))
    elseif (i == 3)
        i = 0
    elseif (i == 0)
        i = 1
    elseif (i == 1)
        i = 2
    end
end
end

function frame()
count = 0
i = 0
while true
if isborder(r,HorizonSide(i))==false
    move!(r,HorizonSide(i))
    count += 1
elseif (count == 14)
    count = 0
    move!(r,HorizonSide(3))
    if i == 0
    i = 2
    else i == 2
    i = 0
    end
elseif (count != 14)
    break;
end
end
end

function internal_border()
i = 1
path = 0
while true
    if (isborder(r,HorizonSide(0)) == true)
        path = 0
        putmarker!(r)
        move!(r,HorizonSide(3))
    end
    if (isborder(r,HorizonSide(3)) == true)
        path = 3
        putmarker!(r)
        move!(r,HorizonSide(2))
    end
    if (isborder(r,HorizonSide(2)) == true)
        path = 2
        putmarker!(r)
        move!(r,HorizonSide(1))
    end
    if (isborder(r,HorizonSide(1)) == true)
        path = 1
        putmarker!(r)
        move!(r,HorizonSide(0))
    end
    if ((isborder(r,HorizonSide(0)) == false) && (isborder(r,HorizonSide(1)) == false) && (isborder(r,HorizonSide(2)) == false) && (isborder(r,HorizonSide(3)) == false))
        putmarker!(r)
        move!(r,HorizonSide(path))
    end
end
end

horizon(r)
frame()
internal_border()