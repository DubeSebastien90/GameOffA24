//endigns
nb_unlocked = 0
unlock[0] = 0

//setup
max_cooldown_space = 30
cooldown_space = 0

scene_actuelle = noone

//affichage
image = spr_chambre

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
	sc_resto_demasquage.next_scene[0] = sc_restart
	
	//branch huile
	sc_resto_vers_huile.next_scene[0] = sc_resto_demande_next_activite
	
	//branch spaghatt
	sc_resto_spag.next_scene[0] = sc_resto_demande_next_activite
	
	//branch eau
	sc_resto_vers_eau.next_scene[0] = sc_restart
	
	
	//activités
	
	sc_resto_demande_next_activite.next_scene[0] = sc_etang_entree
	sc_resto_demande_next_activite.next_scene[1] = sc_quincaillerie
	sc_resto_demande_next_activite.next_scene[2] = sc_film_entree
	
	//etang
	
	sc_etang_entree.next_scene[0] = sc_etang_skinny_dip
	sc_etang_entree.next_scene[1] = sc_etang_canard
	
	//branch
	
	sc_etang_canard.next_scene[0] = sc_kiss_fille
	sc_etang_canard.next_scene[1] = sc_kiss_canard
	
	
	sc_etang_skinny_dip.next_scene[0] = sc_restart
	sc_kiss_fille.next_scene[0] = sc_restart
	sc_kiss_canard.next_scene[0] = sc_restart
	
	//quincaillerie
	
	sc_quincaillerie.next_scene[0] = sc_quincaillerie_tout_niquer
	
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

sc_resto_demande_next_activite = instance_create_depth(0,0,-1000,obj_scene)

sc_etang_entree = instance_create_depth(0,0,-1000,obj_scene)
sc_film_entree = instance_create_depth(0,0,-1000,obj_scene)
sc_quincaillerie = instance_create_depth(0,0,-1000,obj_scene)


//etang

sc_etang_canard = instance_create_depth(0,0,-1000,obj_scene)
sc_etang_skinny_dip = instance_create_depth(0,0,-1000,obj_scene)

//canard 

sc_kiss_canard = instance_create_depth(0,0,-1000,obj_scene)
sc_kiss_fille = instance_create_depth(0,0,-1000,obj_scene)


sc_quincaillerie_tout_niquer = instance_create_depth(0,0,-1000,obj_scene)




with (sc_restart){
	image = spr_chambre
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0] = "Appuies sur la barre d'espace pour commencer."
}

with (sc_intro_1){
	image = spr_intro_1
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Oh tiens regarde, un nouveau match sur Tinda!"
	dialogue[1] = "Oh mon dieu qu'elle est belle! C'est certainement la femme de ma vie."
}

with (sc_intro_2){
	image = spr_intro_2
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Mais non! Que faire! Je suis un robot, mes émotions sont simulées par des circuits électriques..."
	dialogue[1] = "Personne ne voudra de moi pour une relation à caractère romantique."

}

with (sc_intro_3){
	image = spr_intro_3
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Une chance qu'un aveugle passait dans le coin, j'ai pu me dénicher un beau déguisement."
	dialogue[1] = "Le plan est INFAILLIBLE! Avec ces habits, elle n'y verra que du feu."
}

with (sc_resto){
	image = spr_date_1
	nb_repliques = 3
	nb_dialogues = 2
	replique[0] = "Merci, je le sais déjà."
	replique[1] = "Toi aussi, tu es très charmante."
	replique[2] = "*Imploser*"
	dialogue[0] = "Salut, moi c'est Ève, c'est bien avec toi que j'avais un rendez-vous?"
	dialogue[1] = "Wow, tu es beaucoup plus beau en vrai que sur tes photos!"
}


with (sc_resto_explosion){
	image = spr_date_explosion
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "BOUM POW AAAAAAAAAAAAH"
	dialogue[1] = "Zute de flute, pour une fois que ma date se passait à merveille."
}

