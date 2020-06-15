tb_width = 200;
tb_height = 30;

text_offset = 4
text_max_width = tb_width - (text_offset * 2);

line_spacing = string_height("M");

x_origin = (view_width / 2) - (tb_width / 2);
y_origin = (view_height - tb_height - 4);

state = tb.open;
autoscroll = false;
name_width = 1;

battle_mode = false;

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