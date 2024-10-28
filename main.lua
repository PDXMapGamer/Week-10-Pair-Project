function love.load()
    player ={}
    player.sprite = love.graphics.newImage("images/reimu.png")
    player.x = 400
    player.y = 200
    player.height = player.sprite:getHeight()
    player.width = player.sprite:getWidth()
    -- player.centerY = player.height / 2
    -- player.centerX = player.width / 2
    player.angle1 = 0
end

function love.update(dt)
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
        player.angle1 = player.angle1 - math.pi * dt
    end
    if love.keyboard.isDown("right") then
       player.angle1 = player.angle1 + math.pi * dt
    end
end

function love.draw()
    love.graphics.draw(player.sprite, player.x, player.y, player.angle1, 1, 1, player.width/2, player.height/2)
end