var ds, i, str;
for (i = 0; i < array_length(data_structures); i++){
	ds = data_structures[i];
	if (ds_exists(ds,ds_type_list)) {
		ds_list_destroy(ds);
		str = "list";
	}
	else if (ds_exists(ds,ds_type_grid)) {
		ds_grid_destroy(ds);
		str = "grid";
	}
	else if (ds_exists(ds,ds_type_map)) {
		ds_map_destroy(ds);
		str = "map";
	}
	if (is_string(str)) show_debug_message("Destroyed a " + str + "!");
}