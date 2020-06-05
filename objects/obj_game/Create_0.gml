globalvar player_character, controller, data_structures, ds_index, textbox;

controller = {
	camera: instance_create_layer(x,y,layer,obj_camera)
}

char_index = 0;
actor_list = -1;
ds_index = 0;
alarm[0] = 1;

textbox = noone;
enum tb {open,type,close};

init_input();

function set_char(){
	player_character = actor_list[char_index];
	controller.camera.following = player_character;
	
	char_index++;
	if (char_index >= array_length(actor_list)) char_index = 0;
}