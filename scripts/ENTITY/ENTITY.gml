function move_and_collide(){
	input_direction = point_direction(0,0,in_right-in_left, in_down-in_up);
	input_magnitude = (in_right-in_left != 0) or (in_down-in_up != 0);
	
	spd.x = lengthdir_x(input_magnitude * max_spd, input_direction);
	spd.y = lengthdir_y(input_magnitude * max_spd, input_direction);
	
	x += spd.x;
	y += spd.y;
}