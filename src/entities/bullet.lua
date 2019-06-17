local Bullet = {}

local width, height = 10, 10
local speed = 200
local colour = { 1, 1, 1}

Bullet.__index = Bullet

function Bullet:new(params)
    local inst = {}

    inst.w, inst.h = width, height
    inst.x, inst.y = params.x - inst.w / 2, params.y - inst.h / 2
    inst.speed = speed
    inst.colour = colour

    setmetatable(inst, self)
    return inst
end

function Bullet:update(dt)
    self.y = self.y - self.speed * dt
end

function Bullet:draw()
    love.graphics.setColor(unpack(self.colour))
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

return Bullet