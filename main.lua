local love = require("love")
local Player = require("objects.Player")


function love.load()
    _G.player = Player()
    _G.fireCooldown = 0
    
end

function love.update(dt)
    -- fireCooldown = fireCooldown + ( 2 * dt)
    -- if(fireCooldown > 1) then
    --     drawfire(player.x + 50, player.y)
    --     fireCooldown = fireCooldown - 1
    -- end
    -- if love.keyboard.isDown("d") then
    -- player.x = player.x + 1
    -- end
    -- if love.keyboard.isDown("a") then
    --     player.x = player.x - 1
    -- end
    -- if love.keyboard.isDown("s") then
    --     player.y = player.y + 1
    -- end
    -- if love.keyboard.isDown("w") then
    --     player.y = player.y - 1
    -- end
    -- if love.keyboard.isDown("left") then 
    --     player.angle1 = player.angle1 - math.pi * dt
    -- end
    -- if love.keyboard.isDown("right") then
    --    player.angle1 = player.angle1 + math.pi * dt
    -- end
end

-- function drawfire(x,y)
--     love.graphics.circle("fill", x, y, 10)
-- end

function love.draw()
    player:draw()
    -- love.graphics.print(fireCooldown)
end
