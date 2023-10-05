function ServerMonitoringTab(parent)
    local panel = vgui.Create("DPanel", parent)
    panel.Paint = function(self, w, h) draw.RoundedBox(4, 0, 0, w, h, Color(255, 255, 255, 255)) end

    local serverName = vgui.Create("DLabel", panel)
    serverName:SetPos(10, 10)
    serverName:SetSize(300, 20)
    serverName:SetFont("GModNotify")
    serverName:SetTextColor(Color(0, 0, 0))
    serverName:SetText("Название сервера: " .. GetServerName())

    local playerCount = vgui.Create("DLabel", panel)
    playerCount:SetPos(10, 40)
    playerCount:SetSize(300, 20)
    playerCount:SetFont("GModNotify")
    playerCount:SetTextColor(Color(0, 0, 0))
    playerCount:SetText("Количество Людей: " .. #player.GetAll())

    local scriptToggle = vgui.Create("DCheckBox", panel)
    scriptToggle:SetPos(10, 70)
    scriptToggle:SetValue(0)
    scriptToggle.OnChange = function(self, val)
        if val then
            RunConsoleCommand("lua_run", "your_script_here") -- Замените "your_script_here" на ваш скрипт
        else
    end

    if file.Exists("subscription.txt", "DATA") then
        local playerData = util.JSONToTable(file.Read("subscription.txt", "DATA"))
        if playerData.steamID == LocalPlayer():SteamID() then
            scriptToggle:SetEnabled(true)
        else
            scriptToggle:SetEnabled(false)
        end
    else
        scriptToggle:SetEnabled(false)
    end

    return panel
end