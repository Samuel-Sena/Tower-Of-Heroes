/// @description Insert description here

var chao = place_meeting(x, y + 1, obj_block);

if(!chao) 
{
	velv += GRAVIDADE * massa;
}

switch (state)
{
	case "idle":
	{
		if(sprite_index != skeleton_defend_idle)
		{
			image_index = 0;	
		}
		sprite_index = skeleton_defend_idle;
		
		if(position_meeting(mouse_x, mouse_y, self))
		{
			if(mouse_check_button_pressed(mb_left))
			{
				state = "hurt";	
			}
		}
		break;
	}
	case "hurt":
	{
		if (sprite_index != skeleton_defend_hurt)
		{
			image_index = 0;
			atual_vida--;
		}
		sprite_index = skeleton_defend_hurt;
		
		if (image_index > image_number-1)
		{
			if (atual_vida > 0)
			{
				state = "idle";
			}
			else if (atual_vida <= 0 )
			{
				state = "dead"	
			}
		}
		break;
	}
	case "dead":
	{
		if (sprite_index != skeleton_defend_dead)
		{
			image_index = 0;
		}
		sprite_index = skeleton_defend_dead;
		
		if (image_index > image_number-1)
		{
			image_speed = 0;
			image_alpha -= .01;
			
			if (image_alpha <= 0)
			{
				instance_destroy();
			}
		}
		break;	
	}
}