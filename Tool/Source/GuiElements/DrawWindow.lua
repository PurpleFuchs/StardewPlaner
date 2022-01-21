local GuiConfig = require ("Source.GuiConfig")

-- Config
local Default = {
	BorderThickness = GuiConfig.Window.BorderThickness ,
	BorderColor = GuiConfig.BorderColor ,
	WindowColor = GuiConfig.WindowColor
}
local DefaultColor = {R = 1,G = 1,B = 1}

-- Setup
local BorderThickness = Default.BorderThickness
local BorderColor = Default.BorderColor
local WindowColor = Default.WindowColor

local function ChangeColor(Color)

	love.graphics.setColor(Color.R,Color.G,Color.B)
end

local function DrawWindow(Position,Size,Changes)

	assert(Position)
	assert(Position.x)
	assert(Position.y)
	assert(Size)
	assert(Size.x)
	assert(Size.y)

	local function ApplyChanges(Changes)

		if Changes and Changes.BorderThickness then
			BorderThickness = Changes.BorderThickness
		else
			BorderThickness = Default.BorderThickness
		end

		if Changes and Changes.WindowColor then
			WindowColor = Changes.WindowColor
		else
			WindowColor = Default.WindowColor
		end

		if Changes and Changes.BorderColor then
			BorderColor = Changes.BorderColor
		else
			BorderColor = Default.BorderColor
		end
	end

	ApplyChanges(Changes)

	-- Draw Border

	local function DrawBorder(Position,Size)

		local function DrawTopBorder(Position,Size)

			local X = Position.x
			local Y = Position.y
			local Width = Size.x
			local Height = BorderThickness

			love.graphics.rectangle("fill",X,Y,Width,Height)
		end

		local function DrawBottomBorder(Position,Size)

			local X = Position.x
			local Y = Position.y + Size.y - BorderThickness
			local Width = Size.x
			local Height = BorderThickness

			love.graphics.rectangle("fill",X,Y,Width,Height)
		end

		local function DrawLeftBorder(Position,Size)

			local X = Position.x 
			local Y = Position.y + BorderThickness
			local Width = BorderThickness
			local Height = Size.y - BorderThickness*2

			love.graphics.rectangle("fill",X,Y,Width,Height)
		end

		local function DrawRightBorder(Position,Size)

			local X = Position.x + Size.x - BorderThickness
			local Y = Position.y + BorderThickness
			local Width = BorderThickness
			local Height = Size.y - BorderThickness*2

			love.graphics.rectangle("fill",X,Y,Width,Height)
		end

		ChangeColor(BorderColor)
		DrawTopBorder(Position,Size)
		DrawBottomBorder(Position,Size)
		DrawLeftBorder(Position,Size)
		DrawRightBorder(Position,Size)
	end

	DrawBorder(Position,Size)

	-- Draw Area

	local function DrawArea(Position,Size)

		local X = Position.x + BorderThickness
		local Y = Position.y + BorderThickness
		local Width = Size.x - BorderThickness*2
		local Height = Size.y - BorderThickness*2

		love.graphics.rectangle("fill",X,Y,Width,Height)
	end

	ChangeColor(WindowColor)
	DrawArea(Position,Size)
	ChangeColor(DefaultColor)
end

return DrawWindow