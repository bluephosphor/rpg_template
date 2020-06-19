current_enemy = enemy.sudsy;
enemy_spr = (variable_struct_exists(current_enemy,"sprite")) ? current_enemy.sprite : -1;

battle_queue = ds_queue_create();

current_action = -1;
current_item = "";
item_to_display = "";
actionable = true;
menu_index = 0;

player_actions	= ["Attack", "Defend", "Item", "Run"];
enemy_actions	= current_enemy.moves;
items = [item.potion,item.potion,item.potion,item.hand_sanitizer,item.gun,item.water_bottle,item.sandwich];

current_menu = player_actions;

enum turn {
	attack,
	defend,
	item,
	run,
	finish
}

battle_textbox = (instance_create_layer(0,0,layer,obj_txtbox));
with (battle_textbox){
	var i = irandom(array_length(other.current_enemy.intro_lines)-1);
	var flavor_line = other.current_enemy.intro_lines[i];
	
	battle_mode = true;
	dialog[NAME, lines] = "";
	dialog[MESSAGE, lines++] = other.current_enemy.title + flavor_line;
	string_wrapped = string_wrap(dialog[MESSAGE,lines_index], text_max_width);
	name_width = string_width(dialog[NAME,lines_index]) + 8;
	tb_height = max(30, string_height(string_wrapped) + 6);
	y_origin = (view_height - tb_height - 4);
}


//functions
add_battle_text = function(name,str){
	with (battle_textbox){
		dialog[NAME, lines] = name;
		dialog[MESSAGE, lines++] = str;
	}
}

add_battle_turn = function(index){
	var str, num;
	switch (index){
		case 0: 
			str = "Player attacks!"
			ds_queue_enqueue(battle_queue,[turn.attack,str]);
		break;
		case 1: 
			str = "Player defends this turn!"
			ds_queue_enqueue(battle_queue,[turn.defend,str]);
		break;
		case 2: 
			str = "Player uses a " + current_item.title + "!";
			ds_queue_enqueue(battle_queue,[turn.item,str]);
		break;
		case 3: 
			str = "Nowhere to run."
			ds_queue_enqueue(battle_queue,[turn.run,str]);
		break;
	}
	num = irandom(array_length(enemy_actions) - 1);
	str = current_enemy.title + " uses " + enemy_actions[num] + "!";
	ds_queue_enqueue(battle_queue,[turn.attack,str]);
	ds_queue_enqueue(battle_queue,[turn.finish]);
	
	actionable = false;
}

check_inv = function(array){
	var flag = false;
	var len = array_length(array);
	var i = 0; repeat(len){
		if (array[i] != item.none) {flag = true; break}
		i++;
	}
	return flag;
}