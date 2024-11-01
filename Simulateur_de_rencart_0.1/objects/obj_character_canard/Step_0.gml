/// @description Insert description here
// You can write your code in this editor

press_left = keyboard_check_pressed(vk_left);
press_right = keyboard_check_pressed(vk_right);

press_space = keyboard_check_pressed(vk_space);

if press_left {

	if (!place_meeting(x - case_size, y, obj_wall)) {
	
		x_future -= case_size;
	}
}

if press_right {

	if (!place_meeting(x + case_size, y, obj_wall)) {
		
		x_future += case_size;
	}
}

if press_space {
	instance_create_depth(x, y, -100, obj_bouffe);
}

x = lerp(x, x_future, 0.1);