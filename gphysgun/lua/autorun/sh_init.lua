if SERVER then

    MsgC(Color(0, 255, 0), "[gPhysgun] ", Color(255, 255, 255), "Initializing files...\n")
    
    -- ADDCSLuaFile Client
    AddCSLuaFile("gphysgun/client/cl_gphysgun.lua")
    AddCSLuaFile("gphysgun/sh_config.lua")
    -- Include Server
    include("gphysgun/server/sv_gphysgun.lua")
    include("gphysgun/sh_config.lua")
end

if CLIENT then
    -- Include Client
    include("gphysgun/client/cl_gphysgun.lua")
    include("gphysgun/sh_config.lua")
end