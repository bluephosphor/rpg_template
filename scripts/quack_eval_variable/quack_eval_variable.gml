///@function quack_eval_variable(block)
///@arg block
function quack_eval_variable(argument0) {

	/*
		Called by quack_eval_data
		when a block contains variable information.
	
		Finds the information in that
		variable and returns it.
	*/
	var block = argument0,value;
	show_debug_message("QUACK: Variable "+block[? "name"]);

	//get variable value based on scope
	switch(block[? "scope"]){
		case "global":
			value = variable_global_get(block[? "name"]);
			break;
		case "instance":
			// also possible for it to be a resource name, check for that instead
			if (asset_get_index(block[? "name"]) > -1) {
				// it's a resource asset
				value = asset_get_index(block[? "name"]);;
			}
			else if (variable_instance_exists(id, block[? "name"])) {
				value = variable_instance_get(id, block[? "name"]);	
			}
			else {
				show_error("QUACK! Variable " + block[? "name"] + " not found", false);
				return undefined;	
			}
			break;
	}

	//dig deeper when accessor is present
	switch(block[? "accessor"]){
		default:
			return value;
	
		case "map":
			return value[? quack_eval_data(block[? "subscript"])];
		
		case "list":
			return value[| quack_eval_data(block[? "subscript"])];
		
		case "grid":
			return value[# quack_eval_data(ds_list_find_value(block[? "subscript"],0)), quack_eval_data(ds_list_find_value(block[? "subscript"],1))];
		
		case "array":
			return value[quack_eval_data(block[? "subscript"])];
	
		case "array_direct":
			return value[@ quack_eval_data(block[? "subscript"])]
		
		case "array_2d":
			return value[quack_eval_data(ds_list_find_value(block[? "subscript"],0)), quack_eval_data(ds_list_find_value(block[? "subscript"],1))];
		
		case "array_2d_direct":
			return value[@ quack_eval_data(ds_list_find_value(block[? "subscript"],0)), quack_eval_data(ds_list_find_value(block[? "subscript"],1))];
	}


}
