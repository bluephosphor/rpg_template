///@function quack_load(filename)
///@arg filename - the quack file to load
function quack_load(argument0) {

	/*
		Called by the user to load a quack file, and return it as a ds_map.
		This quack file needs to be passed to quack_start_conversation to find
	*/

	if (not file_exists(argument0)) {
		show_error("QUACK! Quack file does not exist", true);	
	}

	if (os_browser != browser_not_a_browser) {
		// special browser workaround due to weirdness
		var file = file_text_open_read(argument0);
		var str = ""
		while(! file_text_eof(file)) {
		   str += file_text_readln(file)
		}
		file_text_close(file);
	}
	else {
		// desktop can use buffer functions and also compression
		show_debug_message("QUACK: Loading file " + string(argument0))
		var buff = buffer_load(argument0);
		var b64str = buffer_read(buff, buffer_text);
		buffer_delete(buff);
	
		var buff = buffer_base64_decode(b64str);
		var decompress = buffer_decompress(buff);

		if (decompress >= 0) { // successful decompress
			var str = buffer_read(decompress, buffer_text);
			show_debug_message("QUACK: File is compressed+JSON");
			buffer_delete(decompress);
		}
		else { // unsuccessful decompress
			show_debug_message("QUACK: File is JSON");
			var str = buffer_read(buff, buffer_text);
		}
		buffer_delete(buff);
	}

	var quack = json_decode(str);

	if (quack < 0) { // unsuccessful json read
		show_error("QUACK! Could not decode quack file " + string(argument0), true);	
	}

	return quack;


}
