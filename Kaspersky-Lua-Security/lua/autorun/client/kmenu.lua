include("tabs/home.lua")
include("tabs/security.lua")
include("tabs/account.lua")

local function KasperskyMenu()
    local frame = vgui.Create("DFrame")
    frame:SetSize(1000, 600)
    frame:Center()
    frame:SetTitle("[Kaspersky] Lua Security")
    frame:MakePopup()
    frame.Paint = function(self, w, h) draw.RoundedBox(0, 0, 0, w, h, Color(1, 1, 35)) end

    local sheet = vgui.Create("DPropertySheet", frame)
    sheet:Dock(FILL)

    local homePanel = HomeTab(sheet)
    sheet:AddSheet("Главная", homePanel, "icon16/house.png")

    local securityPanel = SecurityTab(sheet)
    sheet:AddSheet("Безопасность", securityPanel, "icon16/shield.png")

    local accountPanel = AccountTab(sheet)
    sheet:AddSheet("Аккаунт", accountPanel, "icon16/user.png")
end

concommand.Add("kas_menu", KasperskyMenu)