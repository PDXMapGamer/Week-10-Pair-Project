local love = require("love")

function  Bullet(x, y, angle)
    return{
        x = x,
        y = y,
        x_vel = BULLET_SPEED * math.cos(angle) / love.timer.getFPS(),
        y_vel = BULLET_SPEED * math.sin(angle) / love.timer.getFPS(), 
        -- so this is basically the velocity of the speed the bulles goes
        distance = 0,
        angle = angle,
        draw = function (self)
            love.graphics.setColor(1,1,1)
            love.graphics.setPointSize(5)
            love.graphics.points(self.x, self.y)
        end

        move = function (self)
            self.x = self.x + self.x_vel
            self.y = self.y + self.y_vel
-- and then here (which isnt finished yet) i was planning on making the bullets disapeer once it hits the edge of the screen. its not finished so it doesnt work currntly
            if self.x < 0 then
                self.y = love.graphics.getHeight()
            end
            elseif self.y > love.graphics.getHeight() then
            self.y = 0
        end
        end
        -- self.distance = self.distance + math sqr
    }
end