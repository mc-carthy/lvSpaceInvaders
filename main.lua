local player = {}
local bullets = {}

local Bullet = {
    w = 10,
    h = 10
}

function love.load()
    player.w = 60
    player.h = 20
    player.x = love.graphics.getWidth() / 2 - player.w / 2
    player.y = love.graphics.getHeight() - 40
    player.speed = 200
    player.fire = function()
        local bullet = { 
            x = player.x + player.w / 2 - Bullet.w / 2,
            y = player.y,
            speed = -100
        }
        table.insert(bullets, bullet)
    end
end

function love.update(dt)
    local dx = 0
    if love.keyboard.isDown('left') or love.keyboard.isDown('a') then 
        dx = dx - 1 
    end
    if love.keyboard.isDown('right') or love.keyboard.isDown('d') then 
        dx = dx + 1 
    end
    player.x = player.x + dx * dt * player.speed
    updateBullets(dt)
end

function love.draw()
    drawBullets()
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle('fill', player.x, player.y, player.w, player.h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print('Number of bullets: ' .. tostring(#bullets), 10, 10)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'space' then
        player.fire()
    end
end

function updateBullets(dt)
    for i, b in ipairs(bullets) do
        b.y = b.y + b.speed * dt
        if b.y <= Bullet.h then
            table.remove(bullets, i)
        end
    end
end

function drawBullets()
    love.graphics.setColor(1, 1, 1)
    for _, b in pairs(bullets) do
        love.graphics.rectangle('fill', b.x, b.y, Bullet.w, Bullet.h)
    end
end