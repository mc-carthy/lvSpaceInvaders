local Bullet = require('src.entities.bullet')

local Player = {}

local width = 60
local height = 20
local speed = 200
local colour = { 0, 1, 0 }

Player.__index = Player

function Player:new(params)
    local inst = {}
    
    inst.w, inst.h = width, height
    inst.x = (params.x or 0) - inst.w / 2
    inst.y = (params.y or 0) - inst.h / 2
    inst.colour = params.colour or colour
    inst.speed = params.speed or speed
    
    setmetatable(inst, self)

    return inst
end

function Player:update(dt)
    local dx = 0
    if love.keyboard.isDown('left') or love.keyboard.isDown('a') then 
        dx = dx - 1 
    end
    if love.keyboard.isDown('right') or love.keyboard.isDown('d') then 
        dx = dx + 1 
    end
    self.x = self.x + dx * dt * self.speed
end

function Player:draw()
    love.graphics.setColor(unpack(self.colour))
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

function Player:fire()
    local bullet = Bullet:new{
        x = self.x + self.w / 2,
        y = self.y
    }
    EM:add(bullet)
end

return Player