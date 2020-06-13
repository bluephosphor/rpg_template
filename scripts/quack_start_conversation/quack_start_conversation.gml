///@function quack_start_conversation(quack_state)
///@arg quack_state - the ds_map containing the quack state
function quack_start_conversation() {

	/*
		Called by a regular instance to start a conversation that is managed by Quack.
		quack_state contains the state variables
	*/

	enum QUACK {
		can_create,
		create,
		say,
		newpage,
		option,
		pragma,
		_finally,
		is_atomic
	}

	var state = argument0

	var story = state[? "story"]
	var this_passage = state[? "passage"]

	var passages = story[? "passages"];
	var passage_node = passages[? this_passage];

	var adapter = state[? "adapter"];
	var callstack = state[? "callstack"];

	if (not script_execute(adapter, QUACK.can_create)) {
		return;
	}

	ds_stack_push(callstack, [passage_node, 0, true]);

	// adapter start
	script_execute(adapter, QUACK.create, state);

	// parse
	if (script_execute(adapter, QUACK.is_atomic)) {
		while(!quack_check_end(callstack)){
			quack_eval_command(state);
		}
	}

	// adapter end
	script_execute(adapter, QUACK._finally, state);


}
