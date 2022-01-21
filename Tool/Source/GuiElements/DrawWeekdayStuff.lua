local DrawWindow = require ("Source.GuiElements.DrawWindow")
local DrawText = require ("Source.GuiElements.DrawText")
local GuiConfig = require ("Source.GuiConfig")

-- Data

local Data = {
	Monday = {
		[1] = "Montag" ,
		[2] = "nix spezielles"
	} ,
	Tuesday = {
		[1] = "Dienstag" ,
		[2] = "nix spezielles"
	} ,
	Wednesday = {
		[1] = "Mittwoch" ,
		[2] = "Pierre hat geschlossen," ,
		[3] = "wenn das Community Center" ,
		[4] = "noch nicht fertig ist"
	} ,
	Thursday = {
		[1] = "Donnerstag" ,
		[2] = "Fahrender Händler" 
	} ,
	Friday = {
		[1] = "Freitag" ,
		[2] = "Krobus verkauft" ,
		[3] = "Iridium Sprinkler"
	} ,
	Saturday = {
		[1] = "Samstag" ,
		[2] = "nix spezielles"
	} ,
	Sunday = {
		[1] = "Sonntag" ,
		[2] = "Fahrender Händler" 
	}
}

-- Config

local HeadFont = GuiConfig.GuiFont.Big
local Font = GuiConfig.GuiFont.Normal
local TextOffset = 20

local WindowSize = {
	x = 310 ,
	y = 210
}

local function DrawWeekDayStuff(WindowPosition,TextDate)

	assert(WindowPosition)
	assert(WindowPosition.x)
	assert(WindowPosition.y)
	assert(TextDate)
	assert(TextDate.WeekDay)

	local WeekDay = TextDate.WeekDay

	-- Draw Window

	DrawWindow(WindowPosition,WindowSize)

	-- Draw Title

	local Title = {[1] = "Weekday Stuff"}

	local function GetTextPosition(Title,WindowPosition)

		local TitleLength = HeadFont:getWidth(Title)

		local X = WindowPosition.x + WindowSize.x/2 - TitleLength/2
		local Y = WindowPosition.y + TextOffset

		return {x = X,y = Y}
	end

	local TextPosition = GetTextPosition(Title[1],WindowPosition)

	TextPosition.x = WindowPosition.x + TextOffset

	DrawText(Title,TextPosition,HeadFont)

	-- Draw Text

	DrawText(Data[WeekDay],TextPosition,Font)
end

return DrawWeekDayStuff