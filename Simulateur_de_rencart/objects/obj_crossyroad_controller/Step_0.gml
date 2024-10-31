/// @description Insert description here
// You can write your code in this editor

if mort{
	if cooldown_fin <= 0{
	obj_game.returnVal = 0
	}
	cooldown_fin --
}

if succes{
	if cooldown_fin <= 0{
	obj_game.returnVal = 1
	}
	cooldown_fin --
}


if cooldowns[0] < 0 {

	instance_create_depth(lanes[0], -50, -100, obj_car);

}
if cooldowns[1] < 0 {
	
	with(instance_create_depth(lanes[1], 194, -100, obj_car)) {
		cote = -1
	}

}
if cooldowns[2] < 0 {

	instance_create_depth(lanes[2], -50, -100, obj_car);

}
if cooldowns[3] < 0 {
	
	with(instance_create_depth(lanes[3], 194, -100, obj_car)) {
		cote = -1;
	}

}
if cooldowns[4] < 0 {

	instance_create_depth(lanes[4], -50, -100, obj_car);

}
if cooldowns[5] < 0 {
	
	with(instance_create_depth(lanes[5], 194, -100, obj_car)) {
		cote = -1;
	}

}

for (var i = 0; i < nb_lanes; i++) {
	
	if cooldowns[i] < 0 {
		cooldowns[i] = random_range(170, 270);
	} else {
		cooldowns[i]--;
	}
}