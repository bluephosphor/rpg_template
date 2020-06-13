if (actionable) {
	var key_up = keyboard_check_pressed(input[| key.up]);
	var key_down = keyboard_check_pressed(input[| key.down]);
	var key_action = keyboard_check_pressed(input[| key.action]);
	var v_move = key_down - key_up;
	var len = array_length(current_menu) - 1;
	if (v_move != 0) {
		menu_index += v_move;
		if (menu_index > len) menu_index = 0;
		if (menu_index < 0) menu_index = len;
	}
	if (key_action){
		if (current_menu != items) {
			if (menu_index == 2){
				if (check_inv(items)){
					current_menu = items;
				} else {
					current_menu = player_actions;
					add_battle_text("", "All out of items!");
					with (battle_textbox) event_perform(ev_alarm,1);
				}
			} else {
				add_battle_turn(menu_index);
			}
		} else if (items[menu_index] != "------"){
			current_item = items[menu_index];
			current_menu = player_actions;
			items[menu_index] = "------";
			add_battle_turn(turn.item);
		}
		menu_index = 0;
	}
} else {
	current_action = ds_queue_dequeue(battle_queue);
	
	if (current_action != undefined){
		switch (current_action[0]){
			case turn.attack:
			case turn.defend:
			case turn.run: 
				add_battle_text("", current_action[1]);
			break;
			case turn.item: 
				add_battle_text("", current_action[1]);
				var str = "";
				switch(current_item){
					case "Potion":			str = "Player recovered some HP!"; break;
					case "Water Bottle":	str = "Gotta stay hydrated."; break;
					case "Sandwich":		str = "Uh, guess this is as good a time as any for a snack?"; break;
					case "Gun":				str = "...What the fuck?"; break;
					case "Hand Sanitizer":	str = current_enemy + " appreciates your cleanliness as we all navigate these uncertain times together."; break;
				}
				add_battle_text("", str);
			break;
			case turn.finish: 
				var flavor_line = choose(
					" is waiting for your move.",
					" is twiddling their thumbs.",
					" thought about something funny they heard on a podcast this morning.",
					" is trying really hard to look intimidating.",
					" is just vibing.",
					" looks kinda impatient.",
					" has to go to the DMV after this.",
					" is wondering what to have for dinner tonight."
				);
				
				add_battle_text("", current_enemy + flavor_line);
				with (battle_textbox) event_perform(ev_alarm,1);
			break;
		}
	}
	
	var turn_finish = false; with (battle_textbox){
		turn_finish = (lines_index == lines-1);
	}
	
	if (turn_finish) actionable = true;
}