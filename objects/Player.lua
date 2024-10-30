local love = require("love")
local bullet = require("objects.Bullet")

function Player()
        
    return{
        sprite = love.graphics.newImage("images/reimu.png"),
        x = 400,
        y = 200,
        angle = 0,
        bullets = {},--todo This is a table. When we learn about tables write an explanation of what they are
        height = love.graphics.newImage("images/reimu.png"):getWidth(),
        width = love.graphics.newImage("images/reimu.png"):getHeight(),
        draw = function (player)
            love.graphics.draw(player.sprite, player.x, player.y, player.angle, 0.5, 0.5, player.width/2, player.height/2)

            for _, bullet in pairs(player.bullets) do
                -- The _ is like i in JavaScript for loops (eg for(i=0; ...)), while we can use i here, this variable is not used so it is standard practice is use _ to show this variable is not used
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

        -- todo Destroy bullet function does not work, crashes game when bullet touches the edge of the screen
        destroyBullet = function (self, index) 
            table.remove(self.bullets, index)
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
            --Keeps players in bounds
            if player.x < player.width / 4 then
                player.x = player.width / 4
            end
            if player.x > 1024 - player.width / 4 then
                player.x = 1024 - player.width / 4
            end
            if player.y < player.height / 4 then
                player.y = player.height / 4
            end
            if player.y > 768 - player.height / 4 then
                player.y = 768 - player.height / 4
            end
            for index, bullet in ipairs(player.bullets) do
                bullet:move()

                if(bullet.x < 0 or bullet.x > 1030 or bullet.y < 0 or bullet.y > 770) then
                    player.destroyBullet(player, index)--Destroys bullets when they go off screen
                end
            end
        end
    }
end

return Player