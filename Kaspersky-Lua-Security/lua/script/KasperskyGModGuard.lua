local blacklistedAddons = {{
    ["AddonName1"] = {
        url = "http://example.com/addon1",
        reason = "Reason for blacklisting AddonName1"
    }},
    ["AddonName2"] = {
        url = "http://example.com/addon2",
        reason = "Reason for blacklisting AddonName2"
    },
}

local function checkPlayerAddons(ply)
    local found = false
    for _, addon in ipairs(engine.GetAddons()) do
        local info = blacklistedAddons[addon.title]
        if info then
            ply:ChatPrint("\n[Kaspersky]: Вы скачали запрещенный аддон " .. addon.title .. "! Пожалуйста удалите его. Причина добавление: " .. info.reason .. ".\n")
            found = true
        end
    end
    if not found then
    end
end

hook.Add("PlayerInitialSpawn", "CheckBlacklistedAddons", checkPlayerAddons)