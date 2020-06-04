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
input[| key.right]	= vk_left;
input[| key.right]	= vk_down;