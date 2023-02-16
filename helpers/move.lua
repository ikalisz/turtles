-- This file is for handling simple movement commands for the turtle

local Move = {}
local Fuel = require('fuel')

function Move.forward(number)
    for i = number, 1, -1 do
        local didMove = turtle.forward()
        if (didMove ~= true) then
            Fuel.checkFuel()
            Move.forward(1)
        end
    end
end

function Move.backward(number)
    for i = number, 1, -1 do
        local didMove = turtle.backward()
        if (didMove ~= true) then
            Fuel.checkFuel()
            Move.backward(1)
        end
    end
end

function Move.reset(x, y)
    -- This function assums that the turtle is facing south (towards the bottom of the y axis)
    for i = y, 2, -1 do
        Move.forward(1)
    end
    turtle.turnRight()
    for j = x, 2, -1 do
        Move.forward(1)
    end
    turtle.turnRight()
end

return Move
