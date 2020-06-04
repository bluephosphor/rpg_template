camera_set_view_size(VIEW,view_width,view_height);

if (instance_exists(following)){
	var _x = clamp(following.x - view_width/2, 0, room_width - view_width);
	var _y = clamp(following.y - view_height/2, 0, room_height - view_height);
	
	var _cur_x = camera_get_view_x(VIEW);
	var _cur_y = camera_get_view_y(VIEW);
	
	camera_set_view_pos(
		VIEW, 
		lerp(_cur_x,_x,follow_spd),
		lerp(_cur_y,_y,follow_spd),
	);
}