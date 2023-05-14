
wf=require 'libraries/windfield'

world=wf.newWorld(0,0)

world:addCollisionClass('jellyfish')
world:addCollisionClass('wall')
world:addCollisionClass('shark')

--function to create a table of wall instances and add colliders onto them
function LoadWalls()
walls = {}
if gameMap.layers["Walls"] then
    for i, obj in pairs(gameMap.layers["Walls"].objects) do
        -- Check if a collider already exists on the wall
        local existingCollider = world:queryRectangleArea(obj.x, obj.y, obj.width, obj.height, { 'wall' })
        if #existingCollider == 0 then
            -- If no collider exists, create a new one and add it to the walls table
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setType('static')
            wall:setCollisionClass('wall')
            table.insert(walls, wall)           
        end
    end     
end
end

function ResetWalls()
    for i = #walls, 1, -1 do
        walls[i]:destroy()
        table.remove(walls, i)
    end
LoadWalls()
end


