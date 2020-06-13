///@function quack_eval_data(block)
///@arg block
function quack_eval_data(argument0) {

	/*
		Main data evaluator function.
		Determines what kind of information a block contains
		and returns that information.
	*/
	var block = argument0;

	switch(block[? "type"]){
		case "variable":
			var res = quack_eval_variable(block);
			return res;
	
		case "number_literal":
		case "string_literal":
			return block[? "value"];
		
		case "function_call":
			// evaluate arguments
			var args = ds_list_create()
			for (var i=0; i<ds_list_size(block[? "arguments"]); i++) {
				var arg = block[? "arguments"];
				ds_list_add(args, quack_eval_data(arg[| i]))
			}
			var retval = quack_call_function(block[? "value"], args);
			ds_list_destroy(args);
			return retval;
		
		case "undefined":
			return undefined;
	}


}
