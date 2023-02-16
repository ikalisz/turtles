-- This file holds the functions to handle farming crops, usually in a square grid
-- Change the below variables to your own numbers for your crops

local finishedCropAge = 7 -- This is the finished crop age, you can find this by doing checkBlock.lua on a finished crop
local columns = 11 -- This is the number of columns in the grid
local rows = 13 -- This is the number of rows in the grid
local checkBlock = require('checkBlockFarm')
local Farm = {}
local Move = require('move')
local curXPos = 1
local curYPos = 1
local oddRows = (rows % 2) == 1
local endXPos = columns -- Will always be the last column in the grid
local endYPos = oddRows and rows or 1 -- If rows is odd, then the end will be the last row. If even, then the end will be the first row
local crops = rows * columns -- Total number of crops in grid aka total number of moves to make

-- TO DO: add a check to see if seeds/crop are full and to deposit if so
-- Add state to remember where the turtle was located before deposit

function Farm.checkCrop()
    local success, blockData = checkBlock("down")
    if (success) then
        local age = blockData.state.age
        if age == 7 then
            Farm.farmCrop()
        end
    end
end

function Farm.checkItem(item, name)
    if (string.find(item.name, name)) then
        return true
    else
        return false
    end
end

function Farm.findSeeds()
    -- This function will sort through the inventory and return the slot the seeds are in
    -- LONG TERM: if out of seeds will request more seeds
    local selectedData = turtle.getItemDetail()
    if (Farm.checkItem(selectedData, "seeds")) return
    for i = 16, 1, -1 do
        local data = turtle.getItemDetail(i)
        if (Farm.checkItem(data, "seeds")) then
            select (i)
            break
        end
    end
end

function Farm.depositLoot()
    local depositChest = peripheral.wrap("back")
    for i = 16, 1, -1 do
        local data = turtle.getItemDetail(i)
        if (Farm.checkItem(data, "seeds") == false and Farm.checkItem(data, "ender_storage") == false) then
            depositChest.pullItems("forward", i, 64)
        end
    end
end
            
function Farm.nextCrop()
    -- Need to determine where in the grid the turtle is and turn accordingly
    -- If Y is maxed, we are at the last row, need to see if we are at the top or bottom
    print("Current X Position: ", tostring(curXPos))
    print("Current Y Position: ", tostring(curYPos))
    print("End X Position: ", tostring(endXPos))
    print("End Y Position: ", tostring(endYPos))
    if (curXPos == endXPos and curYPos == endYPos) then
        if ((curXPos % 2) ~= 0) then
            turtle.turnRight()
            turtle.turnRight()
        end
        print("RESETING")
        Move.reset(curXPos, curYPos)
        curXPos = 1
        curYPos = 1
        Farm.depositLoot()
        return
    elseif (curYPos == rows and (curXPos % 2) ~= 0) then
        turtle.turnRight()
        Move.forward(1)
        turtle.turnRight()
        curXPos = curXPos + 1
        return
    elseif (curYPos == 1 and curXPos ~= 1 and (curXPos % 2) == 0) then
        turtle.turnLeft()
        Move.forward(1)
        turtle.turnLeft()
        curXPos = curXPos + 1
        return
    else 
        Move.forward(1)
        if ((curXPos % 2) == 0) then
            curYPos = curYPos - 1
        else 
            curYPos = curYPos + 1
        end
    end
end

function Farm.farmCrop()
    local didDig = turtle.digDown()
    if (didDig) then
        turtle.suckDown()
        Farm.findSeeds()
        turtle.placeDown()
        turtle.select(1)
    end
end

function Farm.handleRow()
    for i = crops, 1, -1 do
        Farm.checkCrop()
        Farm.nextCrop()
    end
end

Farm.handleRow()