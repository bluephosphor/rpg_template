///@function quack_eval_command(callstack, adapter)
///@arg callstack - the call stack
///@arg adapter - the adapter function used to dispatch parsed results to the dialogue system
function quack_eval_command(argument0) {
	/*
		Steps through each block and runs its associated command.
	*/

	var state = argument0;

	var callstack = state[? "callstack"]
	var adapter = state[? "adapter"];

	//do not evaluate dialogue if this is the end
	var conversation = ds_stack_top(callstack);

	//find the current command and advance the cursor
	var command_list = conversation[0];
	var cursor = conversation[1];
	var block = command_list[| cursor++];
	conversation[@ 1] = cursor;

	//different behavior based on command type
	switch(block[? "type"]){
		case "if": // conditionals
			show_debug_message("QUACK: If statement found.");
			var parts = block[? "parts"];
			for (var i=0; i<ds_list_size(parts); i++) { // loop through all parts until a condition matches
				var part = parts[| i];
				if (quack_eval_condition(part[? "condition"])) {
					show_debug_message("QUACK: If statement true, pushing statements onto callstack.");
					ds_stack_push(callstack, [part[? "statements"], 0, false]);
					break; // stop looping
				}
				show_debug_message("QUACK: If statement not true, skipping.");
			}
			break;

		case "say": // say a thing
			show_debug_message("QUACK: Say command found.");
			script_execute(adapter, QUACK.say, state, quack_eval_data(block[? "value"]));
			break;

		case "newpage": // a new page
		  show_debug_message("QUACK: Newpage command found.");
			script_execute(adapter, QUACK.newpage, state);
			break;

		case "set": // set variables
			show_debug_message("QUACK: set command found.");
			quack_set_variable(block[? "target"], quack_eval_data(block[? "value"]));
			break;

		case "call": // call contains exactly one function_call node, we can run quack_eval_data directly
			show_debug_message("QUACK: call command found.");
			quack_eval_data(block[? "value"]);
			break;

		case "comment": // for debugging purposes
			show_debug_message("QUACK: " + string(block[? "value"]));
			break;

		case "option": // user select options
			show_debug_message("QUACK: option command found.");
			script_execute(adapter, QUACK.option, state, quack_eval_data(block[? "label"]), quack_eval_data(block[? "passage"]));
			break;

		case "pragma": // directives
			show_debug_message("QUACK: pragma command found.");
			script_execute(adapter, QUACK.pragma, state, quack_eval_data(block[? "key"]), quack_eval_data(block[? "value"]));
			break;

		case "import":
			var story = state[? "story"]
			var passages = story[? "passages"];
			ds_stack_push(callstack, [passages[? quack_eval_data(block[? "passage"])],0,true]);
			break;

		case "goto":
			var story = state[? "story"]
			var passages = story[? "passages"];
			var target_passage_name = quack_eval_data(block[? "passage"]);
			var target = passages[? target_passage_name];
			if (is_undefined(target)) {
				show_error("QUACK! Invalid target passage "+string(target_passage_name), true);
			}
			// TODO: warn of missing passage
			ds_stack_clear(callstack);
			ds_stack_push(callstack, [target, 0, true]);
			break;

		case "return":
			var finish = false;
			do{
				ds_stack_pop(callstack);
				var top = ds_stack_top(callstack);
				finish = top[2]==true || ds_stack_empty(callstack);
			}until(finish);
			break;

		default:
			show_error("QUACK! Invalid command block found!  Skipping block with command:"+string(block[? "type"]),false);
	}



}
