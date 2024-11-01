/// @description Insert description here
// You can write your code in this editor

var _moi = self

if nb_fed == 10 {
	obj_game.returnVal = 1
}


if cooldowns[0] < 0 {

	with(instance_create_depth(create_x[0], create_y[0], -100, obj_canard)) {
		
		cote[0] = cos(_moi.angles[0])
		cote[1] = sin(_moi.angles[0])
	}
}
if cooldowns[1] < 0 {

	with(instance_create_depth(create_x[1], create_y[1], -100, obj_canard)) {
		
		cote[0] = -cos(_moi.angles[1])
		cote[1] = -sin(_moi.angles[1])
	}
}
if cooldowns[2] < 0 {

	with(instance_create_depth(create_x[2], create_y[2], -100, obj_canard)) {
		
		cote[0] = -cos(_moi.angles[2])
		cote[1] = -sin(_moi.angles[2])
	}
}


for (var i = 0; i < nb_spawn; i++) {
	
	if angles[i] < angles_min_max[i][0] or angles[i] > angles_min_max[i][1] {
	
		angles_variations[i] = -angles_variations[i]
		
		angles[i] += angles_variations[i]
	} else {
		angles[i] += angles_variations[i]
	}
	
}

for (var i = 0; i < nb_spawn; i++) {

	if cooldowns[i] < 0 {
		cooldowns[i] = random_range(100, 200)
	} else {
		cooldowns[i]--;
	}
}




