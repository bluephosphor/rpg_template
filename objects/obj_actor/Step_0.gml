if (player_character == id){
	in_right	= keyboard_check(input[| key.right]);
	in_up		= keyboard_check(input[| key.up]);
	in_left		= keyboard_check(input[| key.left]);
	in_down		= keyboard_check(input[| key.down]);
	
	dir.x = in_right - in_left;
	dir.y = in_down - in_up;
}

