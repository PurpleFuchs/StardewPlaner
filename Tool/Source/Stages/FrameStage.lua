local StageLoader = require ("Libarys.StageLoader")

local FrameStage = {}

function FrameStage.Initialize()

	print("STAGE : FrameStage")

	love.keypressed = FrameStage.keypressed
	love.textinput = FrameStage.textinput
	love.wheelmoved = FrameStage.wheelmoved
	love.update = FrameStage.update
	love.draw = FrameStage.draw
end

function FrameStage.update(DeltaTime)

	StageLoader.Update(DeltaTime)
end

function FrameStage.draw()

	StageLoader.Draw()

end

function FrameStage.keypressed(key)

	StageLoader.KeyPressed(key)
end

function FrameStage.textinput(input)

	StageLoader.TextInput(input)
end

function FrameStage.wheelmoved(x,y)

	StageLoader.WheelMoved(x,y)
end

return FrameStage