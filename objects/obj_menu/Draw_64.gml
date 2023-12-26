/// @description Insert description here
// You can write your code in this editor

draw_set_font(ft_menu);
draw_set_color(c_white);
for(i=0; i < op_max ; i++){
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	if(index==i){
	draw_set_color(c_yellow);
	}else{
	draw_set_color(c_white);
	}
	
	draw_text(1320,845+(55*i), opcao[i])
	}


