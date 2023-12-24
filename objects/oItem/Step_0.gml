if(instance_exists(itemId)){
	x = itemId.x
	y = itemId.y
	
	itemX = x + lengthdir_x(16, itemDir)
	itemY = y + lengthdir_y(16, itemDir)
	
	image_angle = itemDir
	
	function Shoot(){
		if(!sprite > 0){
			return false
		}
		
		if(canAttack){
			var proj = instance_create_layer(itemX, itemY, "Projectiles", oProjectile)
			proj.sprite_index = projectile
			proj.image_angle = itemDir
			proj.direction = itemDir
			proj.speed = projspd
			canAttack = false
			alarm[0] = projdelay
		}
	}
}else{
	instance_destroy()	
}