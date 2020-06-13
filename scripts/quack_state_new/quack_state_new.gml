///@function quack_state_new(quack_data, story_name, adapter)
///@arg quack_data - the quack data to use
///@arg story_name - the stroy name to create a state for
///@arg adapter - the adapter function that this state will use
function quack_state_new(argument0, argument1, argument2) {

	/*
		Called by the user to create a new quack_state. The quack_state is basically
		all the state variables of the quack object. In future this will be an LWO
	*/

	var quack_data = argument0;
	var stories = quack_data[? "stories"]
	var story = stories[? argument1]

	var state = ds_map_create();
	state[? "story"] = story;
	state[? "callstack"] = ds_stack_create(); // this is for non-atomic use
	state[? "adapter"] = argument2;

	state[? "passage"] = story[? "default"];

	state[? "active"] = false;

	return state


}
