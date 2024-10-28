//endigns

//setup
max_cooldown_space = 30
cooldownSpace = 0

scene_actuelle = noone

//affichage
image = spr_intro_1

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
	
	sc_intro_2.next_scene[0] = sc_intro_3
	sc_intro_2.next_scene[1] = sc_intro_3
}

//scenes
sc_intro_1 = instance_create_depth(0,0,-1000,obj_scene)
sc_intro_2 = instance_create_depth(0,0,-1000,obj_scene)
sc_intro_3 = instance_create_depth(0,0,-1000,obj_scene)

with (sc_intro_1){
	image = spr_intro_1
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Oh tiens regarde, un nouveau match sur Tinda!"
	dialogue[1] = "Oh mon dieu qu'elle est belle! C'est certainement la femme de ma vie"
}

with (sc_intro_2){
	image = spr_intro_2
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Mais non! Que faire! Je suis un robot, mes émotions sont simulées par des circuits électriques..."
	dialogue[1] = "Personne ne voudra de moi pour une relation à caractère romantique"

}

with (sc_intro_3){
	image = spr_intro_3
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Une chance qu'un aveugle passait dans le coin, j'ai pu me dénicher un beau déguisement"
	dialogue[1] = "Le plan est INFAILLIBLE! Avec ces habits, elle n'y verra que du feu"

}

setDependances()
setNextScene(sc_intro_1)
