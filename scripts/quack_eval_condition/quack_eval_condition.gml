///@function quack_eval_condition(block)
///@arg block
function quack_eval_condition(argument0) {

	/*
		Makes comparisons used by if statements.
	*/
	var cond = argument0;

	if (is_undefined(cond)) return true; // an else block has a null condition, and should always execute

	switch(cond[? "type"]){
		case "truthy": // truthiness test has no right condition
			return !!quack_eval_data(cond[? "left"]);
	
		case "==":
			return quack_eval_data(cond[? "left"])==quack_eval_data(cond[? "right"]);
		
		case "!=":
			return quack_eval_data(cond[? "left"])!=quack_eval_data(cond[? "right"]);
		
		case "<":
			return quack_eval_data(cond[? "left"])<quack_eval_data(cond[? "right"]);
		
		case "<=":
			return quack_eval_data(cond[? "left"])<=quack_eval_data(cond[? "right"]);
		
		case ">":
			return quack_eval_data(cond[? "left"])>quack_eval_data(cond[? "right"]);
		
		case ">=":
			return quack_eval_data(cond[? "left"])>=quack_eval_data(cond[? "right"]);
	}


}
