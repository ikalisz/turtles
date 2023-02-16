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
            return success, blockData
        else
            print("Error, no block in front of turtle")
            return success
        end
    end

    if (dir == "up") then
        local success, blockData = turtle.inspectUp()
        if (success) then
            return success, blockData
        else
            print("Error, no block in front of turtle")
            return success
        end
    end

    if (dir == "down") then
        local success, blockData = turtle.inspectDown()
        if (success) then
            return success, blockData
        else
            print("Error, no block in front of turtle")
            return success
        end
    end
end

return checkBlock