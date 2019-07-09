local Player = require('src.entities.player')
local Bullet = require('src.entities.bullet')
local EntityManager = require('src.entities.entityManager')

function love.load()
    EM = EntityManager:new()

    player = Player:new{
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() - 40
    }
    bullet = Bullet:new{
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight()
    }
    
    EM:add(player)
    EM:add(bullet)
end

function love.update(dt)
    EM:update(dt)
end

function love.draw()
    EM:draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    if key == 'space' then
        player:fire()
    end
end