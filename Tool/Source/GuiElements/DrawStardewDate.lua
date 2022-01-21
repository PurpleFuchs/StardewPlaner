local DrawText = require ("Source.GuiElements.DrawText")
local DrawWindow = require ("Source.GuiElements.DrawWindow")
local GuiConfig = require ("Source.GuiConfig")
local DrawArrowButton = require ("Source.GuiElements.DrawArrowButton")

-- Config

local WindowSize = {
	x = 240 ,
	y = 290
}
local TextOffset = 20
local ButtonSize = 32
local Font = GuiConfig.GuiFont.Big
local ButtonBlockTime = 0.4
local MaxDate = 112
local IconSize = {
	x = 48 ,
	y = 32
}
local IconZoom = 3
local Angle = 0

-- Setup
local BlockTimer = 0
local LastTimerUpdate = love.timer.getTime()
local LastSeason
local Icon

-- local Functions

local function ButtonNotBlocked()
	
	if BlockTimer > ButtonBlockTime then
		return true
	end
end

local function UpdateBlockTimer(BlockTimer)

	BlockTimer = BlockTimer + (love.timer.getTime() - LastTimerUpdate)
	LastTimerUpdate = love.timer.getTime()

	return BlockTimer
end

-- Main Function

local function DrawStardewDate(Date,WindowPosition)

	BlockTimer = UpdateBlockTimer(BlockTimer)

	local function GetDate(Date)

		if not Date then
			return 1
		end

		return Date
	end

	Date = GetDate(Date)

	-- Draw Window

	DrawWindow(WindowPosition,WindowSize)
	-- Draw Date

	-- Draw Line 1

	local function GetTextDate(Date)

		local function GetDay(Date)

			local Day = Date

			while Day > 28 do
				Day = Day - 28
			end

			return Day
		end

		local function GetWeekDay(Date)

			local WeekDay = Date

			while WeekDay > 7 do

				WeekDay = WeekDay - 7
			end

			if WeekDay == 1 then
				return "Monday"
			elseif WeekDay == 2 then
				return "Tuesday"
			elseif WeekDay == 3 then
				return "Wednesday"
			elseif WeekDay == 4 then
				return "Thursday"
			elseif WeekDay == 5 then
				return "Friday"
			elseif WeekDay == 6 then
				return "Saturday"
			elseif WeekDay == 7 then
				return "Sunday"
			end
		end

		local function GetSeason(Date)

			local Season = 1
			local Day = Date

			while Day > 28 do

				Day = Day - 28
				Season = Season + 1
			end

			if Season == 1 then
				return "Spring"
			elseif Season == 2 then
				return "Summer"
			elseif Season == 3 then
				return "Fall"
			elseif Season == 4 then
				return "Winter"
			end
		end

		return {
			Day = GetDay(Date) ,
			WeekDay = GetWeekDay(Date) ,
			Season = GetSeason(Date)
		}
	end

	local TextDate = GetTextDate(Date)

	local function GetText(TextDate)

		local Text = {}

		Text[1] = TextDate.Season .. " " .. TextDate.Day

		return Text
	end

	local Text = GetText(TextDate)

	local function GetTextPosition(WindowPosition,WindowSize,Text)

		local TextLength = Font:getWidth(Text[1])

		local X = WindowPosition.x + WindowSize.x/2 - TextLength/2
		local Y = WindowPosition.y + TextOffset*2 + IconSize.y*IconZoom

		return {x = X,y = Y}
	end

	local TextPosition = GetTextPosition(WindowPosition,WindowSize,Text)

	DrawText(Text,TextPosition,Font)

	-- Draw Line 2

	Text[1] = TextDate.WeekDay

	local function GetTextPosition(WindowPosition,WindowSize,Text)

		local TextLength = Font:getWidth(Text[1])

		local X = WindowPosition.x + WindowSize.x/2 - TextLength/2
		local Y = WindowPosition.y + TextOffset*2 + IconSize.y*IconZoom + Font:getHeight()

		return {x = X,y = Y}
	end

	local TextPosition = GetTextPosition(WindowPosition,WindowSize,Text)

	DrawText(Text,TextPosition,Font)

	-- Draw Icon

	local function UpdateIcon(Season)

		if Season == LastSeason then
			return Icon
		end

		local Path = "Tiles/Seasons/" .. Season .. ".png"
		LastSeason = Season
		Icon = love.graphics.newImage(Path)
	end

	UpdateIcon(TextDate.Season)

	local function DrawIcon(Position)

		love.graphics.draw(Icon,Position.x,Position.y,Angle,IconZoom,IconZoom)
	end

	local function GetIconPosition(WindowPosition,WindowSize)
		
		local X = WindowPosition.x + WindowSize.x/2 - (IconSize.x*IconZoom)/2
		local Y = WindowPosition.y + TextOffset

		return {x = X,y = Y}
	end

	local IconPosition = GetIconPosition(WindowPosition,WindowSize)

	DrawIcon(IconPosition)

	-- Draw Buttons

	-- Draw Green Arrows

	local function GetLeftArrowPosition(WindowPosition,WindowSize)

		local X = WindowPosition.x + TextOffset
		local Y = WindowPosition.y + WindowSize.y - TextOffset - ButtonSize

		return {x = X,y = Y}
	end

	local LeftArrowPosition = GetLeftArrowPosition(WindowPosition,WindowSize)

	if DrawArrowButton(LeftArrowPosition,"Left","Green") == "Left" and ButtonNotBlocked() then
		Date = Date - 1
		if Date <= 0 then
			Date = MaxDate
		end

		BlockTimer = 0
	end


	local function GetRightArrowPosition(WindowPosition,WindowSize)

		local X = WindowPosition.x + WindowSize.x - TextOffset - ButtonSize
		local Y = WindowPosition.y + WindowSize.y - TextOffset - ButtonSize

		return {x = X,y = Y}
	end

	local RightArrowPosition = GetRightArrowPosition(WindowPosition,WindowSize)

	if DrawArrowButton(RightArrowPosition,"Right","Green") == "Left" and ButtonNotBlocked() then

		Date = Date + 1
		if Date > MaxDate then
			Date = 1
		end

		BlockTimer = 0
	end

	-- Draw Red Arrows

	LeftArrowPosition.x = LeftArrowPosition.x + ButtonSize + TextOffset

	if DrawArrowButton(LeftArrowPosition,"Left","Red") == "Left" and ButtonNotBlocked() then
		Date = Date - 28
		if Date < 1 then
			Date = Date + MaxDate
		end

		BlockTimer = 0
	end

	RightArrowPosition.x = RightArrowPosition.x - ButtonSize - TextOffset

	if DrawArrowButton(RightArrowPosition,"Right","Red") == "Left" and ButtonNotBlocked() then

		Date = Date + 28
		if Date > MaxDate then
			Date = Date - MaxDate
		end

		BlockTimer = 0
	end

	return Date , TextDate
end

return DrawStardewDate