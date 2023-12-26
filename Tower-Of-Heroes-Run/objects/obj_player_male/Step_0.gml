/// @description 

//Start variables 

var right, left, jump, attack_base, shift, backstep, block;
var chao = place_meeting(x, y + 1, obj_block);

right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));
shift = keyboard_check(vk_shift);
jump = keyboard_check(ord("W")) || keyboard_check(vk_space);
backstep = keyboard_check(ord("Q"));
block = mouse_check_button_pressed(mb_right) || keyboard_check(ord("K"));
attack_base = mouse_check_button(mb_left) || keyboard_check(ord("J"));

if (keyboard_check_pressed(ord("R"))) {
     scr_reset_game(); // Chama o script (scr_reset_game) de reset do jogo
}

//Step

velh = (right - left) * max_velh;

//Aplicando gravidade

if(!chao) 
{
	velv += GRAVIDADE * massa;
}
else 
{
	if(jump) //Jump
	{
		velv = -max_velv;
	}
}

//Switch state
switch(state)
{
	case "idle":
	{
		//state idle
		sprite_index = play_male_idle;
		
		//trade statues from 
		//walk
		if (right or left)
		{
			state = "walk";
		}
		//run right
		else if (right and keyboard_check_pressed(shift)) 
		{
			state = "run_right";
		}
		//run left
		else if (left and keyboard_check_pressed(shift)) 
		{
			state = "run_left";
		}
		//jump
		else if (jump or velv != 0) 
		{
			state = "jump_move_walk";
			velv = (-max_velv * jump);
		}
		//back
		else if (backstep)
		{
			state = "backstep";  	
		}
		else if (block)
		{
			state = "defend";
		}
		
		else if (attack_base)
		{
			state = "attack_base";
			velh = 0;
			image_index = 0;
			combo = 1;
		}
		break;
	}
	
	case "walk":
	{
		//action walk
		sprite_index = play_male_walk;
		
	    //condition trade status
	    //stop
		if (abs(velh) < .1)
		{
			state = "idle";
			velh = 0;
		}	
		else if (jump)
		{
			state = "jump_move_walk";
			velv = -max_velv;
		}
		else if (shift and right)
		{
			state = "run_right";	
		}
		else if (shift and left)
		{
			state = "run_left";	
		}
		else if (block)
		{
			state = "defend";
		}
		else if (attack_base)
		{
			state = "attack_base";
		}
		else if (attack_base and right)
		{
			state = "attack_base";
		}
		break;
	 }	
	 
   	 case "run_right":
	 {
		//action run right
		sprite_index = play_male_run;
		
		velh = 8.3;	
		
		//condition trade status
		//stop
		if (keyboard_check_released(shift))
		{
			state = "idle";
			velh = 0;
		}	
		
		else if (left and keyboard_check_pressed(shift)) 
		{
			state = "run_left";
		}
		
		else if (jump)
		{
			state = "jump_move_run_right";
			velv = -max_velv;
		}
		else if (block)
		{
			state = "defend";
		}
		else if (attack_base)
		{
			state = "attack_base";
		}
		break;
	 }	
	
	 case "run_left":
	 {
		 //action run left
		 sprite_index = play_male_run;
		
		 velh = -8.3;	
		
		 //condition trade status
		 //stop
		 if (keyboard_check_released(shift))
		 {
			 state = "idle";
		   	 velh = 0;
		 }	
		 else if (right and keyboard_check_pressed(shift)) 
		 {
			 state = "run_right";
		 }
		 else if (jump)
		 {
			state = "jump_move_run_left";
			velv = -max_velv;
		 }
		 else if (block)
		 {
			state = "defend";
		 }
		 else if (attack_base)
		 {
			state = "attack_base";
		 }
		 break;
	 }
	 
     case "jump_move_walk":
	 {
		 if (velv > 0)
		 {
			 sprite_index = play_male_jump_fall;
		 }	
	     else 
		 {
			 sprite_index = play_male_jump_up;
			 
			 if(image_index >= image_index-1)
			 {
			 image_index = image_number-1;
			 } 
		 }
		
		 if(chao)
		 {
			 state = "idle";	
		 }
		 break;
	 }	
	 
	 case "jump_move_run_right":
	 {
		 velh = 6;
		 
		 if (velv > 0)
		 {
			 sprite_index = play_male_jump_fall;
		 }	
	     else 
		 {
			 sprite_index = play_male_jump_up;
			 
			 if(image_index >= image_index-1)
			 {
			 image_index = image_number-1;
			 } 
		 }
		
		 if(chao)
		 {
			 state = "idle";	
		 }
		 break;
	 }	
	 
	  case "jump_move_run_left":
	 {
		 velh = -6;
		 
		 if (velv > 0)
		 {
			 sprite_index = play_male_jump_fall;
		 }	
	     else 
		 {
			 sprite_index = play_male_jump_up;
			 
			 if(image_index >= image_index-1)
			 {
			 image_index = image_number-1;
			 } 
		 }	
		
		 if(chao)
		 {
			 state = "idle";	
		 }
		 break;
	 }	
	 
	 case "backstep":
	 {
		 sprite_index = play_male_jump_back;
		 velh = -7.8;
		 break;
	 }	 
	
	 case "defend":
	 {
		 sprite_index = play_male_block_01;
		 velh = 0;
		 velv = 0;
		 right = velh;
	     left = velh;
		 
		 if (mouse_check_button_released(mb_right) || keyboard_check_released(ord("K")))
		 {
			 state = "idle";
		 }
		 else if (attack_base)
		 {
			state = "attack_base";
		 }
	     break;
	 }
	 
	 case "attack_base":
	 {
		 velh = 0;
		 if (combo == 1)
		 {
			sprite_index = play_male_attack_base;
			right = velh;
			left = velh;
		 }
		 else if (combo == 2)
		 {
			sprite_index = play_male_attack_base02;
			right = velh;
			left = velh;
		 }
		 else if (combo == 3)
		 {
			sprite_index = play_male_attack_base03;
			right = velh;
			left = velh;
		 }
		 if (attack_base and combo < 3 and image_index >= image_number-1)
		 {
			combo++;	 
			image_index = 0;
		 }
		 if(image_index > image_number-1)
	     {
			state = "idle";
			combo = 1;
		 } 
		 if (block)
		 {
			state = "defend";
		 }
		 break; 
	 }	
}	

