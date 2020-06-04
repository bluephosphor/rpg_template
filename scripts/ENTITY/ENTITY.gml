function initialize_entity(MAX_SPEED,ACCEL,FRICT){
	image_speed = 0;
	hsp = 0;
	vsp = 0;
	max_spd = MAX_SPEED;
	accel = ACCEL;
	frict = FRICT;
	dir = new vec2(0,0);
}

function move_and_collide(){
	hsp += accel * dir.x;
	vsp += accel * dir.y;
	
	var _speed = point_distance(0, 0, hsp, vsp);
	var _direction = point_direction(0, 0, hsp, vsp);
	if (_speed > max_spd) {
		hsp = lengthdir_x(max_spd, _direction);
		vsp = lengthdir_y(max_spd, _direction);
	}
	
	x += hsp;
	y += vsp;
}