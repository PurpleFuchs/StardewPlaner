local lfs = require "lfs"

local CharactersDB = {}

local CharactersFolder = "Source/Data/Characters"
local DebuggPrints = true

local function LoadCharacters()

	local function IsCharacter(File)

		local function IsLuaScript(FilePath)

			return string.sub( FilePath , -4) == ".lua"
		end

		local FilePath = CharactersFolder..'/'..File

		if File ~= "." and File ~= ".."
		and lfs.attributes(FilePath, 'mode') == 'file'
		and IsLuaScript(FilePath) then

			return true
		end
	end

	local function LoadCharacter(FileName)

		return require ("Source.Data.Characters." .. FileName)
	end

	local function PrintNameOfLoadedFile(File)

		if DebuggPrints then
			print("CharactersDB.lua \t\t : Character-File : " .. File .. " is loaded")
		end
	end

	local function CheckValidity(Character,FileName)


	end

	local Counter = 0

	for File in lfs.dir(UnitsFolder) do

		if IsUnit(File) then

			File = File:sub(1, -5)

			CharactersDB[File] = LoadUnit(File)
			CheckValidity(CharactersDB[File],File)
			PrintNameOfLoadedFile(File)
			Counter = Counter + 1
		end
	end

end

LoadCharacters()

return CharactersDB