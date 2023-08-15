include("virus_database.lua")

local function ScanAddons()
    print("Началась проверка аддонов.")
    
    local addonFolders = file.Find("addons/*", "GAME")
    local suspiciousAddons = {}
    local infectedAddons = {}
    
    for _, folder in ipairs(addonFolders) do
        local addonPath = "addons/" .. folder
        
        if IsAddonInfected(addonPath) then
            table.insert(infectedAddons, addonPath)
        elseif IsAddonInVirusDatabase(addonPath) then
            table.insert(suspiciousAddons, addonPath)
        end
    end
    
    if #infectedAddons > 0 then
        print("Обнаружены вирусы в следующих аддонах:")
        for _, addonPath in ipairs(infectedAddons) do
            print(" - " .. addonPath)
        end
    elseif #suspiciousAddons > 0 then
        print("Обнаружены подозрительные аддоны:")
        for _, addonPath in ipairs(suspiciousAddons) do
            print(" - " .. addonPath)
            ShowWarningMessage()
        end
        print("Возможно, в них содержатся подозрительные коды.")
    else
        print("Все аддоны безопасны. Вы под защитой.")
    end
end

local function IsAddonInfected(addonPath)
    local files = file.Find(addonPath .. "/*", "GAME")
    
    for _, file in ipairs(files) do
        local filePath = addonPath .. "/" .. file
        
        if IsFileInfected(filePath) then
            return true
        end
    end
    
    return false
end

local virusPatterns = {
    "maliciousFunction%(",
    "exploit%(",
    "backdoor%(",
}

local function IsFileInfected(filePath)
    local fileContents = file.Read(filePath, "GAME")
    
    for _, pattern in ipairs(virusPatterns) do
        if string.match(fileContents, pattern) then
            return true
        end
    end
    
    return false
end



local function IsAddonInfected(addonPath)
    local files = file.Find(addonPath .. "/*", "GAME")
    
    for _, file in ipairs(files) do
        local filePath = addonPath .. "/" .. file
        
        if IsFileInfected(filePath) then
            return true
        end
    end
    
    return false
end

local function IsFileInfected(filePath)
    local fileContents = file.Read(filePath, "GAME")
    return false
end



local function IsAddonInVirusDatabase(addonPath)
    local workshopID = GetWorkshopID(addonPath)
    
    for _, virus in ipairs(VirusDatabase) do
        if virus.workshopID == workshopID then
            return true
        end
    end
    
    return false
end

local function GetWorkshopID(addonPath)
    local workshopID = string.match(addonPath, "addons/(%d+)/")
    return workshopID
end

local function FreezeAddon(addonPath)
    local newAddonPath = addonPath .. "_frozen"
    file.Rename(addonPath, newAddonPath)
end

local function ShowWarningMessage(addonName)
    print("Подозрительный аддон обнаружен: " .. addonName)
    print("Рекомендуется удалить его и выполнить проверку системы на наличие вредоносных программ.")
end

ScanAddons()
