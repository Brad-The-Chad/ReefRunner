anim8= require ('libraries/anim8')

width=love.graphics.getWidth()
height=love.graphics.getHeight()

mainMenu=true
howToPlay=false

bgImage=love.graphics.newImage('sprites/waterSheet.png')
bgGrid=anim8.newGrid(256,256,bgImage:getWidth(),bgImage:getHeight())
bgAnimation=anim8.newAnimation(bgGrid('1-60',1),0.1)

function MainMenuDraw()
    -- Draw the background animation
    bgAnimation:draw(bgImage, 0, 0, nil, 5)
  
    -- Set the background color to light blue
    love.graphics.setBackgroundColor(0.5, 0.7, 1)
  
    -- Draw the game objects or menu items here
    love.graphics.setColor(1, 1, 1) -- Set the text color to white
    love.graphics.setFont(love.graphics.newFont(24))
    -- Draw the dark blue boxes under the menu items
    love.graphics.setColor(0, 0, 0.5) -- Set the box color to dark blue
    love.graphics.rectangle("fill", width/2-150, height/2-110, 300, 80)
    love.graphics.rectangle("fill", width/2-100, height/2, 200, 30)
    love.graphics.rectangle("fill", width/2-100, height/2+50, 200, 30)
    love.graphics.rectangle("fill", width/2-100, height/2+100, 200, 30)
  
    love.graphics.setColor(1, 1, 1) -- Set the text color back to white
    love.graphics.printf("Start", 0, height/2, width, "center")
    love.graphics.printf("How to Play", 0, height/2+50, width, "center") -- Add "How to Play" menu item
    love.graphics.printf("Quit", 0, height/2+100, width, "center")
    love.graphics.setFont(love.graphics.newFont(48))
    love.graphics.printf("Reef Runner", 0, height/2-100, width, "center")
  end


  function HowToPlayDraw()
    -- Draw the background animation
    bgAnimation:draw(bgImage, 0, 0, nil, 3.2)
 
    -- Set the background color to light blue
    love.graphics.setBackgroundColor(0.5, 0.7, 1)
 
    -- Draw the dark blue box underneath the title
    love.graphics.setColor(0.1, 0.1, 0.4)
    love.graphics.rectangle("fill", width/2 - 200, height/2 - 150, 400, 50)
    love.graphics.rectangle("fill", 0, height/2-55, width, 100)
    love.graphics.rectangle("fill", 0, height/2+90, width, 50)
 
    -- Draw the title
    love.graphics.setFont(love.graphics.newFont(36))
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("How to Play", 0, height/2-150, width, "center")
 
    -- Draw the instructions
    love.graphics.setFont(love.graphics.newFont(24))
    love.graphics.printf("Dive into the depths of the ocean to gather lost treasure and bring it back to your boat! But watch out! There's more than just you in the ocean!", 0, height/2-50, width, "center")
    love.graphics.printf("Press any key to go back to the main menu.", 0, height/2+100, width, "center")
 end

function love.mousepressed(x, y, button)
    if mainMenu then
        -- Handle mouse click events here
        if y >= height/2 and y <= height/2+50 then -- Start the game
            mainMenu=false
            love.audio.play(spawn)
        elseif y >= height/2+50 and y <= height/2+100 then -- How to Play
           mainMenu=false
           howToPlay=true
        elseif y >= height/2+100 and y <= height/2+150 then -- Quit the game
            love.event.quit()
        end
    end
end

function love.keypressed(key, scancode, isrepeat)
    if howToPlay then
        mainMenu = true
        howToPlay = false
    end
end