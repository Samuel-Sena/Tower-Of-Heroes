/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
resolution_width = 1920;
resolution_height = 1080;
resolution_scale = 1;
global.view_width = resolution_width / resolution_scale;
global.view_height = resolution_height / resolution_scale;
view_target = obj_player_male;
view_spd = 0.1;
window_set_size(global.view_width * resolution_scale, global.view_height * resolution_scale);
surface_resize(application_surface, global.view_width * resolution_scale, global.view_height * resolution_scale);
display_set_gui_size(global.view_width, global.view_height);