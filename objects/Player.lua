local love = require("love")

function Player()
    return{
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() / 2,
        rotation = 0,
        thrusting = false,
        thrust = {
            x = 0,
            y = 0,
            speed = 5,
        },
        draw = function (player)
            love.graphics.draw(player.sprite, player.x, player.y, player.angle1, 1, 1, player.width/2, player.height/2)
        end
    }
end

return Player