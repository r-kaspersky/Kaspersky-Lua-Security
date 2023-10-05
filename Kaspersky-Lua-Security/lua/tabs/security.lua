function SecurityTab(parent)
    local panel = vgui.Create("DPanel", parent)
    panel.Paint = function(self, w, h) draw.RoundedBox(4, 0, 0, w, h, Color(255, 255, 255, 255)) end

    -- Добавьте элементы для вкладки "Безопасность" здесь

    return panel
end