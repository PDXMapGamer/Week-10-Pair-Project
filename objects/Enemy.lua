local love = require "love"

function Enemy(x, y, size, angle)
    local speed = 100
    return{
        x = x,
        y = y,
        angle = angle,
        x_vel = math.random() * speed * math.cos(angle),
        y_vel = math.random() * speed * math.sin(angle),
        radius = size,

        draw = function (self)
            love.graphics.setColor(0, 1, 0.7)
            love.graphics.circle("fill", self.x, self.y, self.radius)
        end,

        move = function (self, dt)
            self.x = self.x + self.x_vel * dt
            self.y = self.y + self.y_vel * dt
            -- Enemy bounce off game boundry
            if (self.x < 0 or self.x > 1020 or self.y < 0 or self.y > 780) then
                -- if enemy hits a boundry then it will go in the opposite direction
                self.x_vel = -self.x_vel
                self.y_vel = -self.y_vel
            end
          
        end
    }

end

return Enemy