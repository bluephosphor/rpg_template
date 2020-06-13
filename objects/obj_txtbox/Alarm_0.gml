///@description animate textbox

alarm[0] = txt_speed;

if (state != tb.type) exit;

if (txt_buff > 0) {txt_buff--; exit;}

if (char_index < string_length(string_wrapped)) {
	switch(string_char_at(string_wrapped, char_index)){
		case ",": txt_buff = 5; break;
		case ":":
		case "!":
		case "?":
		case ".": txt_buff = 7; break;
	}
	char_index++;
	current_string = string_copy(string_wrapped,1,char_index);
} else if (battle_mode and alarm_get(1) == -1 and lines_index != lines - 1){
	alarm[1] = room_speed * 2;
}