var i = 0, list = []; with (obj_actor){
	list[i++] = id;
}

actor_list = list;
char_index = 0;
set_char();

with (controller.camera){
	x = player_character.x;
	y = player_character.y;
	camera_set_view_pos(VIEW,x,y);
}