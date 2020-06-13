function quack_adapter(){
	switch(argument[0]){
		case QUACK.can_create: 
			if (textbox != noone) {
			  return false;
			}
			return true;
		break;
		case QUACK.create: 
		
		break;
		case QUACK.say: 
		
		break;
		case QUACK.newpage: 
		
		break;
		case QUACK.option: 
		
		break;
		case QUACK.pragma: 
		
		break;
		case QUACK._finally: 
		
		break;
		case QUACK.is_atomic: 
		
		break;
	}
}