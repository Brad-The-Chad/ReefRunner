boat={}

boat.sprite = love.graphics.newImage("sprites/boat.png")
boat.spriteX = spriteX
boat.spriteY = spriteY
boat.x=700
boat.y=50

boat.range = false

function Drawboat()
    love.graphics.draw(boat.sprite,boat.x,boat.y,0,1,1)
end