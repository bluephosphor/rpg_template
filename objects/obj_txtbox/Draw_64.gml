var c, name;

c = c_black;
draw_rectangle_color((view_width / 2) - draw_width, y_origin,(view_width / 2) + draw_width, y_origin + tb_height, c,c,c,c, false);
c = c_fuchsia;
draw_rectangle_color((view_width / 2) - draw_width, y_origin,(view_width / 2) + draw_width, y_origin + tb_height, c,c,c,c, true);

if (state != tb.type) exit;
name = dialog[NAME, lines_index] + ":";
draw_text_color(x_origin + text_offset, y_origin + text_offset, name, c,c,c,c, 1);
draw_text_color(x_origin + text_offset, y_origin + text_offset + line_spacing, current_string, c,c,c,c, 1);