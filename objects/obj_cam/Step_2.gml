/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

camera_set_view_size(view_camera[0], global.view_width, global.view_height);

if(instance_exists(view_target)){
	var x1 = view_target.x - global.view_width / 2;
	var y1 = view_target.y - global.view_height / 2;
	
	x1 = clamp(x1,0,room_width - global.view_width);
	y1 = clamp(x1,0,room_height - global.view_height);

	var c_x = camera_get_view_x(view_camera[0]);
	var c_y = camera_get_view_y(view_camera[0]);

	camera_set_view_pos(view_camera[0], lerp(c_x, x1, view_spd), lerp(c_y, y1, view_spd));
}