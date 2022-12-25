using HorizonSideRobots
r=Robot("8.sit",animate=true)

function point_search(r::Robot)
    count_stage=1
    side=Nord
    while ismarker(r)==false
        for i in 1:2
            point_search(r,side,count_stage)
            side=next(side)
        end
        count_stage+=1
    end
end

function point_search(r,side,count_stage)
    for i in 1:count_stage
        if ismarker(r)
            return nothing
        end
        move!(r,side)
    end
end

next(side::HorizonSide)=HorizonSide(mod(Int(side)+1,4))
point_search(r)