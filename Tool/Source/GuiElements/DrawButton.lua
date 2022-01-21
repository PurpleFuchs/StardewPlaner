local MouseHandling = require ("Source.Libarys.MouseHandling")
local DrawWindow = require ("Source.GuiElements.DrawWindow")
local GuiConfig = require ("Source.GuiConfig")

local HoverColor = GuiConfig.HoverColor
local WindowColor = GuiConfig.WindowColor

local function DrawButton(Position,Size,Changes)

	assert(Position)
	assert(Position.x)
	assert(Position.y)
	assert(Size)
	assert(Size.x)
	assert(Size.y)

	local function GetMouseTable()

		return MouseHandling.MakeMouseTable()
	end

	local MouseTable = GetMouseTable()

	local function MouseOverButton(MouseTable,Position,Size)

		if MouseTable.x >= Position.x and MouseTable.x <= Position.x + Size.x and MouseTable.y >= Position.y and MouseTable.y <= Position.y + Size.y then

			return true
		end
	end

	local function HandleClick(MouseTable)

		if MouseTable.MouseLeft then

			return "Left"
		elseif MouseTable.MouseRight then

			return "Right"
		end
	end

	local function GetChanges(Changes)

		if not Changes then
			Changes = {}
		end

		Changes.WindowColor = HoverColor

		return Changes
	end

	local function KeepColor(Changes)

		if not Changes then
			Changes = {}
		end

		Changes.WindowColor = WindowColor

		return Changes
	end

	if MouseOverButton(MouseTable,Position,Size) then

		local Changes = GetChanges(Changes)
		DrawWindow(Position,Size,Changes)

		local ReturnValue = HandleClick(MouseTable)

		if ReturnValue then
			return ReturnValue
		else
			return "Hover"
		end
	else
		local Changes = KeepColor(Changes)
		DrawWindow(Position,Size,Changes)
	end
end

return DrawButton