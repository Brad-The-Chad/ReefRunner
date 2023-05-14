-- Load the anim8 library
anim8 = require 'libraries/anim8'

-- Create a table to hold all the jellyfish instances
jellyfishs = {}

-- Function to create a new jellyfish instance
function newJellyfish(x, y, speed, direction)
    jellyfish = {}
    jellyfish.x = x
    jellyfish.y = y
    jellyfish.width = 25
    jellyfish.height = 30
    jellyfish.speed = speed
    jellyfish.direction = direction
    jellyfish.spriteSheet = love.graphics.newImage('sprites/jellyfish.png')
    jellyfish.grid = anim8.newGrid(32, 32, jellyfish.spriteSheet:getWidth(), jellyfish.spriteSheet:getHeight())
    jellyfish.animations = {}
    jellyfish.animations.up = anim8.newAnimation(jellyfish.grid('1-5', 2), 0.2)
    jellyfish.animations.down = anim8.newAnimation(jellyfish.grid('1-5', 3), 0.2)
    jellyfish.anim = jellyfish.animations.down
    jellyfish.collider = world:newBSGRectangleCollider(x, y, jellyfish.width, jellyfish.height, 6)
    jellyfish.collider:setFixedRotation(true)
    jellyfish.collider:setCollisionClass('jellyfish')
    jellyfish.collider:setObject(jellyfish)
    table.insert(jellyfishs, jellyfish)
end

-- Create new jellyfish instances
newJellyfish(450, 140, 12500, 1)
newJellyfish(300, 1200, 12500, -1)

-- Function to update all the jellyfish instances
local elapsedTime = 0

function updateJellyfishs(dt)
    -- Increment the elapsed time
    elapsedTime = elapsedTime + dt
    
    local mapW = gameMap.width * gameMap.tilewidth
    local mapH = gameMap.height * gameMap.tileheight
    
    for i, jellyfish in ipairs(jellyfishs) do
        -- Check if it's time to switch direction
        if elapsedTime > 2 then
            SwitchDirection(jellyfish)
        end
        
        local vy = jellyfish.speed * jellyfish.direction*dt
        jellyfish.collider:setLinearVelocity(0,vy)
        jellyfish.x = jellyfish.collider:getX() + 32
        jellyfish.y = jellyfish.collider:getY() + 32
        jellyfish.anim:update(dt)
    end
end

-- Function to draw all the jellyfish instances
function drawJellyfishs()
    for i, jellyfish in ipairs(jellyfishs) do
        jellyfish.anim:draw(jellyfish.spriteSheet, jellyfish.x, jellyfish.y, nil, 2, nil, 32, 32)
    end
end

function SwitchDirection(jellyfish)
    for i, jellyfish in ipairs(jellyfishs) do
        if jellyfish.direction == 1 then
            jellyfish.direction = -1
        elseif jellyfish.direction == -1 then
            jellyfish.direction = 1
        end
        elapsedTime = 0
    end
end

function ResetJellyfish()
    for i, jellyfish in ipairs(jellyfishs) do
      jellyfish.collider:destroy()
    end
    jellyfishs = {} -- clear the sharks table
  end