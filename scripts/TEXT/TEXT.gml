function add_dialog(name,str){
	if (textbox == noone){
		with (instance_create_layer(0,0,layer,obj_txtbox)){
			textbox = id;
			dialog[NAME, lines] = name;
			dialog[MESSAGE, lines++] = str;
			current_name = dialog[NAME, lines_index];
			string_wrapped = string_wrap(dialog[MESSAGE,lines_index], text_max_width);
			name_width = string_width(dialog[NAME,lines_index]) + 8;
		}
	} else {
		with (textbox){
			dialog[NAME, lines] = name;
			dialog[MESSAGE, lines++] = str;
		}
	}
}