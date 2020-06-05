if (keyboard_check(vk_shift)){
	if (keyboard_check_pressed(ord("S"))) {
		set_char();
	}
	if (keyboard_check_pressed(ord("D"))) {
		if (textbox == noone){
			add_dialog("Niko","Hewwo, gamers! How we feelin?");
		}
	}
}