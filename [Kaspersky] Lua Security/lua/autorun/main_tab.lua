local PANEL = {}

function PANEL:Init()
    self.label = vgui.Create("DLabel", self)
    self.label:SetText("Это вкладка Основное")
    self.label:Dock(TOP)
    self.label:DockMargin(10, 10, 10, 10)
end

vgui.Register("MainTab", PANEL, "DPanel")
