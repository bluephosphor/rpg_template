var i = 0, list = []; with (obj_actor){
	list[i++] = id;
}

actor_list = list;

set_char();
controller.camera.x = player_character.x;
controller.camera.y = player_character.y;