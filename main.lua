local love = require("love")
local Player = require("objects.Player")--This is like importing objects from other files.
local Enemy = require ("objects.Enemy")

function love.load()
    _G.player = Player()
    _G.ENEMIES = {}
    FIRECOOLDOWN = 0
    ENEMYCOOLDOWN = 0
end

function love.update(dt)
    FIRECOOLDOWN = FIRECOOLDOWN + ( 15 * dt)
    ENEMYCOOLDOWN = ENEMYCOOLDOWN + dt
    if(FIRECOOLDOWN > 1) then
        player:fire()
        FIRECOOLDOWN = FIRECOOLDOWN - 1
    end
    if(ENEMYCOOLDOWN > 1) then
        local randomNum = math.floor(math.random(4))
        local x
        local y
        local radius = math.random(25)
        --It appears there is no easy way of doing a switch statement in Lua.
        if(randomNum == 1) then
            print("top")
            x = math.random() * 1024
            y = 10
            table.insert(ENEMIES, 1, Enemy(x, y, radius))
        elseif (randomNum == 2) then
            print("bottom")
        elseif (randomNum == 3) then
            print("left")
        elseif (randomNum == 4) then
            print("right")
        end
        -- local randomX = math.random() * 1024
        -- local randomY = math.random() * 786
        -- local randomR = math.random() * 20
        -- local enemy = Enemy(randomX, randomY, randomR)
        -- table.insert(ENEMIES, 1, enemy)
        ENEMYCOOLDOWN = ENEMYCOOLDOWN - 1 
    end
    player:movePlayer(dt)
end



function love.draw()
    love.graphics.setColor(1,1,1,1)
    player:draw()
    for _, enemy in pairs(ENEMIES) do
        enemy:draw()
    end
end
