-- This file has functions to transmit to turtles
local Transmit = {}
-- The modem should be setup on the back of the computer
-- Can implement logic to check where the modem is located
local modem = peripheral.wrap("back")

function Transmit.farm()
    print("How many times do you want to run through the grid")
    local iterations = io.read()
    local command = "run_farming"
    local message = {
        command = command,
        iterations = iterations
    }

    modem.transmit(5, 5, message)
end

function handleTransmit()
    print("Which command do you want to run")
    local commandTransmit = io.read()

    if (commandTransmit == "farming") then
        Transmit.farm()
    end

end

return handleTransmit()