#macro FRAMERATE 60
#macro CELLSIZE 32
#macro VIEW view_camera[0]

function vec2(x,y) constructor {
	self.x = x;
	self.y = y;
}

function draw_vars_list(x,y,obj){
	var list = variable_instance_get_names(obj);
	var i = 0, vn, vv; repeat(array_length(list)){
		vn = list[i];
		vv = variable_instance_get(obj,vn);
		draw_text(x, y + (8 * i), vn + ": " + string(vv));
		i++;
	}
}