//endigns

//setup
max_cooldown_space = 30
cooldownSpace = 0

scene_actuelle = noone

//affichage
image = spr_intro

nb_dialogues = 0
dialogue_actuel = 0
dialogue[0] = ""

nb_repliques = 3
replique_actuelle = 0
replique[0] = ""


function setNextScene(scene){
	scene_actuelle = scene
	replique_actuelle = 0
	dialogue_actuel = 0
}

function setDependances(){
	sc_intro_1.next_scene[0] = sc_intro_2
	sc_intro_1.next_scene[1] = sc_intro_2
	
	sc_intro_2.next_scene[0] = sc_intro_1
}

//scenes
sc_intro_1 = instance_create_depth(0,0,-1000,obj_scene)
sc_intro_2 = instance_create_depth(0,0,-1000,obj_scene)

with (sc_intro_1){
	image = spr_intro
	nb_repliques = 2
	nb_dialogues = 2
	replique[0] = "Replique 1"
	replique[1] = "Replique 2"
	dialogue[0] = "Dialogue 1"
	dialogue[1] = "Dialogue 2"
}

with (sc_intro_2){
	image = spr_intro_2
	nb_repliques = 1
	nb_dialogues = 3
	replique[0] = "Replique 1 pipi"
	dialogue[0] = "Dialogue 1 pipi"
	dialogue[1] = "Dialogue 2 pipi"
	dialogue[2] = "Dialogue 3 pipi"

}

setDependances()
setNextScene(sc_intro_1)
