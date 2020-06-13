///@function quack_check_end()
function quack_check_end(argument0) {

	/*
		Check if a conversation managed by Quack has reached its end.  If it has ended,
		the Quack manager is destroyed.
	
		Also pops the callstack
		when reaching the end of a block.
	*/
	var conversation = ds_stack_top(argument0);
	var command_list = conversation[0];
	var cursor = conversation[1];

	if(cursor >= ds_list_size(command_list)){
		ds_stack_pop(argument0);
		if(ds_stack_empty(argument0)){
			show_debug_message("QUACK: Conversation complete.");
			return true;
		}
		else{
			show_debug_message("QUACK: Block complete. Popping the callstack.");
			return quack_check_end(argument0);
		}
	}

	return false;


}
