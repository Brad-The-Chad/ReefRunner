

function love.load()
    wf=require'libraries/windfield'
    anim8=require'libraries/anim8'
    cam=require'libraries/camera'
    sti=require'libraries/sti'
    
    require("player")
    require("shark")
    require("treasure")
    require("camera")
    require("interactions")
    require("music")
    require("world")
    require("fish")
    require("uglyfish")
    require("jellyfish")
    require("boat")
    require("gameover")
    require("menu")
    require("dennisbubble")
    require("levels")

    love.graphics.setDefaultFilter("nearest","nearest")
      
    LoadWalls()
    
    gameWin=false
    gameOver=false
end

function love.update(dt)
    
    if mainMenu or howToPlay then
    bgAnimation:update(dt)
    love.audio.play(menuMusic)
    end
    if not gameOver and not gameWin and not mainMenu and not howToPlay then
        love.audio.stop(menuMusic)
        love.audio.play(source)
        PlayerMovement(dt)
        updateSharks(dt)
        LookAtPlayer()
        CheckTreasureInteraction()
        CheckEasterEggInteraction()
        updateFishs(dt)
        updateUglyFishs(dt)
        updateJellyfishs(dt)
        world:update(dt)
        CheckSharkCollision()
        CheckBoatInteraction()
        CheckJellyfishCollision()
        SpawnDennisBubbles()
        UpdateDennisBubbles(dt)
        
    elseif gameOver or gameWin then
        EndChoice()
    end
end

function love.draw() 
    if not mainMenu and not howToPlay then
        cam:attach() 
            gameMap:drawLayer(gameMap.layers["Tile Layer 1"])
            if gameMap==level3 then
            gameMap:drawLayer(gameMap.layers["Tile Layer 2"])
            end
            DrawPlayer()
            drawSharks()
            drawFishs()
            drawUglyFishs()
            drawJellyfishs()
            Drawboat()
            DrawTreasure()
            DrawEasterEgg()
            world:draw()
            DrawE()
            DrawDennisBubbles()
           
        cam:detach()
            DrawLives()
        if gameOver then
            GameOverDraw()
        end
        if gameWin then
            GameWinDraw()
        end
    elseif mainMenu then
        MainMenuDraw()
    elseif howToPlay then 
        HowToPlayDraw()
    end
end