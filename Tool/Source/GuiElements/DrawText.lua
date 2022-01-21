local GuiConfig = require ("Source.GuiConfig")

-- Config
local TextColor = GuiConfig.TextColor
local DefaultColor = {R = 1,G = 1,B = 1}
local DistanceBetweenRows = 6

-- Setup
local GuiFont = GuiConfig.GuiFont.Normal
local BasicFont = GuiConfig.GuiFont.Basic

local function DrawText(Text,Position,Font,Color)

	assert(Text)
	assert(Text[1])
	assert(Position)
	assert(Position.x)
	assert(Position.y)

	if Font then
		GuiFont = Font
	end

	if Color then
		TextColor = Color
	end

	local function ChangeColor(Color)

		love.graphics.setColor(Color.R,Color.G,Color.B)
	end

	local function ChangeFont(Font)

		love.graphics.setFont(Font)
	end

	local function DrawLineOfText(Text,Position)

		love.graphics.print(Text,Position.x,Position.y)
	end

	local Index = 1

	ChangeColor(TextColor)
	ChangeFont(GuiFont)

	local FontSize = GuiFont:getHeight()

	while Text[Index] do

		DrawLineOfText(Text[Index],Position)
		Position.y = Position.y + FontSize + DistanceBetweenRows
		Index = Index + 1
	end

	ChangeColor(DefaultColor)
	ChangeFont(BasicFont)
end

return DrawText