local Theme = require "Source/GuiThemes/TheNewBlack"

local FontName = Theme.FontName

local GuiFont = {
	Small = love.graphics.newFont("GuiThemes/" .. FontName .. ".ttf",12),
	Normal = love.graphics.newFont("GuiThemes/" .. FontName .. ".ttf",24),
	Big = love.graphics.newFont("GuiThemes/" .. FontName .. ".ttf",36),
	Basic = love.graphics.newFont(12)
}

local GuiConfig = {
	GuiFont = GuiFont ,
	TextColor = Theme.TextColor ,
	BorderColor = Theme.BorderColor ,
	HoverColor = Theme.HoverColor ,
	WindowColor = Theme.WindowColor ,
	IconButton = {
		Size = {
			x = 40 ,
			y = 40
		} ,
		DistanceToBorder = 4 ,
		BorderThickness = 3
	} ,
	BuildModePanel = {
		Height = 80
	} ,
	BuildingInfo = {
		Size = {
			x = 350 ,
			y = 150
		} ,
		MaxHeight = 200
	} ,
	Header = {
		Size = {
			x = 320 ,
			y = 120
		}
	} ,
	RecepieButton = {
		Size = {
			x = 240 ,
			y = 100
		}
	} ,
	PanelTab = {
		Size = {
			x = 144 ,
			y = 48
		} ,
	} ,
	SmallHeader = {
		Size = {
			x = 160 ,
			y = 44
		}
	} ,
	TinyHeader = {
		Size = {
			x = 100 ,
			y = 26
		}
	} ,
	TextField = {
		Size = {
			x = 130 ,
			y = 30
		}
	} ,
	SmallGuiButton = {
		Size = {
			x = 80 ,
			y = 26
		}
	} ,
	GuiButton = {
		Size = {
			x = 120 ,
			y = 44
		}
	} ,
	BigGuiButton = {
		Size = {
			x = 240 ,
			y = 64
		}
	} ,
	WideGuiButton = {
		Size = {
			x = 180 ,
			y = 44
		}
	} ,
	SaveSlot = {
		Size = {
			x = 600,
			y = 120
		} ,
		Distance = 6
	} ,
	Window = {
		BorderThickness = 6
	} ,
	DetailWindow = {
		Width = 144 ,
		BorderThickness = 4
	} ,
	ToolTip = {
		BorderThickness = 4 ,
		RowDistance = 12 ,
		TextOffset = {
			x = 10,
			y = 10
		} ,
	} ,
	RotateMirrorWindowText = "R to Rotate , T to Mirror" ,
}

return GuiConfig