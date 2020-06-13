/// @description advance text or close box

current_name = "";
current_string = "";
char_index = 0;
lines_index++

if (lines_index >= lines) {
	state = tb.close
	exit;
}

current_name = dialog[NAME, lines_index];
string_wrapped = string_wrap(dialog[MESSAGE, lines_index], text_max_width);
name_width = string_width(dialog[NAME,lines_index]) + 8;

tb_height = max(30, string_height(string_wrapped) + 6);
y_origin = (view_height - tb_height - 4);