depth = -bbox_bottom;

if (player_character == id){
	in_right	= keyboard_check(input[| key.right]);
	in_up		= keyboard_check(input[| key.up]);
	in_left		= keyboard_check(input[| key.left]);
	in_down		= keyboard_check(input[| key.down]);
}

move_and_collide();

//update sprite
var _old_sprite = sprite_index;
if (input_magnitude != 0){
	direction = input_direction;
	sprite_index = sprite_run;
} else sprite_index = sprite_idle;
if (_old_sprite != sprite_index) local_frame = 0;

actor_animate_sprite();