function AccountTab(parent)
    local panel = vgui.Create("DPanel", parent)
    panel.Paint = function(self, w, h) draw.RoundedBox(4, 0, 0, w, h, Color(255, 255, 255, 255)) end

    local avatarBackground = vgui.Create("DPanel", panel)
    avatarBackground:SetSize(108, 108)
    avatarBackground:SetPos(6, 6)
    avatarBackground.Paint = function(self, w, h)
        draw.RoundedBox(4, 0, 0, w, h, Color(1, 1, 35)) 
    end

    local avatar = vgui.Create("AvatarImage", panel)
    avatar:SetSize(100, 100)
    avatar:SetPos(10, 10) 
    avatar:SetPlayer(LocalPlayer(), 64)

    local nickname = vgui.Create("DLabel", panel)
    nickname:SetPos(120, 10)
    nickname:SetSize(300, 20)
	nickname:SetTextColor(Color(0, 0, 0))
    nickname:SetFont("GModNotify")
    nickname:SetText(LocalPlayer():Nick())

    local subscription = vgui.Create("DLabel", panel)
    subscription:SetPos(120, 40)
    subscription:SetSize(300, 20)
    subscription:SetFont("GModNotify")
    subscription:SetTextColor(Color(0, 0, 0))

    if file.Exists("subscription.txt", "DATA") then
        local playerData = util.JSONToTable(file.Read("subscription.txt", "DATA"))
        if playerData.steamID == LocalPlayer():SteamID() then
            subscription:SetText("Подписка: " .. playerData.subscription)
        else
            subscription:SetText("Подписка: Нету подписки.")
        end
    else
        subscription:SetText("Подписка: Нету подписки.")
    end

    subscription:SetWrap()
    subscription:SetAutoStretchVertical(true)

    local activateButton = vgui.Create("DButton", panel)
    activateButton:SetPos(120, 100)
    activateButton:SetSize(190, 20)
    activateButton:SetText("Активировать пробную подписку")
    activateButton.Paint = function(self, w, h)
        local col = Color(0, 0, 0)

        if self:IsHovered() then
            col = Color(50, 50, 50)
        elseif self:IsDown() then
            col = Color(100, 100, 100)
        elseif self:GetText() == "Пробная подписка активирована!" then
            col = Color(255, 0, 0)
        end

        draw.RoundedBox(4, 0, 0, w, h, col)
        draw.RoundedBox(4, 1, 1, w-2, h-2, Color(0, 255, 0, 255))
        draw.RoundedBox(4, 2, 2, w-4, h-4, Color(255, 255, 255, 255))
    end
    activateButton.DoClick = function() 
        if activateButton:GetText() == "Пробная подписка активирована!" then
            chat.AddText(Color(255, 0, 0), "[Kaspersky]: ", Color(255, 255, 255), "Вы уже активировали пробную подписку!")
        else
            subscription:SetText("Подписка: Kaspersky Free")
            local playerData = {
                name = LocalPlayer():Nick(),
                steamID = LocalPlayer():SteamID(),
                subscription = "Kaspersky Free",
                expiryDate = os.date("%x", os.time() + 7*24*60*60)
            }
            file.Write("subscription.txt", util.TableToJSON(playerData))
            activateButton:SetText("Пробная подписка активирована!")
            chat.AddText(Color(0, 255, 0), "[Kaspersky]: ", Color(255, 255, 255), "Спасибо что вы активировали подписку.")
        end
    end

    if file.Exists("subscription.txt", "DATA") then
        local playerData = util.JSONToTable(file.Read("subscription.txt", "DATA"))
        if playerData.steamID == LocalPlayer():SteamID() then
            activateButton:SetText("Пробная подписка активирована!")
        end
    end
	
    return panel
end