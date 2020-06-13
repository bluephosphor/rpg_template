///@function quack_set_variable(variable, value)
///@arg variable
///@arg value
function quack_set_variable(argument0, argument1) {

	/*
		Sets a variable to a value
	*/
	var variable = argument0;
	var value = argument1;

	//Don't try to set nonvariables
	if(variable[? "type"] != "variable"){show_error("QUACK! You can only set variables!",true); exit;}

	//find the current value in the variable (used by all variables that have accessors)
	var current_value;
	if(variable[? "scope"] == "global")
		current_value = variable_global_get(variable[? "name"]);
	else
		current_value = variable_instance_get(id, variable[? "name"]);

	switch(variable[? "accessor"]){
		//regular variables
		default:
			if(variable[? "scope"] == "global")
				variable_global_set(variable[? "name"], value);
			else
				variable_instance_set(id, variable[? "name"], value);
			break;
	
		case "map":
			current_value[? quack_eval_data(variable[? "subscript"])] = value;
			break;
		case "list":
			current_value[| quack_eval_data(variable[? "subscript"])] = value;
			break;
		case "grid":
			current_value[# quack_eval_data(ds_list_find_value(variable[? "subscript"],0)),quack_eval_data(ds_list_find_value(variable[? "subscript"],1))] = value;
			break;
		case "array":
		case "array_direct":
			current_value[@ quack_eval_data(variable[? "subscript"])] = value;
			break;
		
		case "array_2d":
		case "array_2d_direct":
			current_value[@ quack_eval_data(ds_list_find_value(variable[? "subscript"],0)),quack_eval_data(ds_list_find_value(variable[? "subscript"],1))] = value;
			break;
	}


}
