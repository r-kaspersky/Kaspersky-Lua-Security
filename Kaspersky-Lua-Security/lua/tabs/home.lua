surface.CreateFont("KasperFonts", {
    font = "Arial",
    size = 21,
    weight = 20,
    antialias = true,
})

function HomeTab(parent)
    local panel = vgui.Create("DPanel", parent)
    panel.Paint = function(self, w, h) draw.RoundedBox(4, 0, 0, w, h, Color(255, 255, 255, 255)) end

    local iconKas = vgui.Create("DImage", panel)
    iconKas:SetSize(130, 130)
    iconKas:SetPos(-2, 5)
    iconKas:SetImage("materials/icon/icon.png")

	local title = vgui.Create("DLabel", panel)
	title:SetPos(160, 20)
	title:SetText("Вы под защитой")
	title:SetFont("DermaLarge")
	title:SetTextColor(Color(0, 0, 0))
	title:SizeToContents()

    local status = vgui.Create("DLabel", panel)
    status:SetPos(160, 50)
    status:SetText("Основные компоненты защиты работают")
    status:SetFont("GModNotify")
	status:SetTextColor(Color(0, 0, 0))
    status:SizeToContents()
	
    local base = vgui.Create("DLabel", panel)
    base:SetPos(160, 70)
    base:SetText("Базы актуальны")
    base:SetFont("GModNotify")
    base:SetTextColor(Color(0, 0, 0))
    base:SizeToContents()
	
    local dot = vgui.Create("DPanel", panel)
    dot:SetSize(10, 10)
    dot:SetPos(148, 55)
    dot.Paint = function(self, w, h)
        draw.RoundedBox(50, 0, 0, w, h, Color(0, 255, 0))
    end
	
    local dots = vgui.Create("DPanel", panel)
    dots:SetSize(10, 10)
    dots:SetPos(148, 75)
    dots.Paint = function(self, w, h)
        draw.RoundedBox(50, 0, 0, w, h, Color(0, 255, 0))
    end
    
    local button = vgui.Create("DButton", panel)
    button:SetSize(200, 50)
    button:SetPos(160, 100)
    button:SetText("Быстрая проверка")
    button:SetFont("KasperFonts")
    button:SetTextColor(Color(0, 0, 0))

    local button = vgui.Create("DButton", panel)
    button:SetSize(200, 50)
    button:SetPos(160, 100)
    button:SetText("Быстрая проверка")
    button:SetFont("KasperFonts")
    button:SetTextColor(Color(0, 0, 0))

    button.Paint = function(self, w, h)
        local col = Color(0, 0, 0)

        if self:IsHovered() then
            col = Color(50, 50, 50)
        elseif self:IsDown() then
            col = Color(100, 100, 100)
        end

        draw.RoundedBox(4, 0, 0, w, h, col)
        draw.RoundedBox(4, 1, 1, w-2, h-2, Color(0, 255, 0, 255))
        draw.RoundedBox(4, 2, 2, w-4, h-4, Color(255, 255, 255, 255))
    end

    local KasTimes = {}

    button.DoClick = function()
        local ply = LocalPlayer()
        local curTime = os.time()

        local KasTime = file.Read("KasperskyTime.txt", "DATA")
        if KasTime and curTime - tonumber(KasTime) < 1800 then
            chat.AddText(Color(255, 255, 0), "[Kaspersky]: ", Color(255, 255, 255), "Вы уже выполнили эту команду! Пожалуйста повторите через 30 минут.")
        else
            local fileContent = file.Read("script/KasperskyGModGuard.lua", "LUA")
            if fileContent then
                RunString(fileContent)
                chat.AddText(Color(0, 255, 0), "[Kaspersky]: ", Color(255, 255, 255), "Началась проверка файлов!")
            else
                chat.AddText(Color(255, 0, 0), "[Kaspersky]: ", Color(255, 255, 255), "Файл KasperskyGModGuard.lua не найден! Проверки файлов не будет!")
            end
            file.Write("KasperskyTime.txt", tostring(curTime))
        end
    end
    
	if KasTime and curTime - tonumber(KasTime) >= 1800 then
        file.Delete("KasperskyTime.txt")
    end

    local buttonImage = vgui.Create("DImage", button)
    buttonImage:SetSize(20, 20)
    buttonImage:SetPos(6, 15)
    buttonImage:SetImage("materials/icon/check.png")
    
	local button2 = vgui.Create("DButton", panel)
    button2:SetSize(320, 50)
    button2:SetPos(369, 100)
    button2:SetText("Найти, как ускорить компьютер")
    button2:SetFont("KasperFonts")
    button2:SetTextColor(Color(0, 0, 0))

    button2.Paint = function(self, w, h)
        local col = Color(0, 0, 0)

        if self:IsHovered() then
            col = Color(50, 50, 50)
        elseif self:IsDown() then
            col = Color(100, 100, 100)
        end

        draw.RoundedBox(4, 0, 0, w, h, col)
        draw.RoundedBox(4, 1, 1, w-2, h-2, Color(0, 255, 0, 255))
        draw.RoundedBox(4, 2, 2, w-4, h-4, Color(255, 255, 255, 255))
    end
    
	local buttonImage2 = vgui.Create("DImage", button2)
    buttonImage2:SetSize(20, 20)
    buttonImage2:SetPos(10, 15)
    buttonImage2:SetImage("materials/icon/secons.png")
	
	local button3 = vgui.Create("DButton", panel)
    button3:SetSize(320, 50)
    button3:SetPos(260, 160)
    button3:SetText("Мониторинг умного сервера")
    button3:SetFont("KasperFonts")
    button3:SetTextColor(Color(0, 0, 0))

    button3.Paint = function(self, w, h)
        local col = Color(0, 0, 0)

        if self:IsHovered() then
            col = Color(50, 50, 50)
        elseif self:IsDown() then
            col = Color(100, 100, 100)
        end

        draw.RoundedBox(4, 0, 0, w, h, col)
        draw.RoundedBox(4, 1, 1, w-2, h-2, Color(0, 255, 0, 255))
        draw.RoundedBox(4, 2, 2, w-4, h-4, Color(255, 255, 255, 255))
    end
    
	local KasTimesMon = {}

    button3.DoClick = function()
        local ply = LocalPlayer()
        local curTime = os.time()
		
        local KasTimeMon = file.Read("KasperskyTimeMon.txt", "DATA")
        if KasTimeMon and curTime - tonumber(KasTimeMon) < 1800 then
            chat.AddText(Color(255, 255, 0), "[Kaspersky]: ", Color(255, 255, 255), "Вы уже выполнили эту команду! Пожалуйста повторите через 30 минут.")
        else
            local fileContent = file.Read("script/KasperskyMonitoring.lua", "LUA")
            if fileContent then
                RunString(fileContent)
                chat.AddText(Color(0, 255, 0), "[Kaspersky]: ", Color(255, 255, 255), "Открываю меню!")
            else
                chat.AddText(Color(255, 0, 0), "[Kaspersky]: ", Color(255, 255, 255), "Файл KasperskyMonitoring.lua не найден! Проверки файлов не будет!")
            end
            file.Write("KasperskyTimeMon.txt", tostring(curTime))
        end
    end
    
	if KasTimeMon and curTime - tonumber(KasTimeMon) >= 1800 then
        file.Delete("KasperskyTimeMon.txt")
    end
	
	local buttonImage3 = vgui.Create("DImage", button3)
    buttonImage3:SetSize(40, 40)
    buttonImage3:SetPos(10, 5)
    buttonImage3:SetImage("materials/icon/server.png")
	
    return panel
end