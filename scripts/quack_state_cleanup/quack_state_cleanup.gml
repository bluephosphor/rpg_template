///@function quack_state_cleanup(quack_state)
///@arg quack_state - the quack state data to cleanup
function quack_state_cleanup(argument0) {

	/*
		Since quack_state_new() returns a ds_map, the opposite action: quack_state_cleanup() should just take
		this ds_map and ds_map_destroy() it.
	*/

	var state = argument0;

	var callstack = state[? "callstack"]
	ds_stack_destroy(callstack);

	ds_map_destroy(state);


}
