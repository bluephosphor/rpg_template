current_enemy = "Test Enemy";

battle_queue = ds_queue_create();

current_action = -1;
current_item = "";
actionable = true;
menu_index = 0;

player_actions	= ["Attack", "Defend", "Item", "Run"];
enemy_actions	= ["Attack 1", "Attack 2", "Attack 3", "Attack 4"];

items = ["Potion", "Water Bottle", "Sandwich", "Gun", "Hand Sanitizer"];

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
	var flavor_line = choose(
		" wants to rumble!",
		" has something to say.",
		" wants to punch you a little.",
		" wants to dance, but not like, romantically. They wanna dance violently, like with fists.",
		" has a gift for you!\n(it's a knuckle sandwich)",
		" would like to deplete your HP over a series of violent, yet ordered attacks.",
	);
	
	battle_mode = true;
	dialog[NAME, lines] = "";
	dialog[MESSAGE, lines++] = other.current_enemy + flavor_line;
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
			str = "Player uses a " + current_item + "!";
			ds_queue_enqueue(battle_queue,[turn.item,str]);
		break;
		case 3: 
			str = "Nowhere to run."
			ds_queue_enqueue(battle_queue,[turn.run,str]);
		break;
	}
	num = irandom(array_length(enemy_actions) - 1);
	str = current_enemy + " attacks with " + enemy_actions[num] + "!";
	ds_queue_enqueue(battle_queue,[turn.attack,str]);
	ds_queue_enqueue(battle_queue,[turn.finish]);
	
	actionable = false;
}

check_inv = function(array){
	var flag = false;
	var len = array_length(array);
	var i = 0; repeat(len){
		if (array[i] != "------") {flag = true; break}
		i++;
	}
	return flag;
}