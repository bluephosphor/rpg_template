if (actionable) {
	var i = 0, c; repeat(array_length(current_menu)){
		c = c_white;
		if (menu_index == i) c = c_red;
		draw_text_color(8,8 + (12 * i),current_menu[i],c,c,c,c,1);
		i++;
	}
}