local love = require("love")
local Player = require("objects.Player")--This is like importing objects from other files.
local Enemy = require ("objects.Enemy")
require("globals")
math.randomseed(os.time())

function love.load()
    _G.player = Player()
    _G.ENEMIES = {}
    FIRECOOLDOWN = 0
    ENEMYCOOLDOWN = 0
end

function love.update(dt)
    FIRECOOLDOWN = FIRECOOLDOWN + ( 15 * dt)
    ENEMYCOOLDOWN = ENEMYCOOLDOWN + dt
    if(FIRECOOLDOWN > 1) then
        player:fire()
        FIRECOOLDOWN = FIRECOOLDOWN - 1
    end
    if(ENEMYCOOLDOWN > 1) then
        local randomNum = math.floor(math.random(4))
        local x
        local y
        local angle
        local radius = math.random(8, 20)
        --It appears there is no easy way of doing a switch statement in Lua.
        if(randomNum == 1) then
            -- print("top")
            x = math.random() * 1024
            y = 10
            angle = math.random(1, 9) * 0.1 * math.pi--generates a random number between 0 and 0.9pi without risking the value being too close to 1 (this would make the enemy basically go upwards instead of somewhat towards the other screen). All other starting points follow this same logic
            table.insert(ENEMIES, Enemy(x, y, radius, angle))
        elseif (randomNum == 2) then
            -- print("bottom")
            x = math.random() * 1024
            y = 759
            angle = math.random(11, 19) * 0.1 * math.pi
            table.insert(ENEMIES, Enemy(x, y, radius, angle))
        elseif (randomNum == 3) then
            -- print("left")
            x = 10
            y = math.random() * 786
            -- because the range of angles is not continuous a 50/50 random check is used to decide if the angle should be 0 - 0.9pi rads or 1.6rads to 0
            local biasedcoinflip = math.random() > 0.66--I want an axproximately even distribution of random numbers between 0-20, ignoring values between 10-15. As 0-9 rang has twice the possible numbers as 16-20 range a 2:1 bias should make all numbers roughly equally likely
            if (biasedcoinflip) then
                angle = math.random(0, 9) * 0.1 * math.pi
            else
                angle = math.random(16, 20) * 0.1 * math.pi
            end
            table.insert(ENEMIES, Enemy(x, y, radius, angle))
        elseif (randomNum == 4) then
            -- print("right")
            x = 1000
            y = math.random() * 786
            angle = math.random(1, 9) * -0.1 * math.pi
            table.insert(ENEMIES, Enemy(x, y, radius, angle))
        end
        ENEMYCOOLDOWN = ENEMYCOOLDOWN - 1 
    end
    player:movePlayer(dt)
    --Update all enemy loop
    for enemyIndex, enemy in pairs(ENEMIES) do
        if(player.isAlive) then
            if(calculateDistance(player.x, player.y, enemy.x, enemy.y) < player.width * 0.20)then
                player.isAlive = false
            end
        end
        enemy:move(dt)
        for bulletIndex, bullet in pairs(player.bullets) do
            if(calculateDistance(bullet.x, bullet.y, enemy.x, enemy.y) < enemy.radius)then
                print("bullet hit")
                player:destroyBullet(bulletIndex)
                enemy:onHit(ENEMIES, enemyIndex)
            end
        end
    end
end



function love.draw()
    if(player.isAlive) then
        love.graphics.setColor(1,1,1,1)
        player:draw()
    end
    for _, enemy in pairs(ENEMIES) do
        enemy:draw()
    end
end
