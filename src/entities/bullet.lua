local Bullet = {}

local width, height = 10, 10
local speed = 200
local colour = { 1, 1, 1}

Bullet.__index = Bullet

function Bullet:new(params)
    local inst = {}

    inst.name = 'Bullet'
    inst.w, inst.h = width, height
    inst.x, inst.y = params.x - inst.w / 2, params.y - inst.h / 2
    inst.speed = speed
    inst.colour = colour
    inst.boundary = {
        minX = params.boundaryMinX or 0,
        maxX = params.boundaryMaxX or love.graphics.getWidth(),
        minY = params.boundaryMinY or 0,
        maxY = params.boundaryMaxY or love.graphics.getHeight()
    }

    setmetatable(inst, self)
    return inst
end

function Bullet:update(dt)
    self.y = self.y - self.speed * dt
    if self.y < self.boundary.minY or self.y > self.boundary.maxY then
        self.done = true
    end
end

function Bullet:draw()
    love.graphics.setColor(unpack(self.colour))
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

return Bullet