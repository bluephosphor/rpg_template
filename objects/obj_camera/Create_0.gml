alarm[0] = 1;

globalvar view_width, view_height;

view_width = 320;
view_height = 180;

following = player_character;
follow_spd = 0.1;
pixel_scale = 3;

window_set_size(view_width * pixel_scale, view_height * pixel_scale);
surface_resize(application_surface, view_width * pixel_scale, view_height * pixel_scale);