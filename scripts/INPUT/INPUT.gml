function init_input(){
	globalvar input; 

	enum key {
		right,
		up,
		left,
		down
	}

	input = ds_list_create();

	input[| key.right]	= vk_right;
	input[| key.up]		= vk_up;
	input[| key.left]	= vk_left;
	input[| key.down]	= vk_down;
	
	data_structures[ds_index++] = input;
}