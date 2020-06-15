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