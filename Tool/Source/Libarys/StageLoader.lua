local StageLoader = {}

StageLoader.Navigation = require "Source.Stages.Intro" 

local CurrentStage = "Navigation"

function StageLoader.Update(DeltaTime)

	if CurrentStage == BlackBoard.CurrentStage then

		StageLoader[CurrentStage].Update(DeltaTime)
	else

		StageLoader[BlackBoard.CurrentStage] = require ("Source.Stages." .. BlackBoard.CurrentStage)

		print("Loading Stage : " .. BlackBoard.CurrentStage)

		CurrentStage = BlackBoard.CurrentStage
	end
end

function StageLoader.Draw(GuiTable)

	if CurrentStage == BlackBoard.CurrentStage then

		StageLoader[CurrentStage].Draw(GuiTable)
	end
end

function StageLoader.TextInput(Input)
	if StageLoader[CurrentStage].TextInput then

		StageLoader[CurrentStage].TextInput(Input)
	end
end

function StageLoader.KeyPressed(Key)
	if StageLoader[CurrentStage].KeyPressed then

		StageLoader[CurrentStage].KeyPressed(Key)
	end
end

function StageLoader.WheelMoved(x,y)
	if StageLoader[CurrentStage].WheelMoved then

		StageLoader[CurrentStage].WheelMoved(x,y)
	end
end

return StageLoader