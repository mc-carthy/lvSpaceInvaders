local player = {}

function love.load()
    player.w = 60
    player.h = 20
    player.x = love.graphics.getWidth() / 2 - player.w / 2
    player.y = love.graphics.getHeight() - 40
    player.speed = 200
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
end

function love.draw()
    love.graphics.setColor(0, 1, 0)
    love.graphics.rectangle('fill', player.x, player.y, player.w, player.h)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end