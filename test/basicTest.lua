local lu = require('lib.luaunit')
local Bullet = require('src.entities.bullet')

local dt = (1 / 60)
local screenSize = { width = 800, height = 600}

function testBulletSelfDestructs()
    local bullets = {}
    local bullet = Bullet:new{
        x = screenSize.width / 2,
        y = screenSize.height - 40,
        boundaryMaxX = screenSize.width,
        boundaryMaxY = screenSize.height
    }

    local timeInSeconds = 10
    local frameCount = 0

    table.insert(bullets, bullet)
    while #bullets > 0 and frameCount < (1 / dt) * timeInSeconds do
        frameCount = frameCount + 1
        timeInSeconds = timeInSeconds - dt
        for i, b in ipairs(bullets) do
            b:update(dt)
            if b.y < b.boundary.minY or b.y < b.boundary.maxY then
                table.remove(bullets, i)
            end
        end
    end

    lu.assertEquals(#bullets, 0)
end

os.exit( lu.LuaUnit.run() )