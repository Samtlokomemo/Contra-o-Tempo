/// @description Mapa Procedural
cellSize = 32
room_width = cellSize * 40
room_height = room_width div 2

//div divide o numero e arredonda pra um numero inteiro
cellW = room_width div cellSize
cellH = room_height div cellSize

#region Mapa procedural (Variáveis)
mapgrid = mp_grid_create(0, 0, cellW, cellH, cellSize, cellSize)
grid = ds_grid_create(cellW, cellH)
ds_grid_clear(grid, 0)

randomize()
var dir = irandom(3)
var xx = cellW div 2
var yy = cellH div 2
var chance = 1
var steps = 1000
#endregion

var maxEnemy = 5

north = 1
west = 2
east = 4
south = 8

var tileLayer = layer_tilemap_get_id("WallTiles")

for(var i = 0; i < steps; i++){
	
	dir = irandom(3)
	
	xx += lengthdir_x(1, dir * 90)
	yy += lengthdir_y(1, dir * 90)
	xx = clamp(xx, 2, cellW - 2)
	yy = clamp(yy, 2, cellH - 2)
	
	grid[# xx, yy] = 1
}


#region Tiles
for(var xx = 0;xx < cellW; xx++){
	for(var yy = 0; yy < cellH; yy++){
		if(grid[# xx, yy] == 0){
			var northTile = grid[# xx, yy - 1] == 0
			var westTile = grid[# xx - 1, yy] == 0
			var eastTile = grid[# xx + 1, yy] == 0
			var southTile = grid[# xx, yy + 1] == 0
			
			var TileIndex = northTile * north + westTile * west + eastTile * east + southTile * south + 1
			
			tilemap_set(tileLayer, TileIndex, xx, yy)
		}else if(grid[# xx, yy] == 1)
		{
			tilemap_set(tileLayer, 17, xx, yy)
		}
	}
}
#endregion

#region Instânces
for(var xx = 0;xx < cellW; xx++){
	for(var yy = 0; yy < cellH; yy++){
		if(grid[# xx, yy] == 0){
			//0 é parede
			instance_create_layer(xx * cellSize, yy * cellSize, "Instances", oBlock)	
		}
		
		#region Inimigos
		if(grid[# xx, yy] == 1){
			//1 são os outros objetos
			var x1= xx * cellSize + cellSize / 2
			var y1= yy * cellSize + cellSize / 2
			if !instance_exists(oPlayer){
				instance_create_layer(x1, y1, "Instances", oPlayer)	
			}
			
			if maxEnemy > 0{
				var chances = 25
				var dist = 130
				if (irandom(chances) == chances and point_direction(x1, y1, oPlayer.x, oPlayer.y) > dist){
					instance_create_layer(x1, y1, "Instances", oEnemy)	
					maxEnemy -= 1
				}
			}
			
			if !instance_exists(oPortal) and !instance_exists(oEnemy){
				instance_create_layer(x1, y1, "Instances", oPortal)
			}
		}
		#endregion
	}	
}
#endregion

//Obstacles
mp_grid_add_instances(mapgrid, oBlock, false)