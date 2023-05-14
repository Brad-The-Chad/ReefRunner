
width=love.graphics.getWidth()
height=love.graphics.getHeight()

function GameOverDraw()
    love.graphics.setFont(love.graphics.newFont(48)) -- Set the font size to 48
    love.graphics.printf("Game Over", 0, height-300,width, "center")
    love.graphics.printf("Press Enter to Play Again or Escape to Exit", 0, height-250,width, "center")
    love.graphics.setFont(love.graphics.newFont(12)) -- Reset the font size to default 
end

function GameWinDraw()
    love.graphics.setFont(love.graphics.newFont(48)) -- Set the font size to 48
    love.graphics.printf("You Win!", 0, height-300,width, "center")
    if gameMap==level3 then
        love.graphics.printf("Press Enter to quit or Escape to Exit", 0, height-250,width,  "center")
    else
        love.graphics.printf("Press Enter to Play Next Level or Escape to Exit", 0, height-250,width,  "center")
    end
    love.graphics.setFont(love.graphics.newFont(12)) -- Reset the font size to default
    if easterEgg.y==boat.y then
        love.graphics.setFont(love.graphics.newFont(48)) -- Set the font size to 48
        love.graphics.printf("You collected the Easter Egg!", 0, height-100,width, "center")
        end
end

function ResetGame()
    -- reset player lives, score, etc.
    player.lives = 6
    player.hasTreasure = false
    gameOver = false
    gameWin=false
    treasure.x=treasure.x
    treasure.y=treasure.y
end


function EndChoice()
    if love.keyboard.isDown('escape') then
        love.event.quit()
     

    elseif  love.keyboard.isDown('return') then
        if gameOver then  
            ResetGame()
        end
        if gameWin then
            if gameMap==level3 then
                love.event.quit()
            else 
            NewLevel()
            end
            
            
        end  
    end
end