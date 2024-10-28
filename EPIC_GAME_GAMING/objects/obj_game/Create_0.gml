//endigns
nb_unlocked = 0
unlock[0] = 0

//setup
max_cooldown_space = 30
cooldown_space = 0

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
	sc_restart.next_scene[0] = sc_intro_1
	//intro
	sc_intro_1.next_scene[0] = sc_intro_2
	sc_intro_2.next_scene[0] = sc_intro_3
	sc_intro_3.next_scene[0] = sc_resto
	
	//resto
	sc_resto.next_scene[0] = sc_resto_serveur
	sc_resto.next_scene[1] = sc_resto_serveur
	sc_resto.next_scene[2] = sc_resto_explosion
		
	sc_resto_explosion.next_scene[0] = sc_restart
	
	//Serveur
	sc_resto_serveur.next_scene[0] = sc_resto_vers_eau
	sc_resto_serveur.next_scene[1] = sc_resto_vers_huile
	sc_resto_serveur.next_scene[2] = sc_resto_spag
	sc_resto_serveur.next_scene[3] = sc_resto_toilette
	
	//branch toilettes
	sc_resto_toilette.next_scene[0] = sc_resto_demasquage
	sc_resto_demasquage[0] = sc_restart
	
	//branch huile
	sc_resto_vers_huile[0] = sc_resto_apres_huile
	
	//branch spaghatt
	sc_resto_spag[0] = sc_resto_apres_spag
	
	//branch eau
	sc_resto_vers_eau[0] = sc_restart
	
	//on cloît le restaurant 
	
	sc_resto_apres_huile[0] = sc_resto_demande_next_activite
	sc_resto_apres_spag[0] = sc_resto_demande_next_activite
}

//scenes
//intro
sc_restart = instance_create_depth(0,0,-1000,obj_scene)
sc_intro_1 = instance_create_depth(0,0,-1000,obj_scene)
sc_intro_2 = instance_create_depth(0,0,-1000,obj_scene)
sc_intro_3 = instance_create_depth(0,0,-1000,obj_scene)

//au resto
sc_resto = instance_create_depth(0,0,-1000,obj_scene)
sc_resto_explosion = instance_create_depth(0,0,-1000,obj_scene)

sc_resto_serveur = instance_create_depth(0,0,-1000,obj_scene)

sc_resto_spag = instance_create_depth(0,0,-1000,obj_scene)
sc_resto_vers_huile = instance_create_depth(0,0,-1000,obj_scene)

sc_resto_vers_eau = instance_create_depth(0,0,-1000,obj_scene)

sc_resto_toilette = instance_create_depth(0,0,-1000,obj_scene)
sc_resto_demasquage = instance_create_depth(0,0,-1000,obj_scene)

//ici on demande pour l'autre activité
sc_resto_apres_spag = instance_create_depth(0,0,-1000,obj_scene)
sc_resto_apres_huile = instance_create_depth(0,0,-1000,obj_scene)

sc_resto_demande_next_activite = instance_create_depth(0,0,-1000,obj_scene)


with (sc_restart){
	image = spr_chambre
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0] = "Appuies sur la barre d'espace pour commencer"
}

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

with (sc_resto){
	image = spr_date_1
	nb_repliques = 3
	nb_dialogues = 2
	replique[0] = "Merci, je le sais déjà"
	replique[1] = "Toi aussi, tu es très charmante"
	replique[2] = "*Imploser*"
	dialogue[0] = "Salut, moi c'est Ève, c'est bien avec toi que j'avais un rendez-vous?"
	dialogue[1] = "Wow, tu es beaucoup plus beau en vrai que sur tes photos!"
}


with (sc_resto_explosion){
	image = spr_date_explosion
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "BOUM POW AAAAAAAAAAAAH"
	dialogue[1] = "Zute de flute, pour une fois que ma date se passait bien"
}

with (sc_resto_serveur){
	image = spr_date_explosion // a changer
	nb_repliques = 4
	nb_dialogues = 2
	dialogue[0] = "Bonsoir mes tourtereaux..."
	dialogue[1] = "Que puis-je vous servir ce soir ?"
	replique[0] = "Un verre d'eau frais !"
	replique[1] = "Un verre d'huile, bip boup."
	replique[2] = "Un spaghetti sauce bolognaise !"
	replique[3] = "OMG J'ÉTAIS PAS PRÊT POUR ÇA ! *Courir aux toilettes*"
}


with (sc_resto_demande_next_activite){
	image = spr_date_explosion // a changer
	nb_repliques = 3
	nb_dialogues = 2
	dialogue[0] = "Omg c'était trop amusant et HUMAIN de manger ensemble."
	dialogue[1] = "Aimerais-tu qu'on aille ailleurs ?"
	replique[0] = "Je connais un étang trop chou pas trop loin d'ici..."
	replique[1] = "Un verre d'huile, bip boup."
	replique[2] = "Un spaghetti sauce bolognaise !"
	replique[3] = "OMG J'ÉTAIS PAS PRÊT POUR ÇA ! *Courir aux toilettes*"
}


setDependances()
setNextScene(sc_restart)
