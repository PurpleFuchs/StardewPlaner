local IslandGrid = {

	DistanceToBorder = 200 ,
	TileSize = 24 ,
	WindowBorder = 6 , --Pixels
	GridLineWidth = 3
}

IslandGrid.DetailWindowSize = {
	x = 300 ,
	y = IslandGrid.DistanceToBorder - 2*IslandGrid.WindowBorder
}

return IslandGrid