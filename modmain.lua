AddRecipePostInit("fish_box", function(existing)
    local util = require("dst-util/util")(GLOBAL)

    local previous_testfn = util.access(existing, "testfn")
    local monkey_dock = util.access(GLOBAL, "WORLD_TILES", "MONKEY_DOCK")
    if util.any_nil(previous_testfn, monkey_dock) then
        util.error("implementation of Tin Fishin' Bin changed, contact mod author!")
        return
    end

    existing.testfn = function(pt)
        local world = util.access(GLOBAL, "TheWorld")
        if util.any_nil(world) then
            util.error("world access changed, contact mod author!")
        end
        return previous_testfn(pt) or world.Map:GetTileAtPoint(pt.x, pt.y, pt.z) == monkey_dock
    end
end)
