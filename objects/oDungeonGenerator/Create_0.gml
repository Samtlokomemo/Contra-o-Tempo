#region Auto Tile
north = 1
west = 2
east = 4
south = 8

var tileLayer = layer_tilemap_get_id("WallTiles")
#endregion

enum roomTiles{
	wall = 0,
	path = 1,
	_room = 2,
	player = 4,
	enemy = 5,
	chest = 6
}

cellSize = 32
gridW = room_width div cellSize
gridH = room_height div cellSize


mapgrid = mp_grid_create(0, 0, gridW, gridH, cellSize, cellSize)
grid = ds_grid_create(gridW, gridH)
ds_grid_set_region(grid, 0, 0, gridW, gridH, 0)

randomize()

var xx = gridW div 2
var yy = gridH div 2
var dir = irandom(3)
var roomCount = 5
var roomSize = 3

var maxEnemy = irandom(2)

for(var i = 0; i < roomCount; i++){
	
	ds_grid_set_region(grid, xx - roomSize, yy - roomSize, xx + roomSize, yy + roomSize, 2)
	var pathDistance = roomSize * 4
	
	while(pathDistance > 0){
		grid[# xx, yy] = roomTiles.path
		xx+=lengthdir_x(1, dir * 90)
		yy+=lengthdir_y(1, dir * 90)
		
		//Para não sair da tela
		xx = clamp(xx, 3, gridW - 3)
		yy = clamp(yy, 3, gridH - 3)
		
		pathDistance--
	}
	if pathDistance == 0 {
		
		ds_grid_set_region(grid, xx - roomSize, yy - roomSize, xx + roomSize, yy + roomSize, roomTiles._room)
		
		dir = irandom(3)
	}
}

for(var xx = 0; xx < gridW; xx++){
	for(var yy = 0; yy < gridH; yy++){
		if(grid[# xx,yy] == roomTiles.wall){
			var nTile = grid[# xx, yy - 1] == 0 
			var wTile = grid[# xx - 1, yy] == 0 
			var eTile = grid[# xx + 1, yy] == 0 
			var sTile = grid[# xx, yy + 1] == 0
			
			var TileIndex = nTile * north + wTile * west + eTile * east + sTile * south + 1
			
			tilemap_set(tileLayer, TileIndex, xx, yy)
			instance_create_layer(xx * cellSize, yy * cellSize, "Instances", oBlock)
		}else if(grid[# xx, yy] == roomTiles.path){
			tilemap_set(tileLayer, 17, xx, yy)
		}else if(grid[# xx, yy] == roomTiles._room){
			tilemap_set(tileLayer, 17, xx, yy)
			var x1= xx * cellSize + cellSize / 2
			var y1= yy * cellSize + cellSize / 2
			if !instance_exists(oPlayer){
				instance_create_layer(x1, y1, "Instances", oPlayer)	
			}
			repeat(maxEnemy){
				instance_create_layer(xx, xx, "Instances", oEnemy)
			}
		}
	}
}

//Obstacles
mp_grid_add_instances(mapgrid, oBlock, false)