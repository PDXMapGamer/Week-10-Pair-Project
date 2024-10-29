local love = require("love")

function Player()
    return{
        sprite = love.graphics.newImage("images/reimu.png"),
        x = 400,
        y = 200,
        angle = 0,
        height = love.graphics.newImage("images/reimu.png"):getWidth(),
        width = love.graphics.newImage("images/reimu.png"):getHeight(),
        draw = function (player)
            love.graphics.draw(player.sprite, player.x, player.y, player.angle, 0.4, 0.4, player.width/2, player.height/2)
        end,

        movePlayer = function (player, dt)
            if love.keyboard.isDown("d") then
                player.x = player.x + 1
            end
            if love.keyboard.isDown("a") then
                player.x = player.x - 1
            end
            if love.keyboard.isDown("s") then
                player.y = player.y + 1
            end
            if love.keyboard.isDown("w") then
                player.y = player.y - 1
            end
            if love.keyboard.isDown("left") then 
                player.angle = player.angle - math.pi * dt
            end
            if love.keyboard.isDown("right") then
                player.angle  = player.angle + math.pi * dt
            end
        end
    }
end

return Player