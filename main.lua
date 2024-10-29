_G.love = require("love")

function love.load()
    _G.player ={}
    _G.fireCooldown = 0
    player.sprite = love.graphics.newImage("images/reimu.png")
    player.x = 400
    player.y = 200
    player.height = player.sprite:getHeight()
    player.width = player.sprite:getWidth()
    player.angle1 = 0
end

function love.update(dt)
    fireCooldown = fireCooldown + ( 2 * dt)
    if(fireCooldown > 1) then
        print("FIRE")
        fireCooldown = fireCooldown - 1
    end
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
    love.graphics.print(fireCooldown)
    love.graphics.draw(player.sprite, player.x, player.y, player.angle1, 0.3, 0.3, player.width/2, player.height/2)
end