function move_and_collide(){
	input_direction = point_direction(0,0,in_right-in_left, in_down-in_up);
	input_magnitude = (in_right-in_left != 0) or (in_down-in_up != 0);
	
	spd.x = lengthdir_x(input_magnitude * max_spd, input_direction);
	spd.y = lengthdir_y(input_magnitude * max_spd, input_direction);
	
	var _collision = false;
	//horizonal tiles
	if (tilemap_get_at_pixel(collision_map, x + spd.x, y)){
		x -= x mod CELLSIZE;
		if (sign(spd.x) == 1) x += CELLSIZE -1;
		spd.x = 0;
		_collision = true;
	}
	//horizontal move commit
	x += spd.x;
	
	//vertical tiles
	if (tilemap_get_at_pixel(collision_map, x, y + spd.y)){
		y -= y mod CELLSIZE;
		if (sign(spd.y) == 1) y += CELLSIZE -1;
		spd.y = 0;
		_collision = true;
	}
	//vertiacl move commit
	y += spd.y;
	
	return _collision;
}

function actor_animate_sprite() {
	var _cardinal_dir = round(direction / 90);
	var _total_frames = sprite_get_number(sprite_index) / 4;
	image_index = local_frame + (_cardinal_dir * _total_frames);
	local_frame += sprite_get_speed(sprite_index) / FRAMERATE;
	
	//looping
	if (local_frame >= _total_frames){
		animation_end = true;
		local_frame -= _total_frames;
	} else {
		animation_end = false;
	}
}