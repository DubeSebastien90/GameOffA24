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
	} else {
		switch(scene_actuelle){
			case sc_resto_explosion:
				nb_unlocked +=1
				unlock[nb_unlocked] = 1
				break;
			case sc_etang_skinny_dip:
				nb_unlocked +=1
				unlock[nb_unlocked] = 2
				break;
			case sc_resto_vers_eau:
				nb_unlocked +=1
				unlock[nb_unlocked] = 3
				break;
			case sc_resto_demasquage:
				nb_unlocked +=1
				unlock[nb_unlocked] = 4
				break;
			case sc_kiss_fille:
				nb_unlocked +=1
				unlock[nb_unlocked] = 5
				break;
			case sc_kiss_canard:
				nb_unlocked +=1
				unlock[nb_unlocked] = 6
				break;
			case sc_f_bateau:
				nb_unlocked +=1
				unlock[nb_unlocked] = 7
				break;
			case sc_f_robot_ending_3:
				nb_unlocked +=1
				unlock[nb_unlocked] = 8
				break;
			case sc_f_dog:
				nb_unlocked +=1
				unlock[nb_unlocked] = 9
				break;
			case sc_f_robot_sex:
				nb_unlocked +=1
				unlock[nb_unlocked] = 10
				break;
			case sc_mort_voiture:
				nb_unlocked +=1
				unlock[nb_unlocked] = 11
				break;
			default:
				break;
		}
		
		setNextScene(scene_actuelle.next_scene[replique_actuelle])
	}
	
}
cooldown_space -= 1

} else if room != rm_questions {
	if keyboard_check_pressed(ord("S")){
		returnVal = 1
	}
	if returnVal != -1{
		setNextScene(scene_actuelle.next_scene[returnVal])
	}
}