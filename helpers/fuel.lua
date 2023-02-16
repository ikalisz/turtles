-- This file handles fuel related tasks
-- CURRENTLY THIS FILE ONLY HANDLES THE CHEST BEING IN SLOT 1
local Fuel = {}

function Fuel.checkFuel(originalSlot)
    local fuelLevel = turtle.getFuelLevel()
    if (fuelLevel < 50) then
        -- Implement logic to determine where to place the chest
        -- Implement logic to determine where the chest is in the inventory
        turtle.select(1)
        turtle.placeUp()
        local chest = peripheral.wrap("top")
        chest.pushItems("down", 1, 64)
        turtle.refuel()
        turtle.digUp()
    end
end


return Fuel