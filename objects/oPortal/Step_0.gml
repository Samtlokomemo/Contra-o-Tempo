if !instance_exists(oEnemy){
	clean = true
	if place_meeting(x, y, oPlayer){
		room_restart()
	}
}