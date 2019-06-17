local Player = require('src.entities.player')

function love.load()
    player = Player:new{
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() - 40
    }
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'space' then
        player:fire()
    end
end