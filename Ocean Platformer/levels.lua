
require ("world")
require ("fish")
require ("uglyfish")
require ("shark")
require ("jellyfish")
require ("boat")
require ("treasure")
require ("player")

level1= sti ('maps/level1bb.lua')
gameMap=level1
level2=sti ('maps/level2.lua')
level3=sti ('maps/level3.lua')

function NewLevel()
    player.hasTreasure=false
    player.hasEasterEgg=false
    gameWin=false
    gameOver=false
    player.lives = 6
    ResetSharks()
    ResetFish()
    ResetJellyfish()
    ResetUglyfish()
    if gameMap==level1 then
        gameMap=level2
        ResetWalls()
        boat.x=1090
        newShark(1088, 532, 20000, 1)
        newShark(144,384,20000,-1)
        newJellyfish(480,624,12500,1)
        newJellyfish(768,720,12500,1)
        newJellyfish(880,800,12500,-1)
        newJellyfish(704,992,12500,1)
        newJellyfish(784,464,12500,1)
        newJellyfish(320,1168,12500,1)
        newJellyfish(208,1392,12500,-1)
        newFish(32,256,22500,1)
        newFish(112,1072,22500,1)
        newFish(624,1016,22500,-1)
        newUglyFish(654,1267,15000,1)
        newUglyFish(576,672,15000,-1)
        TreasurePos(16,1408)
        easterEggPos(20, 1500)
    elseif gameMap ==level2 then
        gameMap=level3
        ResetWalls()
        boat.x=38
        boat.y=59
        newJellyfish(600,190,16000,-1)
        newJellyfish(1530,1336,16000,1)
        newJellyfish(1665,1410,16000,-1)
        newJellyfish(1873,1104,16000,1)
        newJellyfish(122,1275,16000,1)
        newJellyfish(182,1310,16000,-1)
        newJellyfish(242,1275,16000,1)
        newJellyfish(302,1310,16000,-1)
        newJellyfish(362,1275,16000,1)
        newJellyfish(422,1310,16000,-1)
        newJellyfish(482,1275,16000,1)
        newJellyfish(542,1310,16000,-1)
        newJellyfish(602,1275,16000,1)
        newJellyfish(662,1310,16000,-1)
        newJellyfish(722,1275,16000,1)
        newJellyfish(782,1310,16000,-1)
        newJellyfish(842,1275,16000,1)
        newFish(700,340,25000,1)
        newFish(834,470,25000,-1)
        newShark(330,800,30000,1)
        newShark(900,1016,30000,-1)
        newUglyFish(1273,907,22000,1)
        newUglyFish(1108,182,22000,1)
        newUglyFish(1450,588,22000,-1)

        TreasurePos(1863,1217)
        easterEggPos(20,1408)

    end
end
 




--16