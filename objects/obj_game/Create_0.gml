globalvar player_character, controller;

with (instance_create_layer(x,y,layer,obj_actor)){
	player_character = id;
	sprite_run = spr_female_office_worker_run;
	sprite_idle = spr_female_office_worker_idle;
}

controller = {
	camera: instance_create_layer(x,y,layer,obj_camera)
}

char_index = 0;
actor_list = -1;
alarm[0] = 1;