///@function quack_unload(quack_data)
///@arg quack_data - the quack_data to cleanup
function quack_unload(argument0) {

	/*
		Since quack_load() returns a ds_map, the opposite action: quack_unlod() should just take
		this ds_map and ds_map_destroy() it.
	*/

	ds_map_destroy(argument0);


}
