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