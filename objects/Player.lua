local love = require("love")
local bullet = require("objects.Bullet")

function Player()
        
    return{
        sprite = love.graphics.newImage("images/reimu.png"),
        x = 400,
        y = 200,
        angle = 0,
        bullets = {},
        height = love.graphics.newImage("images/reimu.png"):getWidth(),
        width = love.graphics.newImage("images/reimu.png"):getHeight(),
        draw = function (player)
            love.graphics.draw(player.sprite, player.x, player.y, player.angle, 0.5, 0.5, player.width/2, player.height/2)

            for _, bullet in pairs(player.bullets) do
                bullet:draw()
            end
        end,
        fire = function (self)
            table.insert(self.bullets, Bullet(
                self.x,
                self.y,
                self.angle
            ))
        end,
        movePlayer = function(player, dt)
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