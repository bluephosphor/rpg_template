/// @desc the script which sets the passage in the state
/// @param state the quack_state containing the passage
/// @param passage the name of the passage to write
function quack_state_set_passage(argument0, argument1) {

	var state = argument0;
	var passage = argument1;

	state[? "passage"] = passage;

	show_debug_message("QUACK: Passage set to " + string(passage));


}
