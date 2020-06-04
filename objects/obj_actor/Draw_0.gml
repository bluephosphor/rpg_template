draw_self();

draw_set_font(fnt_debug);

var list = variable_instance_get_names(self);

var i = 0, vn, vv; repeat(array_length(list)){
	vn = list[i];
	vv = variable_instance_get(self,vn);
	draw_text(0, 8 * i, vn + ": " + string(vv));
	i++;
}