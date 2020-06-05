switch(state){
	case tb.open:
	if (draw_width < tb_width / 2) {
		draw_width += anim_speed;
	} else {
		draw_width = tb_width / 2;
		state = tb.type;
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