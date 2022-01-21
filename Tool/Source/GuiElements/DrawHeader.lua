local DrawWindow = require ("Source.GuiElements.DrawWindow")
local DrawText = require ("Source.GuiElements.DrawText")
local GuiConfig = require ("Source.GuiConfig")

local WindowSize = GuiConfig.Header.Size
local BigGuiFont = GuiConfig.GuiFont.Big

local function DrawHeader(Label,HeightOffset)

  local function InputContract(Label)
  
    assert(Label,"DrawHeader.lua \t : No Label")
    assert(type(Label) == "string","DrawHeader.lua \t : Wrong formatted Label")
    
    if HeightOffset then
    
      assert(type(HeightOffset) == "number","DrawHeader.lua \t : Wrong format for HeightOffset")
    end
  end

  InputContract(Label,HeightOffset)
  
  local function GetPosition(HeightOffset)
  
    if not HeightOffset then HeightOffset = 0 end
  
    local X = love.graphics.getWidth() / 2 - 160
    local Y = HeightOffset + 80
  
    return {x = X , y = Y}
  end
  
  local Position = GetPosition(HeightOffset)
  local Size = WindowSize

  DrawWindow(Position,Size)
  
  local function GetTextPosition(Label,WindowPosition,Font)
  
    
    local TextLength = Font:getWidth(Label)
    local X = WindowPosition.x + WindowSize.x/2 - TextLength/2
    local FontSize = Font:getHeight()
    local Y = WindowPosition.y + WindowSize.y/2 - FontSize/2
  
     return {x = X , y = Y}
  end
  
  local TextPosition = GetTextPosition(Label,Position,BigGuiFont)
  
  local Text = {}
  Text[1] = Label
  local Font =  BigGuiFont

  DrawText(Text,TextPosition,BigGuiFont,Color)
end

return DrawHeader