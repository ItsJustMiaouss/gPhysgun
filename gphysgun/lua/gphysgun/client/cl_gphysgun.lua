local delay = 0

local function OpenMenu(targetEnt)

    local targetName = targetEnt:Name()
    local targetSteamName = targetEnt:SteamName()
    local targetSteamID = targetEnt:SteamID()

    local Frame = vgui.Create("DFrame")
    Frame:SetSize(320, 200)
    Frame:Center()
    Frame:SetTitle("gPhysgun - " .. targetName)
    Frame:SetVisible(true)
    Frame:SetDraggable(true)
    Frame:MakePopup()

    local NameButton = vgui.Create("DButton", Frame)
    NameButton:SetText("Roleplay Name: [" .. targetName .. "]")
    NameButton:SetPos(10, 30)
    NameButton:SetSize(300, 20)
    NameButton.DoClick = function()
        LocalPlayer():ChatPrint("Roleplay name copied.")
        SetClipboardText(targetName)
        Frame:SetVisible(false)
    end

    local SteamNameButton = vgui.Create("DButton", Frame)
    SteamNameButton:SetText("Steam Name: [" .. targetSteamName .. "]")
    SteamNameButton:SetPos(10, 55)
    SteamNameButton:SetSize(300, 20)
    SteamNameButton.DoClick = function()
        LocalPlayer():ChatPrint("Steam name copied.")
        SetClipboardText(targetSteamName)
        Frame:SetVisible(false)
    end

    local SteamNameButton = vgui.Create("DButton", Frame)
    SteamNameButton:SetText("SteamID: [" .. targetSteamID .. "]")
    SteamNameButton:SetPos(10, 80)
    SteamNameButton:SetSize(300, 20)
    SteamNameButton.DoClick = function()
        LocalPlayer():ChatPrint("SteamID copied.")
        SetClipboardText(targetSteamID)
        Frame:SetVisible(false)
    end

end

hook.Add( "PlayerButtonDown", "gPhysgun:KeyPressed", function( ply, button )
    if button == 15 then -- E button
        local entityTrace = LocalPlayer():GetEyeTrace().Entity

        if entityTrace:IsValid() && entityTrace:IsPlayer() && CurTime() > delay then
            delay = CurTime() + 0.5
            if GPHYSGUN.PhysgunPermission[LocalPlayer():GetUserGroup()] then

                if GPHYSGUN.AccessMenuFrozenOnly then
                    if not entityTrace:IsFrozen() then return end
                end

                if LocalPlayer():GetPos():Distance(entityTrace:GetPos()) <= GPHYSGUN.MenuDistance then
                    OpenMenu(entityTrace)
                    Log("Entity menu opened for " .. LocalPlayer():Name() .. ".")
                end

            end

        end

    end
end)