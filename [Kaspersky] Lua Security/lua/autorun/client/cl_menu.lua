local function CreateMenu()
    local frame = vgui.Create("DFrame")
    frame:SetSize(400, 300)
    frame:Center()
    frame:SetTitle("Меню")
    frame:MakePopup()

    local propertySheet = vgui.Create("DPropertySheet", frame)
    propertySheet:Dock(FILL)

    local mainTab = vgui.Create("MainTab", propertySheet)
    propertySheet:AddSheet("Основное", mainTab)

    local versionTab = vgui.Create("VersionTab", propertySheet)
    propertySheet:AddSheet("Версия", versionTab)
end

hook.Add("Initialize", "OpenMenu", CreateMenu)
