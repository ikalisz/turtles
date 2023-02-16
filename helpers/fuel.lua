-- This file handles fuel related tasks
-- CURRENTLY THIS FILE ONLY HANDLES THE CHEST BEING IN SLOT 1
local Fuel = {}

function Fuel.checkFuel(originalSlot)
    local fuelLevel = turtle.getFuelLevel()
    if (fuelLevel < 50) then
        -- Implement logic to determine where to place the chest
        -- Implement logic to determine where the chest is in the inventory
        Fuel.findChest()
        turtle.placeUp()
        local chest = peripheral.wrap("top")
        chest.pushItems("down", 1, 64)
        turtle.refuel()
        turtle.digUp()
    end
end

function Fuel.findChest()
    -- This function will sort through the inventory and return the slot the seeds are in
    -- LONG TERM: if out of seeds will request more seeds
    local selectedData = turtle.getItemDetail()
    if (string.find(data.name, "ender_storage")) then
        return
    end
    for i = 16, 1, -1 do
        local data = turtle.getItemDetail(i)
        if (string.find(data.name, "ender_storage")) then
            select (i)
            break
        end
    end
end


return Fuel