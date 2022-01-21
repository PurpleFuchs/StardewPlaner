local DrawButton = require ("Source.GuiElements.DrawButton")

local Images = {
	Green = {
		Down = love.graphics.newImage("Tiles/Gui/GreenArrowDown.png") ,
		Left = love.graphics.newImage("Tiles/Gui/GreenArrowLeft.png") ,
		Up = love.graphics.newImage("Tiles/Gui/GreenArrowUp.png") ,
		Right = love.graphics.newImage("Tiles/Gui/GreenArrowRight.png")

	} ,
	Red = {
		Down = love.graphics.newImage("Tiles/Gui/RedArrowDown.png") ,
		Left = love.graphics.newImage("Tiles/Gui/RedArrowLeft.png") ,
		Up = love.graphics.newImage("Tiles/Gui/RedArrowUp.png") ,
		Right = love.graphics.newImage("Tiles/Gui/RedArrowRight.png")
	}
}

local BorderThickness = 3
local ButtonSize = {x = 32 , y = 32}
local ArrowOffset = {x = 4 , y = 4}

local function DrawArrowButton(Position,Direction,Color)

	local function InputContract(Position,Direction)

		assert(Position)
		assert(type(Position) == "table")
		assert(Position.x)
		assert(type(Position.x) == "number")
		assert(Position.y)
		assert(type(Position.y) == "number")
		assert(Direction)
		assert(type(Direction) == "string")

	end

	InputContract(Position,Direction)

	-- Draw Button

	local function GetChanges()

		return {BorderThickness = BorderThickness}
	end

	local Changes = GetChanges()

	local ReturnValue = DrawButton(Position,ButtonSize,Changes)

	-- Draw Arrow

	if not Color then
		Color = "Green"
	end

	local function GetArrowPosition(Position)

		local X = Position.x + ArrowOffset.x
		local Y = Position.y + ArrowOffset.y

		return {x = X,y = Y}
	end

	local ArrowPosition = GetArrowPosition(Position)

	local function GetArrow(Color,Direction)

		return Images[Color][Direction]
	end

	local Arrow = GetArrow(Color,Direction)

	love.graphics.draw(Arrow,ArrowPosition.x,ArrowPosition.y)

	return ReturnValue
end

return DrawArrowButton