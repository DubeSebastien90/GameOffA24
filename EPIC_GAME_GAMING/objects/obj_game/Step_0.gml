//contôles
press_space = keyboard_check_pressed(vk_space)
press_up = keyboard_check_pressed(vk_up)
press_down = keyboard_check_pressed(vk_down)

if press_up{
	replique_actuelle -= 1
	replique_actuelle = max(replique_actuelle,0)
}

if press_down{
	replique_actuelle += 1
	replique_actuelle = min(replique_actuelle,nb_repliques)
}