local love = require("love")

function calculateDistance(x1, y1, x2, y2)
    return math.sqrt(((x2 - x1) ^ 2) + ((y2 - y1) ^ 2))
end

SCORE = 0

function drawScore(score)
    return{
        love.graphics.setColor(1, 0, 0, 0.8),
        love.graphics.print("Kill count: " .. score, 450, 0, 0, 2, 2)
    }
end