-- Load the anim8 library
anim8 = require 'libraries/anim8'

-- Create a table to hold all the uglyFish instances
uglyFishs = {}

-- Function to create a new uglyFish instance
function newUglyFish(x, y, speed, direction)
    local uglyFish = {}
    uglyFish.x = x
    uglyFish.y = y
    uglyFish.width =  50
    uglyFish.height = 40
    uglyFish.speed = speed
    uglyFish.direction = direction
    uglyFish.spriteSheet = love.graphics.newImage('sprites/uglyfishSheet.png')
    uglyFish.grid = anim8.newGrid(32, 32, uglyFish.spriteSheet:getWidth(), uglyFish.spriteSheet:getHeight())
    uglyFish.animations = {}
    uglyFish.animations.left = anim8.newAnimation(uglyFish.grid('1-4', 2), 0.2)
    uglyFish.animations.right = anim8.newAnimation(uglyFish.grid('1-4', 1), 0.2)
    uglyFish.anim = uglyFish.animations.right
    uglyFish.collider = world:newBSGRectangleCollider(x, y, uglyFish.width, uglyFish.height, 6)
    uglyFish.collider:setFixedRotation(true)
    uglyFish.collider:setCollisionClass('shark')
    uglyFish.collider:setObject(shark)
    table.insert(uglyFishs, uglyFish)
end

-- Create new uglyFish instances
newUglyFish(100, 600, 15000, 1)
newUglyFish(568, 1100, 15000, -1)

-- Function to update all the uglyFish instances
function updateUglyFishs(dt)
    local mapW=gameMap.width * gameMap.tilewidth
    for i, uglyFish in ipairs(uglyFishs) do
        
        if uglyFish.collider:getX() + uglyFish.width > mapW then
            uglyFish.direction=-1
        end 
        if uglyFish.x-uglyFish.width<0+gameMap.tilewidth*2 then
            uglyFish.direction=1
        end
        local vx = uglyFish.speed * uglyFish.direction*dt
        uglyFish.collider:setLinearVelocity(vx, 0)
        uglyFish.x = uglyFish.collider:getX()+30
        uglyFish.y = uglyFish.collider:getY()+30
        if uglyFish.direction == 1 then
            uglyFish.anim = uglyFish.animations.right
        else
            uglyFish.anim = uglyFish.animations.left
        end
        uglyFish.anim:update(dt)
    end
end

-- Function to draw all the uglyFish instances
function drawUglyFishs()
    for i, uglyFish in ipairs(uglyFishs) do
        uglyFish.anim:draw(uglyFish.spriteSheet, uglyFish.x, uglyFish.y, nil, 2, nil, 32, 32)
    end
end

function ResetUglyfish()
    for i, uglyFish in ipairs(uglyFishs) do
      uglyFish.collider:destroy()
    end
    uglyFishs = {} -- clear the sharks table
  end