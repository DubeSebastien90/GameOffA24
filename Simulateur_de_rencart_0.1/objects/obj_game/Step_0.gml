//contôles
press_space = keyboard_check_pressed(vk_space)
press_up = keyboard_check_pressed(vk_up)
press_down = keyboard_check_pressed(vk_down)

if scene_actuelle != noone && room == rm_questions{

if press_up{
	replique_actuelle -= 1
	replique_actuelle = max(replique_actuelle,0)
}

if press_down{
	replique_actuelle += 1
	replique_actuelle = min(replique_actuelle,scene_actuelle.nb_repliques-1)
}

if press_space && cooldown_space < 0{
	cooldown_space = max_cooldown_space
	if dialogue_actuel < scene_actuelle.nb_dialogues-1{
		dialogue_actuel += 1
		replique_actuelle = 0
	} else {
		switch(scene_actuelle){
			case sc_resto_explosion:
				unlock[0] = 1
				break;
			case sc_etang_skinny_dip:
				unlock[1] = 1
				break;
			case sc_resto_vers_eau:
				unlock[2] = 1
				break;
			case sc_resto_demasquage:
				unlock[3] = 1
				break;
			case sc_kiss_fille:
				unlock[4] = 1
				break;
			case sc_kiss_canard:
				unlock[5] = 1
				break;
			case sc_f_bateau:
				unlock[6] = 1
				break;
			case sc_f_robot_ending_3:
				unlock[7] = 1
				break;
			case sc_f_dog:
				unlock[8] = 1
				break;
			case sc_f_robot_sex:
				unlock[9] = 1
				break;
			case sc_mort_voiture:
				unlock[10] = 1
				break;
			default:
				break;
		}
		
		setNextScene(scene_actuelle.next_scene[replique_actuelle])
	}
	
}
cooldown_space -= 1

} else if room != rm_questions {
	if keyboard_check_pressed(ord("S")) && TRICHERIE = true{
		returnVal = 1
	}
	if returnVal != -1{
		setNextScene(scene_actuelle.next_scene[returnVal])
	}
}