/// @description advance text or close box

current_string = "";
char_index = 0;
lines_index++

if (lines_index >= lines) {
	state = tb.close
	exit;
}

current_name = dialog[NAME, lines_index];
string_wrapped = string_wrap(dialog[MESSAGE, lines_index], text_max_width);