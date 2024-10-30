local love = require("love")

function  Bullet(x, y, angle)
    BULLET_SPEED = 2
    return{
        x = x,
        y = y,
        x_vel = BULLET_SPEED * math.cos(angle) ,
        y_vel = BULLET_SPEED * math.sin(angle),
        -- so this is basically the velocity of the speed the bulles goes
        distance = 0,
        angle = angle,
        draw = function (self)
            love.graphics.setColor(1,1,1)
            love.graphics.setPointSize(5)
            love.graphics.points(self.x, self.y)
        end,

        move = function (self)
            self.x = self.x + self.x_vel
            self.y = self.y + self.y_vel
        end
    }
end