//contôles
press_space = keyboard_check_pressed(vk_space)
press_up = keyboard_check_pressed(vk_up)
press_down = keyboard_check_pressed(vk_down)

if scene_actuelle != noone{

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
			default:
				break;
		}
		
		setNextScene(scene_actuelle.next_scene[replique_actuelle])
	}
	
}
cooldown_space -= 1

}