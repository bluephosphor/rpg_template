globalvar player_character, controller;

player_character = instance_create_layer(x,y,layer,obj_actor);

controller = {
	camera: instance_create_layer(x,y,layer,obj_camera)
}