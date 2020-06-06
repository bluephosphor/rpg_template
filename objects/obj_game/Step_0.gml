if (keyboard_check(vk_shift)){
	if (keyboard_check_pressed(ord("S"))) {
		set_char();
	}
	if (keyboard_check_pressed(input[| key.action])) {
		if (textbox == noone){
			add_dialog("Niko","Hewwo, gamers! How we feelin?");
			add_dialog("Niko","Hope everything's good out there!");
			add_dialog("Niko","Would hate for it to be anything but truly amazing!");
			add_dialog("Niko","..... Heh heh heh.... :(");
		}
	}
	
	if (keyboard_check_pressed(vk_pageup)) {
		if (room_next(room) != -1) room_goto_next();
		else room_goto(0);
	} else if (keyboard_check_pressed(vk_pagedown)) {
		if (room_previous(room) != -1) room_goto_previous();
		else room_goto(room_count - 1);
	}
	
	if (keyboard_check_pressed(vk_escape)) {
		fullscreen = !fullscreen;
		window_set_fullscreen(fullscreen);
	}
}