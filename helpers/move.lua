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
    for i = x, 1, -1
