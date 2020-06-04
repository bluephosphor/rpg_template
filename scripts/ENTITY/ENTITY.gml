function initialize_entity(MAX_SPEED,ACCEL,FRICT){
	image_speed = 0;
	max_spd = MAX_SPEED;
	accel = ACCEL;
	frict = FRICT;
	spd = new vec2(0,0);
	move = new vec2(0,0);
}

function move_and_collide(){
	input_direction = point_direction(0,0,in_right-in_left, in_down-in_up);
	input_magnitude = (in_right-in_left != 0) or (in_down-key_up != 0);
}