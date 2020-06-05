//resize grid
var dgrid = ds_depthgrid;
var inst_num = instance_number(par_depthobject);
ds_grid_resize(dgrid,2,inst_num);

//add info to grid
var yy = 0; with(par_depthobject){
	dgrid[# 0,yy] = id;
	dgrid[# 1,yy] = y;
	yy++;
}

//sort grid
ds_grid_sort(dgrid,1,true);

//loop through grid and draw insts
yy = 0; var inst; repeat(inst_num){
	//get id
	inst = dgrid[# 0, yy];
	// get inst to draw itself
	with(inst){
		event_perform(ev_draw,0);
	}
	yy++;
}