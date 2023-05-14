-- Load the anim8 library
anim8 = require 'libraries/anim8'

-- Create a table to hold all the fish instances
fishs = {}

-- Function to create a new fish instance
function newFish(x, y, speed, direction)
    local fish = {}
    fish.x = x
    fish.y = y
    fish.width = 75
    fish.height = 25
    fish.speed = speed
    fish.direction = direction
    fish.spriteSheet = love.graphics.newImage('sprites/fishSheet.png')
    fish.grid = anim8.newGrid(39, 20, fish.spriteSheet:getWidth(), fish.spriteSheet:getHeight())
    fish.animations = {}
    fish.animations.left = anim8.newAnimation(fish.grid('1-4', 2), 0.2)
    fish.animations.right = anim8.newAnimation(fish.grid('1-4', 1), 0.2)
    fish.anim = fish.animations.right
    fish.collider = world:newBSGRectangleCollider(x, y, fish.width, fish.height, 6)
    fish.collider:setFixedRotation(true)
    fish.collider:setCollisionClass('shark')
    fish.collider:setObject(shark)
    table.insert(fishs, fish)
end

-- Create new fish instances
newFish(50, 275, 22500, 1)
newFish(368, 880, 22500, -1)

-- Function to update all the fish instances
function updateFishs(dt)
    local mapW=gameMap.width * gameMap.tilewidth
    for i, fish in ipairs(fishs) do
        
        if fish.collider:getX() + fish.width > mapW then
            fish.direction=-1
        end 
        if fish.x-fish.width<0+gameMap.tilewidth*2 then
            fish.direction=1
        end
        local vx = fish.speed * fish.direction*dt
        fish.collider:setLinearVelocity(vx, 0)
        fish.x = fish.collider:getX()+30
        fish.y = fish.collider:getY()+45
        if fish.direction == 1 then
            fish.anim = fish.animations.right
        else
            fish.anim = fish.animations.left
        end
        fish.anim:update(dt)
    end
end


-- Function to draw all the fish instances
function drawFishs()
    for i, fish in ipairs(fishs) do
        fish.anim:draw(fish.spriteSheet, fish.x, fish.y, nil, 2, nil, 32, 32)
    end
end

function ResetFish()
    for i, fish in ipairs(fishs) do
      fish.collider:destroy()
    end
    fishs = {} -- clear the sharks table
  end