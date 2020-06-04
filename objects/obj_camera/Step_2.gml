camera_set_view_size(VIEW,view_width,view_height);

if (instance_exists(following)){
	var _x = following.x - view_width / 2;
	var _y = following.y - view_height / 2;
	camera_set_view_pos(VIEW, _x,_y);
}