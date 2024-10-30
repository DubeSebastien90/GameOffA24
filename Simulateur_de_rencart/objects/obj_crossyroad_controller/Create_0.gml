/// @description Insert description here
// You can write your code in this editor

cooldown_fin = 60

mort = false
succes = false

level = obj_game.more_info;
cooldowns = [];
lanes = [];
nb_lanes = 6;

cooldowns[0] = random_range(0,50);
cooldowns[1] = random_range(0,50);
cooldowns[2] = random_range(0,50);
cooldowns[3] = random_range(0,50);
cooldowns[4] = random_range(0,50);
cooldowns[5] = random_range(0,50);


if level = 0 {
	
	lanes[0] = 64;
	lanes[1] = 80;
	lanes[2] = 128;
	lanes[3] = 144;
	lanes[4] = 192;
	lanes[5] = 208;

	instance_create_depth(0, 64, -100, obj_character);

	with(instance_create_depth(240, 48, -100, obj_objectif)) {
	
		image_xscale = 2;
		image_yscale = 4;
	}
	
	with(instance_create_depth(32, 0, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 2
	}
	with(instance_create_depth(32, 64, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 3;
	}
	with(instance_create_depth(96, 32, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 2;
	}
	with(instance_create_depth(96, 112, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 3;
	}
	with(instance_create_depth(160, 16, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 3;
	}
	with(instance_create_depth(160, 128, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 2;
	}
} else {

	lanes[0] = 48;
	lanes[1] = 64;
	lanes[2] = 112;
	lanes[3] = 128;
	lanes[4] = 176;
	lanes[5] = 192;
	
	instance_create_depth(256, 64, -100, obj_character)
	instance_create_depth(256, 48, -100, obj_eve)
	
	with(instance_create_depth(0, 32, -100, obj_objectif)) {
	
		image_xscale = 2;
		image_yscale = 5;
	}
	
	with(instance_create_depth(80, 0, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 2
	}
	with(instance_create_depth(80, 64, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 3;
	}
	with(instance_create_depth(144, 16, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 3;
	}
	with(instance_create_depth(144, 112, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 3;
	}
	with(instance_create_depth(208, 0, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 3;
	}
	with(instance_create_depth(208, 96, -100, obj_wall)) {
	
		image_xscale = 2;
		image_yscale = 2;
	}
}