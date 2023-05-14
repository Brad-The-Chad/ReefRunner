
easterEgg={}

easterEgg.spriteSheet=love.graphics.newImage("sprites/gold.png")
easterEgg.spriteX=(3-1)*32
easterEgg.spriteY=(3-1)*32
easterEgg.sprite=love.graphics.newQuad(easterEgg.spriteX,easterEgg.spriteY,32,32,easterEgg.spriteSheet:getDimensions())

easterEgg.x=20
easterEgg.y=1408

easterEgg.range=false

function DrawEasterEgg()
    if not player.hasEasterEgg then
    love.graphics.draw(easterEgg.spriteSheet,easterEgg.sprite,easterEgg.x,easterEgg.y,0,1,1)
    end
end

function easterEggPos(x,y)
    easterEgg.x=x
    easterEgg.y=y
end