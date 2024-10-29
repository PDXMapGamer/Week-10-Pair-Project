local love = require("love")

function  Bullet(x, y, angle)
    return{
        x = x,
        y = y,
        angle = angle,
        draw = function (self)
            love.graphics.setColor(1,1,1)
            love.graphics.setPointSize(5)
            love.graphics.points(self.x, self.y)
        end
    }
end