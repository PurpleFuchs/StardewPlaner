local FrameStage = require ("Source.Stages.FrameStage")
local lfs = require "lfs"

BlackBoard = require ("Source.BlackBoard")

local MainStage = {}
love.graphics.setDefaultFilter("nearest", "nearest")

function MainStage.Initialize()

	print("main.lua \t\t : Loading MainStage")
	
	love.keypressed = MainStage.keypressed
	love.textinput = MainStage.textinput
	love.wheelmoved = MainStage.wheelmoved
	love.update = MainStage.update
	love.draw = MainStage.draw
end

function MainStage.keypressed(key)
end

function MainStage.textinput(input)
end

function MainStage.wheelmoved(x,y)
end

function MainStage.update(delta_time)

	local function AnalizeFiles(Toggle)

		local function MakeFolderList()
			local FolderList = { 
								[1] = "Source" ,
								[2] = "Source/Commands" ,
								[3] = "Source/Data" ,
								[4] = "Source/Data/Effects" ,
								[5] = "Source/Data/Recepies" ,
								[6] = "Source/Data/Units" ,
								[7] = "Source/Data/Buildings" ,
								[8] = "Source/GuiElements" ,
								[9] = "Source/Libarys" ,
								[10] = "Source/Libarys/Functions" ,
								[11] = "Source/Render" ,
								[12] = "Source/Stages" ,
								[13] = "Source/CowFence" ,
								[14] = "Source/Data/Paths/Dirt" ,
								[15] = "Source/Data/Paths/Stone" ,
								[16] = "Source/Data/Paths/Test" ,
								[17] = "Source/Data/Resources" ,
								[18] = "Source/Data/Terrain" ,
								[19] = "Source/Data/Projectiles" ,
								[20] = "Source/Data/Items" ,
								[21] = "Source/Data/Tunnels" ,
							}

			return FolderList
		end

		local function AnalizeList(FolderList)
			local function AnalizeFolder(Path)

				local function IsLuaScript(FilePath)

			      	local Ending = string.sub( FilePath , -4)

			        if Ending == ".lua" then

			          return true
			        end
			    end

			    local function CountLines(FilePath)

			    	local Lines = 0
					for _ in io.lines(FilePath) do
					  Lines = Lines + 1
					end

					return Lines
			    end

				local NumberOfFiles = 0
				local TotalLines = 0

				for File in lfs.dir(Path) do

			    	if IsLuaScript(File) then

						TotalLines = TotalLines + CountLines(Path .. "/" .. File)
			      		NumberOfFiles = NumberOfFiles + 1
			    	end
			  	end

			  	return TotalLines , NumberOfFiles
			end

			local TotalLines = 0
			local TotalFiles = 0

			for Key , Value in pairs(FolderList) do

				local Lines , Files = AnalizeFolder(Value)

				TotalLines = TotalLines + Lines
				TotalFiles = TotalFiles + Files
			end

			return TotalFiles , TotalLines
		end

		local function PrintCount(Files,Lines)

			local Text = "main.lua \t\t : The Project KingdomFactory contains " .. Files .. " Files and " .. Lines .. " Lines of Code\n"
			print(Text)
		end

		if not Toggle then

			local FolderList = MakeFolderList()
			local TotalFiles , TotalLines = AnalizeList(FolderList)

			PrintCount(TotalFiles,TotalLines)
		end

		return true
	end

	AnalizeFiles()
	FrameStage.Initialize()
end
 
function MainStage.draw()
end

function love.load()
end

function love.keypressed(key)
	
	love.keypressed = MainStage.keypressed
end

function love.textinput(input)
	
	love.textinput = MainStage.textinput
end

function love.wheelmoved(x,y)

	love.wheelmoved = MainStage.wheelmoved
end

function love.update(delta_time)
	
	love.update = MainStage.update
end

function love.draw()

	love.draw = MainStage.draw
end

function love.quit()
end
