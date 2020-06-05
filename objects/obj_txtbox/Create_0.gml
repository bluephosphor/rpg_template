tb_width = 200;
tb_height = 32;

text_offset = 4
text_max_width = tb_width - (text_offset * 2);

line_spacing = string_height("M");

x_origin = (view_width / 2) - (tb_width / 2);
y_origin = (view_height - tb_height - 4);

state = tb.open;

dialog[NAME,	0] = "MyName";
dialog[MESSAGE,	0] = "This is a test message.";

current_name = "";
current_string = "";
string_wrapped = "";
draw_width = 0;

lines = 0;
lines_index = 0;
char_index = 0;

txt_speed = 2;
txt_buff = 20;
anim_speed = 3;
alarm[0] = txt_speed;

function string_wrap(str,max_width){
	var str_len = string_length(str);
	var last_space = 1;

	var count = 1;
	var substr;

	repeat(str_len){
		substr = string_copy(str, 1, count);
		if(string_char_at(str, count) == " ") last_space = count;
	
		if (string_width(substr) > max_width){
			str = string_delete(str, last_space, 1);
			str = string_insert("\n", str, last_space);
		}
		count++;
	}
	return str;
}