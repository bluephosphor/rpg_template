switch(state){
	case tb.open:
		if (draw_width < tb_width / 2) {
			draw_width += anim_speed;
		} else {
			draw_width = tb_width / 2;
			state = tb.type;
		}
	break;
	case tb.type:
		if (keyboard_check_pressed(input[| key.action])){
			var len = string_length(string_wrapped);
			if (char_index < len) {
				char_index = len;
				current_string = string_wrapped;
			} else {
				event_perform(ev_alarm,1);
			}
		}
	break;
	case tb.close:
		if (draw_width > 0) {
			draw_width -= anim_speed;
		} else {
			textbox = noone;
			instance_destroy();
		}
	break;
}