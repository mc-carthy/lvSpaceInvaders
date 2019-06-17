local Player = require('src.entities.player')
local Bullet = require('src.entities.bullet')

function love.load()
    player = Player:new{
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() - 40
    }
    bullet = Bullet:new{
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight()
    }
end

function love.update(dt)
    player:update(dt)
    bullet:update(dt)
end

function love.draw()
    player:draw()
    bullet:draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'space' then
        player:fire()
    end
end