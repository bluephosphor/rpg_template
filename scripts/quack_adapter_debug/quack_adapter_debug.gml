///@function quack_adapter_debug(...)
function quack_adapter_debug() {

	/*
		A debug adapter that does nothing but output debug vallues
	*/

	if (argument_count > 1) {
		//var state = argument[1];
	}

	switch(argument[0]) {
		case QUACK.can_create:
			// creation guard: return false here to abort creation (example usage: to avoid
			// re-triggering the dialogue system when one is already running)
			return true;

		case QUACK.create:
			show_debug_message("ADAPTER: create")
			break;

		case QUACK.say:
			show_debug_message("ADAPTER: say " + string(argument[2]));
			break;

		case QUACK.newpage:
			show_debug_message("ADAPTER: newpage");
			break;

		case QUACK.option:
			show_debug_message("ADAPTER: option " + string(argument[2]) + " => " + string(argument[3]));
			break;

		case QUACK.pragma:
			show_debug_message("ADAPTER: pragma " + string(argument[2]) + " => " + string(argument[3]));
			break;

		case QUACK._finally:
			show_debug_message("ADAPTER: finally")
			break;

		case QUACK.is_atomic:
			return true;
	}


}
