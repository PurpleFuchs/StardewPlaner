local DrawButton = require ("Source.GuiElements.DrawButton")
local DrawText = require ("Source.GuiElements.DrawText")
local GuiConfig = require ("Source.GuiConfig")

-- Config
local DefaultBorderThickness = GuiConfig.BorderThickness
local TextColor = GuiConfig.TextColor

-- Setup
local BasicFont = GuiConfig.GuiFont.Basic

local function DrawTextButton(Text,Size,Position,Font,BorderThickness)

	assert(Text)
	assert(Size)
	assert(Size.x)
	assert(Size.y)
	assert(Position)
	assert(Position.x)
	assert(Position.y)

	local function GetFont(Font)

		if Font then
			return Font
		else
			return BasicFont
		end
	end

	Font = GetFont(Font)

	local function GetChanges()

		return {
			BorderThickness = BorderThickness
		}
	end

	local Changes = GetChanges()

	local function GetTextPosition(Text,Size,Position,Font)

		local TextWidth = Font:getWidth(Text)
		local TextHeight = Font:getHeight()

		local ButtonCenter = {
			x = Position.x + (Size.x/2) ,
			y = Position.y + (Size.y/2)
		}

		local TextPosition = {
			x = ButtonCenter.x - (TextWidth/2) ,
			y = ButtonCenter.y - (TextHeight/2)
		}

		return TextPosition
	end

	local TextPosition = GetTextPosition(Text,Size,Position,Font)

	local function GetText(Text)

		return {
			[1] = Text
		}
	end

	Text = GetText(Text)

	-- Draw Button

	local ReturnValue = DrawButton(Position,Size,Changes)

	-- Draw Text

	DrawText(Text,TextPosition,Font,TextColor)

	return ReturnValue
end

return DrawTextButton