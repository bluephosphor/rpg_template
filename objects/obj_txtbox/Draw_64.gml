var c, xo, yo, wid;

//main rect
c = c_white;
draw_rectangle_color((view_width / 2) - draw_width, y_origin,(view_width / 2) + draw_width, y_origin + tb_height, c,c,c,c, false);
c = c_black;
draw_rectangle_color((view_width / 2) - draw_width + 1, y_origin + 1,(view_width / 2) + draw_width - 1, y_origin + tb_height - 1, c,c,c,c, false);


//name rect
if (current_name != ""){
	xo = (view_width / 2) - draw_width;
	yo = y_origin - (line_spacing * draw_width / (tb_width / 2));
	wid = name_width * draw_width / (tb_width / 2);
	c = c_white;
	draw_rectangle_color(xo,yo,xo + wid, y_origin, c,c,c,c, false);
	c = c_black;
	draw_rectangle_color(xo+1,yo+1,xo + wid - 1, y_origin - 1, c,c,c,c, false);
}

//text
if (state != tb.type) exit;
c = c_white;
if (current_name !=  "") draw_text_color(x_origin + text_offset, yo + 2, current_name + ":", c,c,c,c, 1);
draw_text_color(x_origin + text_offset, y_origin + text_offset, current_string, c,c,c,c, 1);