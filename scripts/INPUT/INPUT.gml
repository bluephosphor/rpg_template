function init_input(){
	globalvar input; 

	enum key {
		right,
		up,
		left,
		down,
		action,
		menu
	}

	input = ds_list_create();
	data_structures[ds_index++] = input;

	input[| key.right]	= vk_right;
	input[| key.up]		= vk_up;
	input[| key.left]	= vk_left;
	input[| key.down]	= vk_down;
	input[| key.action]	= ord("Z");
	input[| key.menu]	= ord("X");
	
}