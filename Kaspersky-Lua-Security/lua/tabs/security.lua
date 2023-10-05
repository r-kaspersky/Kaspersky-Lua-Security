function SecurityTab(parent)
    local panel = vgui.Create("DPanel", parent)
    panel.Paint = function(self, w, h) draw.RoundedBox(4, 0, 0, w, h, Color(255, 255, 255, 255)) end

    -- Добавлю потом элементы

    return panel
end
