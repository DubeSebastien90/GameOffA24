press_space = keyboard_check(vk_space)

//bobber
if press_space{
	acc = -0.12
} else acc = grav

vspd += acc

if fin == -1{
	my_bobber.y += vspd
}

if my_bobber.y < 15{
	my_bobber.y = 15
	vspd = -vspd*0.5
}

if my_bobber.y > 15+jauge_size-bobber_size{
	my_bobber.y =  15+jauge_size-bobber_size
	vspd = -vspd *0.5
}

//icon
if fin == -1{
	my_icon.y = lerp(my_icon.y,y_dir,0.05)
}

if cooldown_dir < 0{
	cooldown_dir = random_range(60,160)
	y_dir = random_range(min_pos,max_pos)
}

cooldown_dir--

if fin == -1{
	var _moi = self
	with(my_bobber){
		if place_meeting(x,y,_moi.my_icon){
			_moi.temps_rendu += 1
			_moi.cle_x_dir = random_range(-5,5)
			_moi.cle_y_dir = random_range(-5,5)
		} else _moi.temps_rendu -= 1
	}
	if temps_rendu <= 0{
		fin = 0
		cle_x_dir = -70
		cle_y_dir = -100
		buff = 0.02
	}
	if temps_rendu > win_condition{
		fin = 1
		cle_x_dir = +140
		cle_y_dir = +200
		buff = 0.02
	}

} else {
	cooldown_fin -= 1
	if cooldown_fin < 0{
		obj_game.returnVal = fin
	}
}

cle_x = lerp(cle_x,cle_x_dir,buff)
cle_y = lerp(cle_y,cle_y_dir,buff)
