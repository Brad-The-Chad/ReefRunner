camera=require 'libraries/camera'
require("player")


cam=camera()

--centers camer on player but does not allow camera to go past boundries of the tilemap
function LookAtPlayer ()
    cam:lookAt(player.x,player.y)
    
    local w=love.graphics.getWidth()
        local h=love.graphics.getHeight()

        if cam.x<w/2 then
        cam.x=w/2
        end
        if cam.y<h/2 then
        cam.y=h/2
        end
    
        local mapW=gameMap.width * gameMap.tilewidth
        local mapH=gameMap.height * gameMap.tileheight

        if cam.x > (mapW-w/2) then
            cam.x = (mapW-w/2)
        end
        if cam.y>(mapH-h/2) then
            cam.y=(mapH-h/2)
        end
end

