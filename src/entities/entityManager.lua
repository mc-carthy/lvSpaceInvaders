local EntityManager = {}

EntityManager.__index = EntityManager

function EntityManager:new()
    local inst = {}

    inst.entities = {}

    setmetatable(inst, self)

    return inst
end

function EntityManager:update(dt)
    for _, v in pairs(self.entities) do
        if v.update then v:update(dt) end
    end
    self:cleanup()
end

function EntityManager:draw()
    for _, v in pairs(self.entities) do
        if v.draw then v:draw(dt) end
    end
end

function EntityManager:add(entity)
    table.insert(self.entities, entity)
end

function EntityManager:cleanup()
    for i = #self.entities, 1, -1 do
        local e = self.entities[i]
        if e.done then
            table.remove(self.entities, i)
        end
    end
end

function EntityManager:getObjectsByName(name)
    local objects = {}
    for _, v in pairs(self.entities) do
        if v.name == name then
            table.insert(objects, v)
        end
    end
    return objects
end

return EntityManager