using HorizonSideRobots
r=Robot("7.sit",animate=true)


function movements!(r::Robot, stage::Integer, side::HorizonSide; northern::Bool = true)::Nothing
    if northern
        for _ = 1:stage
            move!(r, side)
            if !isborder(r, Nord)
                break
            end
        end
    end
end

function passage_search!(r)
    stage = 1
    sides = [Ost, West]
    while isborder(r, Nord)
        for side in sides
            movements!(r, stage, side; northern=true)
            stage += 1
            if !isborder(r, Nord)
                break
            end
        end
    end
end
passage_search!(r)