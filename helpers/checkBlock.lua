print("Please specify a direction to inspect")
print("The options are: forward, up, down")
local direction = io.read()

function checkBlock(dir)
    if (dir == nil) then
        print("ERROR: no direction specified")
    end

    local dirCheck = dir ~= "forward" and dir ~= "up" and dir ~= "down"
    -- Checking if a valid direction was given
    if (dirCheck) then
        print("No direction specified, checking forward of turtle")
        dir = "forward"
    end
        
    

    print("Checking block in direction ", dir)

    if (dir == "forward") then
        local success, blockData = turtle.inspect()
        if (success) then
            print("Block name is ", blockData.name)
            print("Block age is ", blockData.state.age)
            print("Block metadata is ", blockData.metadata)
        else
            print("Error, no block in front of turtle")
        end
    end

    if (dir == "up") then
        local success, blockData = turtle.inspectUp()
        if (success) then
            print("Block name is ", blockData.name)
            print("Block age is ", blockData.state.age)
            print("Block metadata is ", blockData.metadata)
        else
            print("Error, no block in front of turtle")
        end
    end

    if (dir == "down") then
        local success, blockData = turtle.inspectDown()
        if (success) then
            print("Block name is ", blockData.name)
            print("Block age is ", blockData.state.age)
            print("Block metadata is ", blockData.metadata)
        else
            print("Error, no block in front of turtle")
        end
    end
end

checkBlock(direction)