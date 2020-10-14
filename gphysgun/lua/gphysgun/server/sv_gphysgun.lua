hook.Add("OnPhysgunPickup", "gPhysgun:PhysgunPickup", function(ply, ent)
    if ent:IsValid() && ent:IsPlayer() && GPHYSGUN.PhysgunPermission[ply:GetUserGroup()] then
        
        ent:SetNWEntity("recentPickup", true)

        if ent:IsFrozen() then
            ent:SetMoveType(MOVETYPE_WALK)
            ent:Freeze(false)
            Log(ent:Name() .. " is no longer frozen.")
        end
    end
end)

hook.Add("PhysgunDrop", "gPhysgun:PhysgunDrop", function(ply, ent)
    if ent:IsValid() && ent:IsPlayer() && GPHYSGUN.PhysgunPermission[ply:GetUserGroup()] then

        if GPHYSGUN.PhysgunPermission[ent:GetUserGroup()] && not GPHYSGUN.AdminInteractOthers then return end

        if ply:KeyPressed(IN_ATTACK2) then
            ent:SetNWEntity("lastWeapons", ent:GetWeapons())
            ent:SetMoveType(MOVETYPE_NOCLIP)
            ent:Freeze(true)
            Log(ent:Name() .. " is now frozen.")
            return true
        end
    end
end)

-- Remove fall damage if player was pick up recently
hook.Add("OnPlayerHitGround", "gPhysgun:PlayerHitGround", function(ply)
    if not GPHYSGUN.DisableFallDamages then return end

    if ply:GetNWEntity("recentPickup") then
        ply:SetNWEntity("recentPickup", false)

        local effectData = EffectData()
        effectData:SetOrigin(ply:GetPos())
        effectData:SetScale(0.05)
        effectData:SetMagnitude(0.05)
        util.Effect("VortDispel", effectData)

        Log("Fall damages was removed for the player " .. ply:Name() .. ".")
        return true
    end
end)

-- Disable spawning props when player is frozen
hook.Add("PlayerSpawnProp", "gPhysgun:PropSpawn", function(ply, model)
    if not GPHYSGUN.DisableSpawningProps then return end

    if ply:IsFrozen() then
        Log(ply:Name() .. " tried to spawn a prop (" .. model .. ") but he's frozen.")
        return false
    end
end)

-- Disable weapons
hook.Add("PlayerSwitchWeapon", "gPhysgun:PlayerWeaponSwitch", function(ply, oldWeapon, newWeapon)
    if not GPHYSGUN.DisableWeaponUse then return end
    Log(ply:Name() .. " tried to get a weapon (" .. newWeapon:GetClass() .. ") but he's frozen.")
    if ply:IsFrozen() then return true end
end)