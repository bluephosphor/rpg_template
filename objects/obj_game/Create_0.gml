globalvar player_character, controller, textbox, room_count, fullscreen;

room_count = 0; 
while (room_exists(room_count)) room_count++;

textbox = noone;
fullscreen = false;
enum tb {open,type,close};

controller = {
	camera: instance_create_layer(x,y,layer,obj_camera),
	depthsorter: instance_create_layer(x,y,layer,obj_depthsorter)
}

init_input();

set_char = function(){
	player_character = actor_list[char_index];
	controller.camera.following = player_character;
	
	char_index++;
	if (char_index >= array_length(actor_list)) char_index = 0;
}