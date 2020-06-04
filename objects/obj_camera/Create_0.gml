alarm[0] = 1;

globalvar view_width, view_height;

true_pixel_mode = true;

view_width = 320;
view_height = 180;

following = player_character;
follow_spd = 0.5;

pixel_scale = 3;

window_set_size(view_width * pixel_scale, view_height * pixel_scale);

var surf_width = view_width;
var surf_height = view_height;

if (!true_pixel_mode) {
	surf_width *= pixel_scale;
	surf_height *= pixel_scale;
}
surface_resize(application_surface, surf_width, surf_height);