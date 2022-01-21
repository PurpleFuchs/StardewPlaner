local MouseHandling = {}

local function CheckHover(Position,ButtonSize,MouseTable)

	if (MouseTable.x > Position.x and MouseTable.x < Position.x + ButtonSize.x and MouseTable.y > Position.y and MouseTable.y < Position.y + ButtonSize.y) then

		return true
	else
		return false
	end
end

function MouseHandling.MakeMouseTable()

	local Mouse = { x = 0 , y = 0}

	Mouse.x, Mouse.y = love.mouse.getPosition()

	local MouseLeft = false
	if (love.mouse.isDown(1)) then MouseLeft = true end

	local MouseRight = false
	if (love.mouse.isDown(2)) then MouseRight = true end

	local MouseWheel = false
	if (love.mouse.isDown(3)) then MouseWheel = true end

	local MouseThumb = false
	if (love.mouse.isDown(4)) then MouseThumb = true end


	local MouseTable = { x = Mouse.x ,
		y = Mouse.y ,
		MouseLeft = MouseLeft ,
		MouseRight = MouseRight ,
		MouseWheel = MouseWheel ,
		MouseThumb = MouseThumb }

	return MouseTable
end

function MouseHandling.CheckClickAndHover(Position,ButtonSize)

	local MouseTable = MouseHandling.MakeMouseTable()

	local Hover = CheckHover(Position,ButtonSize,MouseTable)

	local Click = false

	if Hover and MouseTable.MouseLeft then

		Click = true
	end

	return Click , Hover	
end

return MouseHandling