local Enemy = {}

Enemy.__index = Enemy

local width, height = 40, 15
local colour = { 0.75, 0, 0 }
local speed = 200

function Enemy:new(params)
    local inst = {}

    inst.w, inst.h = width, height
    inst.colour = colour
    inst.speed = speed
    inst.x = params.x - inst.w / 2
    inst.y = params.y - inst.h / 2
    inst.xDirection = 1
    inst.nextYThreshold = inst.y

    setmetatable(inst, self)
    
    return inst
end

function Enemy:update(dt)
    if self.nextYThreshold == self.y then
        self.x = self.x + self.speed * self.xDirection * dt
        if self.x < 0 or self.x + self.w > love.graphics.getWidth() then
            if self.x < 0 then self.x = 0 end
            if self.x + self.w > love.graphics.getWidth() then self.x = love.graphics.getWidth() - self.w end
            self.xDirection = -self.xDirection
            self.nextYThreshold = self.y + self.h * 2
        end
    else
        self.y = self.y + self.speed * dt
        if self.y > self.nextYThreshold then
            self.y = self.nextYThreshold
        end
    end
end

function Enemy:draw()
    love.graphics.setColor(unpack(self.colour))
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end

return Enemy