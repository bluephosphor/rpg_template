function tile_place_meeting(col_map){
	var _top_right = tilemap_get_at_pixel(col_map, bbox_right-1, bbox_top);
	var _top_left = tilemap_get_at_pixel(col_map, bbox_left, bbox_top);
	var _bottom_right = tilemap_get_at_pixel(col_map, bbox_right-1, bbox_bottom-1);
	var _bottom_left = tilemap_get_at_pixel(col_map, bbox_left, bbox_bottom-1);
	
	return _top_right || _top_left || _bottom_right || _bottom_left;
}

function move_and_collide(){
	input_direction = point_direction(0,0,in_right-in_left, in_down-in_up);
	input_magnitude = (in_right-in_left != 0) or (in_down-in_up != 0);
	
	spd.x = lengthdir_x(input_magnitude * max_spd, input_direction);
	spd.y = lengthdir_y(input_magnitude * max_spd, input_direction);
	
	in_right	= false;
	in_up		= false;
	in_left		= false;
	in_down		= false;
	var _collision = false;

	// Move horizontally
	x += spd.x;

	// Right collisions
	if spd.x > 0 {
		if (tile_place_meeting(collision_map)) {
			x = bbox_right&~(CELLSIZE-1);
			x -= bbox_right-x;
			spd.x = 0;
		}
	} else if spd.x < 0 {
		// Left collisions
		if (tile_place_meeting(collision_map)) {
			x = bbox_left&~(CELLSIZE-1);
			x += CELLSIZE+x-bbox_left;
			spd.x = 0;
		}
	}

	// Move vertically
	y += spd.y;

	// Vertical collisions
	if spd.y > 0 {
		// Bottom collisions
		if (tile_place_meeting(collision_map)) {
			y = bbox_bottom&~(CELLSIZE-1);
			y -= bbox_bottom-y;
			spd.y = 0;
		}
	} else if spd.y < 0 {
		// Top collisions
		if (tile_place_meeting(collision_map)) {
			y = bbox_top&~(CELLSIZE-1);
			y += CELLSIZE+y-bbox_top;
			spd.y = 0;
		}
	}
	
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

