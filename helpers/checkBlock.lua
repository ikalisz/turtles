local direction = io.read()

function checkBlock(dir)
    if (dir == nil) then
        print("ERROR: no direction specified")
    end
    local success, blockData = turtle.inspect()
    if (success) then
        print("Block name is ", blockData.name)
        print("Block age is ", blockData.state.age)
        print("Block metadata is ", blockData.metadata)
    else
        print("Error, no block in front of turtle")
    end
end

checkBlock(direction)