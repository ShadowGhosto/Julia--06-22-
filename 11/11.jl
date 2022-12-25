using HorizonSideRobots
r=Robot("11.sit",animate=true)


function count_partitions(r)
    side = Ost
    count = 0
    check = 0
    count_max = 0
    while !isborder(r, side)
        move!(r, side)
        if isborder(r, Nord)
            count += 1;
            check += 1
        else 
            if count == 0 || check == 0
                count_max += 0
            else 
                count_max += count / check
                count = 0
                check = 0
            end
        end
        if isborder(r, side) && !isborder(r, Nord)
            move!(r, Nord)
            side = inverse(side)
            count = 0
            check = 0
        end
    end
    return count_max
end
inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
count_partitions(r)