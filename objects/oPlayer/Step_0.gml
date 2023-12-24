var _right = keyboard_check(ord("D"))
var _left = keyboard_check(ord("A"))
var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))

var moving = _right - _left != 0 or _down - _up != 0
dir = point_direction(0, 0, _right - _left, _down - _up)

var moveX = lengthdir_x(spd * moving, dir)
var moveY = lengthdir_y(spd * moving, dir)

if place_meeting(x + moveX, y, oBlock){
	while !place_meeting(x + sign(moveX), y, oBlock){
		x += sign(moveX)
	}
	moveX = 0
}
x += moveX

if place_meeting(x, y + moveY, oBlock){
	while !place_meeting(x, y + sign(moveY), oBlock){
		y += sign(moveY)
	}
	moveY = 0
}
y += moveY


with(myWeapon){
	itemDir = point_direction(x,y,mouse_x,mouse_y)
	if(mouse_check_button(mb_left)){
		Shoot()	
	}
}
