if (actionable) {
	var c, str, len = array_length(current_menu),
	i = 0; repeat(len){
		if (is_struct(current_menu[i])) {
			str = current_menu[i].title;
		} else {
			str = current_menu[i];
		}
		c = c_white; if (menu_index == i) c = c_red;
		draw_text_color(8,8 + (12 * i),str,c,c,c,c,1);
		i++;
	}
	if (current_menu == items) battle_textbox.current_string = string_wrap(items[menu_index].desc,battle_textbox.text_max_width);
}

if (enemy_spr != -1){
	var num = sprite_get_number(enemy_spr);
	var xx, yy, i = 0, offset = 0; 
	repeat(num){
		xx = view_width / 2;
		yy = view_height / 2 + wave(-2,2,1,i * 0.05);
		draw_sprite(enemy_spr,i,xx,yy);
		i++;
	}
}