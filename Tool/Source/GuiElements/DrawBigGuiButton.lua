local DrawTextButton = require ("Source.GuiElements.DrawTextButton")
local GuiConfig = require ("Source.GuiConfig")

local Font = GuiConfig.GuiFont.Big
local Size = GuiConfig.BigGuiButton.Size

local function DrawBigGuiButton(Label,Position)

  local function InputContract(Label,Position)
  
    assert(Label,"DrawBigGuiButton.lua \t : No Label Value")
    assert(type(Label) == "string","DrawBigGuiButton.lua \t : Wrong format for Label")
    assert(Position,"DrawBigGuiButton.lua \t : No Position-Table")
    assert(type(Position) == "table", "DrawBigGuiButton.lua \t : Wrong format for Position")
    assert(Position.x,"DrawBigGuiButton.lua \t : No X-Value in Position-Table")
    assert(type(Position.x) == "number","DrawBigGuiButton.lua \t : Wrong format for X-Value in Position-Table")
    assert(Position.y,"DrawBigGuiButton.lua \t : No Y-Value in Position-Table")
    assert(type(Position.y) == "number","DrawBigGuiButton.lua \t : Wrong format for Y-Value in Position-Table")
    
  end

  InputContract(Label,Position)

  if DrawTextButton(Label,Size,Position,Font) == "Left" then
    return true
  end
end

return DrawBigGuiButton