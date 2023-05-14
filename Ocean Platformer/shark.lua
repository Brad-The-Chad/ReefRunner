
anim8 = require 'libraries/anim8'
require("world")


--table of shark instances
sharks = {}

-- Function to create a new shark instance
function newShark(x, y, speed, direction)
    local shark = {}
    shark.x = x
    shark.y = y
    shark.width = 100
    shark.height = 50
    shark.speed = speed
    shark.direction = 1
    shark.spriteSheet = love.graphics.newImage('sprites/SharkSheet.png')
    shark.grid = anim8.newGrid(32, 32, shark.spriteSheet:getWidth(), shark.spriteSheet:getHeight())
    shark.animations = {}
    shark.animations.left = anim8.newAnimation(shark.grid('1-9', 1), 0.2)
    shark.animations.right = anim8.newAnimation(shark.grid('1-9', 2), 0.2)
    shark.anim = shark.animations.right
    shark.collider = world:newBSGRectangleCollider(x, y, shark.width, shark.height, 6)
    shark.collider:setFixedRotation(true)
    shark.collider:setCollisionClass('shark')
    shark.collider:setObject(shark)
    table.insert(sharks, shark)
end

-- Create new shark instances
newShark(50, 500, 20000, 1)
newShark(200, 1000, 20000, -1)

-- Function to update all the shark instances
    function updateSharks(dt)
        local mapW=gameMap.width * gameMap.tilewidth
        for i, shark in ipairs(sharks) do
            
            if shark.collider:getX() + shark.width > mapW then
                shark.direction=-1
            end 
            if shark.x-shark.width<0+gameMap.tilewidth*2 then
                shark.direction=1
            end
            local vx = shark.speed * shark.direction*dt
            shark.collider:setLinearVelocity(vx, 0)
            shark.x = shark.collider:getX()+65
            shark.y = shark.collider:getY()+65
            if shark.direction == 1 then
                shark.anim = shark.animations.right
            else
                shark.anim = shark.animations.left
            end
            shark.anim:update(dt)
        end
    end

-- Function to draw all the shark instances
function drawSharks()
    for i, shark in ipairs(sharks) do
        shark.anim:draw(shark.spriteSheet, shark.x, shark.y, nil, 4, nil, 32, 32)
    end
end

function ResetSharks()
  for i, shark in ipairs(sharks) do
    shark.collider:destroy()
  end
  sharks = {} -- clear the sharks table
end
