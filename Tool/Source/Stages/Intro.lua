local DrawHeader = require ("Source.GuiElements.DrawHeader")
local DrawBigGuiButton = require ("Source.GuiElements.DrawBigGuiButton")
local DrawStardewDate = require ("Source.GuiElements.DrawStardewDate")
local DrawWeekDayStuff = require ("Source.GuiElements.DrawWeekDayStuff")

local Intro = {}

-- Config
local ButtonBlockTime = 0.7
local ButtonWidth = 240
local DatePositon = {
  x = 200 ,
  y = 200
}
local WeekDayPosition = {
  x = DatePositon.x + 6 + 240 ,
  y = DatePositon.y
}

-- Setup
local BlockTimer = 0
local LastTimerUpdate = love.timer.getTime()
local Date


local function GetQuitToolButton()

  return {
    Label = "Quit Tool" ,
    Position = {
      x = love.graphics.getWidth() / 2 - ButtonWidth/2 ,
      y = love.graphics.getHeight() - 120
    }   
  }
end 
 
local function ButtonNotBlocked()
	
	if BlockTimer > ButtonBlockTime then
		return true
	end
end

local function DrawButton(ButtonData)

  local Position = ButtonData.Position
  local Label = ButtonData.Label

  local ReturnValue = DrawBigGuiButton(Label,Position)

  if ButtonNotBlocked() then

    return ReturnValue
  end
end

local function UpdateBlockTimer(BlockTimer)

  BlockTimer = BlockTimer + (love.timer.getTime() - LastTimerUpdate)
  LastTimerUpdate = love.timer.getTime()

  return BlockTimer
end

function Intro.Update()

	BlockTimer = UpdateBlockTimer(BlockTimer)
end

function Intro.Draw()

  Date , TextDate = DrawStardewDate(Date,DatePositon)
  DrawWeekDayStuff(WeekDayPosition,TextDate)

	local function DrawButtons()
		if DrawButton(GetQuitToolButton()) then love.event.quit()	end
	end

  DrawHeader("Stardew Valley Tool")
	DrawButtons()
end

return Intro