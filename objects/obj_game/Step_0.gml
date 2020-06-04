if (keyboard_check(vk_shift) and (keyboard_check_pressed(ord("S")))) {
	player_character = actor_list[char_index];
	controller.camera.following = player_character;
	
	char_index++;
	if (char_index >= array_length(actor_list)) char_index = 0;
}