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
		} else if (items[menu_index] != item.none){
			current_item = items[menu_index];
			current_menu = player_actions;
			items[menu_index] = item.none;
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
				var item_line = current_item.battle_text;
				if (variable_struct_exists(current_enemy,"special_lines")){
					var list = current_enemy.special_lines;
					var i = 0; repeat(array_length(list)){
						if (list[i][0] == current_item) {
							item_line = list[i][1];
							break;
						}
						i++;
					}
				}
				add_battle_text("", item_line);
			break;
			case turn.finish: 
				var i = irandom(array_length(current_enemy.mid_battle_lines)-1);
				var flavor_line = current_enemy.mid_battle_lines[i];
				
				add_battle_text("", current_enemy.title + flavor_line);
				with (battle_textbox) event_perform(ev_alarm,1);
			break;
		}
	}
	
	var turn_finish = false; with (battle_textbox){
		turn_finish = (lines_index == lines-1);
	}
	
	if (turn_finish) actionable = true;
}