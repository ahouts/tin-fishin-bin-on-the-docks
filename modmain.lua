local fish_box = "fish_box"
AddRecipePostInit(fish_box, function(existing)
    local previous_testfn = existing.testfn
    existing.testfn = function(pt)
        local world = GLOBAL.TheWorld
        local monkey_dock = GLOBAL.WORLD_TILES.MONKEY_DOCK
        local ground_tile = nil
        if world and monkey_dock then
            ground_tile = world.Map:GetTileAtPoint(pt.x, pt.y, pt.z)
        end
        return previous_testfn(pt) or (ground_tile and ground_tile == monkey_dock)
    end
end)
