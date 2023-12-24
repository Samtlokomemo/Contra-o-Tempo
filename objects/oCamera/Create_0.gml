//@Description Camera Variables
resolution_width = 854 
resolution_height = 480
resolution_scale = 2
global.view_width = resolution_width / resolution_scale
global.view_height = resolution_height / resolution_scale
view_target = oPlayer
view_speed = .1
window_set_size(global.view_width * resolution_scale, global.view_height * resolution_scale)
surface_resize(application_surface, global.view_width * resolution_scale, global.view_height * resolution_scale)
display_set_gui_size(global.view_width, global.view_height)