with (sc_resto_serveur){
	image = spr_serveur
	nb_repliques = 4
	nb_dialogues = 2
	dialogue[0] = "Bonsoir mes tourtereaux..."
	dialogue[1] = "Que puis-je vous servir ce soir ?"
	replique[0] = "Un verre d'eau frais !"
	replique[1] = "Un verre d'huile, bip boup."
	replique[2] = "Un spaghetti sauce bolognaise !"
	replique[3] = "OMG J'ÉTAIS PAS PRÊT POUR ÇA ! *Courir aux toilettes*"
}


with (sc_resto_vers_eau){
	image = spr_verre_eau
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0] = "Miam, un bon verre d'ea...GYAYAAAAAAHEEAOFIDF *mort soufffrante*"
}

with (sc_resto_vers_huile){
	image = spr_date_huile 
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "What, t'es trop bizarre lol. Je trouve ça très masculin boire de l'huile, j'aime ça."
	dialogue[1] = "Quoi? C'est pas bizarre du tout manger une carotte... "
}


with (sc_resto_spag){
	image = spr_date_spag 
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Le classique. Ok je savais pas que t'étais de même."
	dialogue[1] = "Arrête! Une carotte c'est vraiment plus original."
}

with (sc_resto_toilette){
	image = spr_toilettes 
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0] = "Omg j'ai passé trop proche de la catastrophe, allez, on respire et on y retourne."
}

with (sc_resto_demasquage){
	image = spr_pas_perruque 
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0] = "WHAT THE FUUUUUUUUUCK. AHHHHHHHHHHHHHHHHHHHHHHHH."
}


with (sc_resto_demande_next_activite){
	image = spr_date_1 
	nb_repliques = 3
	nb_dialogues = 2
	dialogue[0] = "Omg c'était trop amusant et HUMAIN de manger ensemble."
	dialogue[1] = "Aimerais-tu qu'on aille ailleurs ? Quelle idée préfères-tu ?"
	replique[0] = "Je connais un étang trop chou pas trop loin d'ici..."
	replique[1] = "J'ai quelques commissions à aller faire..."
	replique[2] = "Et si on allait chez moi écouter un film ? "
}

with (sc_etang_entree){
	image = spr_date_etang 
	nb_repliques = 2
	nb_dialogues = 1
	dialogue[0] = "Vraiment charmant cet étang ! Qu'est-ce qu'on pourrait bien y faire ? "
	replique[0] = "SKINNY DIP !!"
	replique[1] = "Nourrir les canards serait un choix à la fois écologiquement responsable et rapprocheur :)"
}


with (sc_etang_canard){
	image = spr_date_canard 
	nb_repliques = 2
	nb_dialogues = 1
	dialogue[0] = "Wow, comme c'est romantique de nourrir les canards, ensemble... UwU "
	replique[0] = "L'embrasser"
	replique[1] = "Embrasser le canard."
}

with (sc_etang_skinny_dip){
	image = spr_skinny_dip 
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "OH NON ÇA FAIT TROP MAL, JE SOUFFRE ÉNORMÉMENT"
	dialogue[1] = "Au moins j'aurai vu une femme nue avant ma mort ! Yes !"
}

with (sc_kiss_fille){
	image = spr_bisou_fille 
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0] = "Mwah smack smack ! Tu as réussi, bien joué !"
}

with (sc_kiss_canard){
	image = spr_bisou_canard 
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Ne jamais mordre la main qui te nourrit !"
	dialogue[1] = "Comme quoi le vrai amour est parfois celui qui vient à nous <3 <3 <3"
}

with (sc_quincaillerie_tout_niquer){
	image = spr_intro_1 // a changer
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0] = ""
}

//film 
with(sc_film_entree){
	image = spr_film 
	nb_repliques = 3
	nb_dialogues = 3
	dialogue[0] = "C'est ici que j'habite, c'est pas très grand mais ça serait assez pour deux ;)"
	dialogue[1] = "Allez, viens prendre une place sur le divan !"
	dialogue[2] = "Alors on écoute quoi chaton ?"
	replique[0] = "Quelque chose de romantique comme Titanic !"
	replique[1] = "On pourrait seulement écouter Netflix et..."
	replique[2] = "Yes ! On écoute Transformers !"
}


setDependances()
setNextScene(sc_restart)
