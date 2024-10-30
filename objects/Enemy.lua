local love = require "love"

function Enemy(x, y, size)
    local speed = math.random(25)
    return{
        x = x,
        y = y,
        x_vel = math.random() * speed,
        y_vel = math.random() * speed,
        radius = size,

        draw = function (self)
            love.graphics.setColor(0, 1, 0.7)
            love.graphics.circle("fill", self.x, self.y, self.radius)
        end
    }

end

return Enemy