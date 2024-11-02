/// @description Insert description here
// You can write your code in this editor

var _moi = self

if nb_fed == goal_fed {
	fin = 1
	obj_character_canard.controle = false
}
if temps > tempsJeu{
	fin = 0
	obj_character_canard.controle = false
}

if fin != -1{
	if cooldownFin < 0{
		obj_game.returnVal = fin
	}
	cooldownFin -= 1
} else temps ++


if cooldown < 0{
	var side = choose(0,1)
	var _x
	_x[0] = -15
	_x[1] = room_width+15
	with(instance_create_depth(_x[side],random_range(30,room_height-30-32),depth-1000,obj_canard)){
		if side = 1{
			image_xscale*= -1
		}
	}
	cooldown = random_range(70,150)
}
cooldown--





