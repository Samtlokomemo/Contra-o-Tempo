switch(state){
	case "idle":
		var range = 300
		var line = collision_line(x, y, oPlayer.x, oPlayer.y, oBlock, false, false)
		if distance_to_object(oPlayer) <= range and !line{
			state = "chase"
		}
	break;

	case "chase":
		var x1 = x
		var y1 = y
		var x2 = (oPlayer.x div 32) * 32 + 16
		var y2 = (oPlayer.y div 32) * 32 + 16
		
		if(mp_grid_path(oMap.mapgrid, path, x1, y1, x2, y2, true)){
			path_start(path, spd, path_action_stop, false)	
		}
	break;
}

if life <= 0{
	instance_destroy(self)	
}