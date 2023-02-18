-- This file will handle starting up a modem on a turtle
local channels = {
    main = 5,
}

local modem = peripheral.wrap("left")
local Farm = require("farming")

modem.open(channels.main)

while true do
    -- event listening and handling
    print("Listening for events")
    local event, modemSide, senderChannel, replyChannel, msg, senderDistance = os.pullEvent("modem_message")
    -- msg will be an object, with object.type being the command to run

    if (msg.command == "run_farming") then
        -- Implement asking for how many times we should run through the grid
        Farm.start(msg.iterations)
    end
end