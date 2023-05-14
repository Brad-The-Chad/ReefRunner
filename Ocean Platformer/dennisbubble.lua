require ("levels")
numBubbles=20
minRadius,maxRadius=5,10
minSpeed,maxSpeed=50,200
wobbleFactor = 0.1

local mapW = gameMap.width * gameMap.tilewidth
local mapH = gameMap.height * gameMap.tileheight
bubbles={}

function SpawnDennisBubbles()
    if #bubbles < numBubbles then -- Only spawn a new bubble if there aren't too many already
        local bubble = {
            x = math.random(width),
            y = mapH,
            startRadius = math.random(minRadius, maxRadius),
            speed = math.random(minSpeed, maxSpeed),
            angle = math.random() * 2 * math.pi,
            angleSpeed = math.random() * 2 - 1
        }
        table.insert(bubbles, bubble)
    end
end

function UpdateDennisBubbles(dt)
    for i, bubble in ipairs(bubbles) do
        -- Update bubble's angle
        bubble.angle = bubble.angle + bubble.angleSpeed * dt
        -- Update bubble's position
        bubble.x = bubble.x + math.cos(bubble.angle) * bubble.speed * wobbleFactor * dt
        bubble.y = bubble.y - bubble.speed * dt

        -- Update bubble's radius based on y position
        bubble.radius = bubble.startRadius * (1 - bubble.y / mapH)

        -- Remove bubble if it's off-screen
        if bubble.y < -bubble.startRadius-100 then
            table.remove(bubbles, i)
        end
    end

    -- Spawn new bubbles if there aren't enough on the screen
    if #bubbles < numBubbles then
        local bubble = {
            x = math.random(width),
            y = mapH,
            startRadius = math.random(minRadius, maxRadius),
            speed = math.random(minSpeed, maxSpeed),
            angle = math.random() * 2 * math.pi,
            angleSpeed = math.random() * 2 - 1
        }
        table.insert(bubbles, bubble)
    end
end

function DrawDennisBubbles()
    for i, bubble in ipairs(bubbles) do
        if bubble.radius ~= nil then
            love.graphics.circle("line", bubble.x, bubble.y, bubble.radius)
        end
    end
end