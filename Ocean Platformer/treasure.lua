
treasure={}

treasure.spriteSheet=love.graphics.newImage("sprites/gold.png")
treasure.spriteX=(4-1)*32
treasure.spriteY=(3-1)*32
treasure.sprite=love.graphics.newQuad(treasure.spriteX,treasure.spriteY,32,32,treasure.spriteSheet:getDimensions())

treasure.x=900
treasure.y=1245

treasure.range=false

function DrawTreasure()
    if not player.hasTreasure then
    love.graphics.draw(treasure.spriteSheet,treasure.sprite,treasure.x,treasure.y,0,1,1)
    end
end

function TreasurePos(x,y)
    treasure.x=x
    treasure.y=y
end