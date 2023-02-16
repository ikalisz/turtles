-- This file holds the functions to handle farming crops, usually in a square grid
-- Change the below variables to your own numbers for your crops

local finishedCropAge = 7 -- This is the finished crop age, you can find this by doing checkBlock.lua on a finished crop
local columns = 7 -- This is the number of columns in the grid
local rows = 13 -- This is the number of rows in the grid
local checkBlock = require('checkBlockFarm')
local Farm = {}
local Move = require('move')
local curXPos = 1
local curYPos = 1
local oddRows = (rows % 2) == 1
local endXPos = columns -- Will always be the last column in the grid
local endYPost = ((rows % 2) == 1) and rows or 1 -- If rows is odd, then the end will be the last row. If even, then the end will be the first row

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

function Farm.nextCrop()
    -- Need to determine where in the grid the turtle is and turn accordingly
    -- If Y is maxed, we are at the last row, need to see if we are at the top or bottom
    if (curXPos == endXPos and curYPos == endYPos) then
        Move.reset()
        curXPos = 1
        curYPos = 1
        return
    end
    if (curYPos == rows) then
        turtle.turnRight()
        Move.forward(1)
        turtle.turnRight()
        
        return
    end
    if (curYPos == 1 and curXPos ~= 1) then
        turtle.turnLeft()
        Move.forward(1)
        turtle.turnLeft()
    end
end