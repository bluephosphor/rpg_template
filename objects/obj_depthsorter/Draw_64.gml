var dgrid = ds_depthgrid, str;
var yy = 0; repeat(ds_grid_height(dgrid)){
	str = "[" + string(dgrid[# 0,yy]) + "," + string(dgrid[# 1,yy]) + "]";
	draw_text(0,8 * yy,str);
	yy++;
}