local love = require("love")
local Player = require("objects.Player")--This is like importing objects from other files.
local bullet = require("objects.Bullet")

function love.load()
    _G.player = Player()
    FIRECOOLDOWN = 0
end

function love.update(dt)
    FIRECOOLDOWN = FIRECOOLDOWN + ( 15 * dt)
    if(FIRECOOLDOWN > 1) then
        player:fire()
        FIRECOOLDOWN = FIRECOOLDOWN - 1
    end
    player:movePlayer(dt)
end

-- function drawfire(x,y)
--     love.graphics.circle("fill", x, y, 10)
-- end

function love.draw()
    player:draw()
    -- love.graphics.print(fireCooldown)
end
