///@function quack_call_function(function, arguments)
///@arg function
///@arg arguments
function quack_call_function(argument0, argument1) {
	var function_name = argument0;
	var arguments = argument1;

	var _function = asset_get_index(function_name);
	if (not script_exists(_function)) {
		show_error("QUACK! Script " + string(function_name) + " does not exist!", false);
		return undefined;
	}

	switch(ds_list_size(arguments)){
		case 0:
			return script_execute(_function);
		case 1:
			return script_execute(_function,arguments[|0]);
		case 2:
			return script_execute(_function,arguments[|0],arguments[|1]);
		case 3:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2]);
		case 4:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3]);
		case 5:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4]);
		case 6:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5]);
		case 7:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5],arguments[|6]);
		case 8:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5],arguments[|6],arguments[|7]);
		case 9:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5],arguments[|6],arguments[|7],arguments[|8]);
		case 10:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5],arguments[|6],arguments[|7],arguments[|8],arguments[|9]);
		case 11:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5],arguments[|6],arguments[|7],arguments[|8],arguments[|9],arguments[|10]);
		case 12:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5],arguments[|6],arguments[|7],arguments[|8],arguments[|9],arguments[|10],arguments[|11]);
		case 13:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5],arguments[|6],arguments[|7],arguments[|8],arguments[|9],arguments[|10],arguments[|11],arguments[|12]);
		case 14:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5],arguments[|6],arguments[|7],arguments[|8],arguments[|9],arguments[|10],arguments[|11],arguments[|12],arguments[|13]);
		case 15:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5],arguments[|6],arguments[|7],arguments[|8],arguments[|9],arguments[|10],arguments[|11],arguments[|12],arguments[|13],arguments[|14]);
		case 16:
			return script_execute(_function,arguments[|0],arguments[|1],arguments[|2],arguments[|3],arguments[|4],arguments[|5],arguments[|6],arguments[|7],arguments[|8],arguments[|9],arguments[|10],arguments[|11],arguments[|12],arguments[|13],arguments[|14],arguments[|15]);
	}


}
