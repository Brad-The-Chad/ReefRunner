require("player")
require("treasure")
require ("shark")
require("easteregg")
wf=require 'libraries/windfield'


--measures distance between two entities
function distance(x1,y1,x2,y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

local function emptyCallback() end

function CheckTreasureInteraction()
    if distance(player.x, player.y, treasure.x, treasure.y)<30 then
        treasure.range=true
    else 
        treasure.range=false
    end
    if treasure.range then
        if love.keyboard.isDown('e')then
            player.hasTreasure=true
            love.audio.play(pickUp)
        end
    end
end

function CheckEasterEggInteraction()
    if distance(player.x, player.y, easterEgg.x, easterEgg.y)<30 then
        easterEgg.range=true
    else 
        easterEgg.range=false
    end
    if easterEgg.range then
        if love.keyboard.isDown('e')then
            player.hasEasterEgg=true
            love.audio.play(pickUp)
        end
    end
end

function CheckBoatInteraction()
    if distance(player.x, player.y, boat.x, boat.y)<100 then
        boat.range=true
    else 
        boat.range=false
    end
    if boat.range and player.hasTreasure then
        if love.keyboard.isDown('e')then
            player.hasTreasure=false
            love.audio.play(win)
            treasure.x=boat.x
            treasure.y=boat.y
            gameWin=true
        end
    end
    if boat.range and player.hasEasterEgg then
        if love.keyboard.isDown('e')then
        player.hasEasterEgg=false
        easterEgg.x=65
        easterEgg.y=boat.y
        end
    end
end

function CheckSharkCollision()
    for i, shark in ipairs(sharks) do
        if player.collider:enter('shark') then
            local collision_data=player.collider:getEnterCollisionData('shark')
            local shark= collision_data.collider:getObject()
            RemoveLife()
            player.collider:setX(750)
            player.collider:setY(100)
            love.audio.play(hurt)
            player.hasTreasure=false
            player.hasEasterEgg=false
            if player.lives<1 then
                love.audio.play(dead)
            end
            
            
        end
    end
end
function CheckJellyfishCollision()
    for i, jellyfish in ipairs(jellyfishs) do
        if player.collider:enter('jellyfish') then
            local collision_data=player.collider:getEnterCollisionData('jellyfish')
            local jellyfish= collision_data.collider:getObject()
            RemoveLife()
            player.collider:setX(750)
            player.collider:setY(100)
            love.audio.play(hurt)
            player.hasTreasure=false
            player.hasEasterEgg=false
            if player.lives<1 then
                love.audio.play(dead)
            end
            
            
        end
    end
end       
      
function DrawE() 
    if treasure.range then
        love.graphics.setFont(love.graphics.newFont(24))
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("E", player.x , player.y - 40, 20, "center")
    elseif player.hasTreasure and boat.range then
        love.graphics.setFont(love.graphics.newFont(24))
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("E", player.x , player.y - 40, 20, "center")
    elseif player.hasEasterEgg and boat.range then
        love.graphics.setFont(love.graphics.newFont(24))
        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("E", player.x , player.y - 40, 20, "center")
    end
end 


