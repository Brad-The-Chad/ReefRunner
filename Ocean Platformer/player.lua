wf=require 'libraries/windfield'
require("world")

player={}

player.x=800
player.y=200
player.speed=100
player.lives=6

player.spriteSheet=love.graphics.newImage('sprites/PlayerSheet.png')
player.grid=anim8.newGrid(80,80,player.spriteSheet:getWidth(),player.spriteSheet:getHeight())
--player.dyingSheet=love.graphics.newImage('sprites/playerDying.png')
--player.dyingGrid=anim8.newGrid(80,80,player.dyingSheet:getWidth(),player.dyingSheet:getHeight())

player.animations={}
player.animations.left=anim8.newAnimation(player.grid('1-7',1),0.2)
player.animations.right=anim8.newAnimation(player.grid('1-7',2),0.2)
player.animations.up=anim8.newAnimation(player.grid('1-7',3),0.2)
player.animations.down=anim8.newAnimation(player.grid('1-7',4),0.2)
--player.animations.dead=anim8.newAnimation(player.dyingGrid('1-5',1),0.2)

player.anim=player.animations.left

player.hasTreasure=false
player.hasEasterEgg=false


player.collider=world:newBSGRectangleCollider(725,100,40,60,6)
player.collider:setFixedRotation(true)

--player.collider:setCollisionClass('player')
player.collider:setObject(player)

player.life=love.graphics.newImage('sprites/heart.png')

function DrawPlayer()
    player.anim:draw(player.spriteSheet,player.x,player.y,nil,1.5,nil,32,32)
end

--function to give player movement by giving the collider movement and tying player position to collider
function PlayerMovement(dt)

    local vx=0
    local vy=0

    if love.keyboard.isDown("up") then
            vy=player.speed*-1
            player.anim=player.animations.up
    end
    if love.keyboard.isDown("down") then
            vy=player.speed
            player.anim=player.animations.down
    end
    if love.keyboard.isDown("right") then
        vx=player.speed
        player.anim=player.animations.right
        
    end
    if love.keyboard.isDown("left") then
        vx=player.speed*-1
        player.anim=player.animations.left
    end
   
    player.collider:setLinearVelocity(vx,vy)
    player.x=player.collider:getX()-10
    player.y=player.collider:getY()-10

    
    player.anim:update(dt)
end 

function RemoveLife()
    player.lives=player.lives-1
    if player.lives<1 then
        gameOver=true
    end
end

function DrawLives()
    if player.lives==6 then
        love.graphics.draw(player.life,5,10,0,2,2)
        love.graphics.draw(player.life,55,10,0,2,2)
        love.graphics.draw(player.life,105,10,0,2,2)
       
    end
    if player.lives==4 then
        love.graphics.draw(player.life,5,10,0,2,2)
        love.graphics.draw(player.life,55,10,0,2,2)
       
    end
    if player.lives==2 then
        love.graphics.draw(player.life,5,10,0,2,2)
        
    end
end




