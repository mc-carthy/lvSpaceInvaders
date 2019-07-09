local Bullet = require('src.entities.bullet')
local EntityMaanger = require('src.entities.entityManager')

local dt = (1 / 60)
local screenSize = { width = 800, height = 600}

describe("Basic bullet behaviour", function()
    it("should be destroyed once off screen", function()
        local EM = EntityMaanger:new()
        local bullet = Bullet:new{
            x = screenSize.width / 2,
            y = screenSize.height - 40,
            boundaryMaxX = screenSize.width,
            boundaryMaxY = screenSize.height
        }

        EM:add(bullet)
    
        local timeInSeconds = 10
        local frameCount = 0
    
        while #EM:getObjectsByName('Bullet') > 0 and frameCount < (1 / dt) * timeInSeconds do
            frameCount = frameCount + 1
            timeInSeconds = timeInSeconds - dt
            EM:update(dt)
        end

        assert.is_equal(#EM:getObjectsByName('Bullet'), 0)
    end)
end)