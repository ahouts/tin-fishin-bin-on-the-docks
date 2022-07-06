local fish_box = "fish_box"
AddRecipePostInit(fish_box, function(existing)
    local opts = {}
    for k,v in pairs(existing) do
        opts[k] = v
    end
    opts.testfn = function(pt)
        local world = GLOBAL.TheWorld
        local ground_tile = nil
        if world then
            ground_tile = world.Map:GetTileAtPoint(pt.x, pt.y, pt.z)
        end
        return existing.testfn(pt) or (ground_tile and ground_tile == GLOBAL.WORLD_TILES.MONKEY_DOCK)
    end
    AddRecipe2(fish_box, existing.ingredients, existing.level, opts)
end)
