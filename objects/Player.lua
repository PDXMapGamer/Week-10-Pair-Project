local love = require("love")

function Player()
    return{
        sprite = love.graphics.newImage("images/reimu.png"),
        x = 400,
        y = 200,
        height = 50,
        width = 100,
        draw = function (player)
            love.graphics.draw(player.sprite, player.x, player.y, player.angle1, 1, 1, player.width/2, player.height/2)
        end
    }
end

return Player