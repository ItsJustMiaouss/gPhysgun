GPHYSGUN = GPHYSGUN or {}

-- Enable/Disable print debbuging messages (clients can also see some messages)
GPHYSGUN.Debug = true

-- Groups that have the permission to use Physgun Freeze
GPHYSGUN.PhysgunPermission = {
    ["superadmin"] = true,
    ["admin"] = true,
    ["moderator"] = true,
}

-- Enable/Disable freezing other administrators (listed above)
GPHYSGUN.AdminInteractOthers = true

-- Enable/Disable fall damages when player falls
GPHYSGUN.DisableFallDamages = true

-- Enable/Disable spawning prop while player is frozen
GPHYSGUN.DisableSpawningProps = true

-- Enable/Disable weapons while player is frozen
GPHYSGUN.DisableWeaponUse = true

-- Enable/Disable menu for frozen players only
GPHYSGUN.AccessMenuFrozenOnly = false

-- Distance between admin and player to open the menu (Default: 80; Recommended: 50 - 90)
GPHYSGUN.MenuDistance = 80

-------------------------------------------------------------------------------------------------------------------
-- END OF THE CONFIGURATION FILE
-------------------------------------------------------------------------------------------------------------------

function Log(msg)
    if not GPHYSGUN.Debug then return end
    print("[gPhysgun] " ..msg)
end