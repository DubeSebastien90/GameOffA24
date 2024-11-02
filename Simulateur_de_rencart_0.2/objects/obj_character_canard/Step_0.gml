/// @description Insert description here
// You can write your code in this editor

press_left = keyboard_check_pressed(vk_left);
press_right = keyboard_check_pressed(vk_right);

press_space = keyboard_check_pressed(vk_space);

if controle{
if press_left {

	if (!place_meeting(x - case_size, y, obj_wall)) {
		cooldownAnim = cooldownAnimMax
		x_future -= case_size;
		audio_play_sound_ext({sound: snd_boup, loop: false, pitch: random_range(0.9,1.1)})	
	}
}

if press_right {

	if (!place_meeting(x + case_size, y, obj_wall)) {
		cooldownAnim = cooldownAnimMax
		x_future += case_size;
		audio_play_sound_ext({sound: snd_boup, loop: false, pitch: random_range(0.9,1.1)})	
	}
}

if press_space {
	audio_play_sound_ext({sound: snd_pop, loop: false, pitch: random_range(0.9,1.1)})	
	instance_create_depth(x, y, depth+1, obj_bouffe);
}
}

x = lerp(x, x_future, 0.2);

//animation
if cooldownAnim > 0 {
	 image_index = 1
} else image_index = 0
cooldownAnim --