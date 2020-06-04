globalvar player_character, controller;

controller = {
	camera: instance_create_layer(x,y,layer,obj_camera)
}

player_character = instance_create_layer(x,y,layer,obj_actor);