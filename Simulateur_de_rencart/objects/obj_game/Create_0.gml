//endigns
nb_unlocked = 0
unlock[0] = 0

TRICHERIE = true

//setup
max_cooldown_space = 5
cooldown_space = 0

scene_actuelle = noone
more_info = 0
gaming = false
returnVal = -1

//affichage
image = spr_chambre

nb_dialogues = 0
dialogue_actuel = 0
dialogue[0] = ""

nb_repliques = 3
replique_actuelle = 0
replique[0] = ""


function setNextScene(_scene){
	if _scene.room_minigame == noone{
		if room != rm_questions{
			room_goto(rm_questions)
		}
		gaming = false
		scene_actuelle = _scene
		replique_actuelle = 0
		dialogue_actuel = 0
	} else {
		if _scene == sc_crossyroad_2{
			if scene_actuelle == sc_quincaillerie{
				sc_crossyroad_2.next_scene[1] = sc_questionnement
			} else if replique_actuelle == 0{
				sc_crossyroad_2.next_scene[1] = sc_etang_entree
			} else if replique_actuelle == 2{
				sc_crossyroad_2.next_scene[1] = sc_film_entree
			}
		}
		
		returnVal = -1
		gaming = true
		more_info = _scene.more_info
		scene_actuelle = _scene
		room_goto(_scene.room_minigame)
	}
}

function setDependances(){
	sc_restart.next_scene[0] = sc_intro_1
	//intro
	sc_intro_1.next_scene[0] = sc_intro_2
	sc_intro_2.next_scene[0] = sc_intro_3
	sc_intro_3.next_scene[0] = sc_crossyroad_1
	
	sc_crossyroad_1.next_scene[0] = sc_mort_voiture
	sc_crossyroad_1.next_scene[1] = sc_resto
	
	sc_mort_voiture.next_scene[0] = sc_restart
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
	sc_crossyroad_2.next_scene[0] = sc_mort_voiture
	sc_crossyroad_2.next_scene[1] = noone
	
	sc_resto_demande_next_activite.next_scene[0] = sc_crossyroad_2
	sc_resto_demande_next_activite.next_scene[1] = sc_quincaillerie
	sc_resto_demande_next_activite.next_scene[2] = sc_crossyroad_2
	
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
	
	sc_quincaillerie.next_scene[0] = sc_crossyroad_2
	
	sc_questionnement.next_scene[0] = sc_q_rester_calme
	sc_questionnement.next_scene[1] = sc_q_indigner
	sc_questionnement.next_scene[2] = sc_q_bagarre_commis
	
	sc_q_rester_calme.next_scene[0] = sc_q_se_promener
	
	sc_q_indigner.next_scene[0] = sc_q_choix_apres_indign
	
	sc_q_choix_apres_indign.next_scene[0] = sc_q_se_promener
	sc_q_choix_apres_indign.next_scene[1] = sc_q_chercher_arme
	
	sc_q_se_promener.next_scene[0] = sc_q_combat_femme
	sc_q_se_promener.next_scene[1] = sc_q_chercher_arme
	
	sc_q_chercher_arme.next_scene[0] = sc_q_chercher_arme2
	sc_q_chercher_arme2.next_scene[0] = sc_q_combat_fusil
	
	// film
	sc_film_entree.next_scene[0] = sc_f_titanic
	sc_film_entree.next_scene[1] = sc_f_netflix
	sc_film_entree.next_scene[2] = sc_f_transformers
	
	sc_f_titanic.next_scene[0] = sc_f_bateau
	sc_f_bateau.next_scene[0] = sc_restart
	
	sc_f_netflix.next_scene[0] = sc_f_pudique
	sc_f_netflix.next_scene[1] = sc_f_naked
	
	sc_f_transformers.next_scene[0] = sc_f_robot_ending_1
	sc_f_robot_ending_1.next_scene[0] = sc_f_robot_ending_2
	sc_f_robot_ending_2.next_scene[0] = sc_restart
	
	sc_f_pudique.next_scene[0] = sc_f_dog
	sc_f_dog.next_scene[0] = sc_restart
	
	sc_f_naked.next_scene[0] = sc_f_robot_sex
	sc_f_robot_sex.next_scene[0] = sc_restart
	
}

//minigames
sc_crossyroad_1 = instance_create_depth(0,0,-1000,obj_scene)
sc_crossyroad_2 = instance_create_depth(0,0,-1000,obj_scene)

//scenes
//intro
sc_restart = instance_create_depth(0,0,-1000,obj_scene)
sc_intro_1 = instance_create_depth(0,0,-1000,obj_scene)
sc_intro_2 = instance_create_depth(0,0,-1000,obj_scene)
sc_intro_3 = instance_create_depth(0,0,-1000,obj_scene)

sc_mort_voiture = instance_create_depth(0,0,-1000,obj_scene)
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


//quicaillerie
sc_questionnement = instance_create_depth(0,0,-1000,obj_scene)

sc_q_rester_calme = instance_create_depth(0,0,-1000,obj_scene)
sc_q_indigner = instance_create_depth(0,0,-1000,obj_scene)
sc_q_bagarre_commis = instance_create_depth(0,0,-1000,obj_scene)

sc_q_choix_apres_indign = instance_create_depth(0,0,-1000,obj_scene)

sc_q_perdre_bagarre_commis = instance_create_depth(0,0,-1000,obj_scene)
sc_q_gagner_bagarre_commis = instance_create_depth(0,0,-1000,obj_scene)

sc_q_se_promener = instance_create_depth(0,0,-1000,obj_scene)
sc_q_chercher_arme = instance_create_depth(0,0,-1000,obj_scene)
sc_q_chercher_arme2 = instance_create_depth(0,0,-1000,obj_scene)

sc_q_combat_fusil = instance_create_depth(0,0,-1000,obj_scene)
sc_q_combat_femme = instance_create_depth(0,0,-1000,obj_scene)

sc_q_perdre_combat_femme = instance_create_depth(0,0,-1000,obj_scene)
sc_q_gsgner_combat_femme = instance_create_depth(0,0,-1000,obj_scene)

sc_q_perdre_combat_fusil = instance_create_depth(0,0,-1000,obj_scene)
sc_q_gagner_combat_fusil = instance_create_depth(0,0,-1000,obj_scene)

//film
sc_f_titanic = instance_create_depth(0,0,-1000,obj_scene)
sc_f_netflix = instance_create_depth(0,0,-1000,obj_scene)
sc_f_transformers = instance_create_depth(0,0,-1000,obj_scene)

sc_f_pudique = instance_create_depth(0,0,-1000,obj_scene)
sc_f_naked = instance_create_depth(0,0,-1000,obj_scene)

sc_f_bateau = instance_create_depth(0,0,-1000,obj_scene)

sc_f_robot_ending_1 = instance_create_depth(0,0,-1000,obj_scene)
sc_f_robot_ending_2 = instance_create_depth(0,0,-1000,obj_scene)

sc_f_dog = instance_create_depth(0,0,-1000,obj_scene)
sc_f_robot_sex = instance_create_depth(0,0,-1000,obj_scene)

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

with(sc_mort_voiture){
	image = spr_intro_1 //a changer
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Il est toujours important de regarder des deux côtés de la rue avant de traverser."
	dialogue[1] = "Comme quoi, l'amour rend vraiment aveugle..."
}

with (sc_resto){
	image = spr_date_1
	nb_repliques = 3
	nb_dialogues = 2
	replique[0] = "Merci, c'est très gentil"
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
	replique[1] = "Je te laisse décider, emmène moi à ton endroit favori !"
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
	replique[1] = "Embrasser le canard"
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

//quicaillerie
with(sc_quincaillerie){
	image = spr_expl_quincaillerie
	nb_repliques = 0
	nb_dialogues = 4
	dialogue[0] = "Parfait, j'avais quelques comissions à faire."
	dialogue[1] = "Ma bicyclète est brisée, je t'emmène à la quicaillerie."
	dialogue[2] = "QUOI? T'ES JAMAIS ALLÉ À LA QUICAILLERIE ?!?!";
	dialogue[3] = "Suis-moi je vais touuuuut te montrer.";
}

with(sc_questionnement){
	image = spr_vue_quinc
	nb_repliques = 3
	nb_dialogues = 4
	dialogue[0] = "Mais... c'est un cimetière intérieur cet endroit."
	dialogue[1] = "Ce sont les parties du corps de tous mes amis robots !"
	dialogue[2] = "Je ne veux pas compromettre mon identité, mais c'est beaucoup trop."
	dialogue[3] = "Que faire ???"
	replique[0] = "Rester calme"
	replique[1] = "S'indigner"
	replique[2] = "Battre le commis"
}


with (sc_q_rester_calme){
	image = spr_rassure_quinc
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Est-ce que tout va bien mon chou ?"
	dialogue[1] = "Suis moi, je vais t'emmener dans mon coin favori !"
}

with(sc_q_indigner){
	image = spr_indigner
	nb_repliques = 0
	nb_dialogues = 3
	dialogue[0] = "C'est n'importe quoi cet endroit Ève !"
	dialogue[1] = "Je me sens très mal à l'aise entouré de toutes ces... pièces"
	dialogue[2] = "Je veux qu'on sorte d'ici tout de suite."
}

with(sc_q_choix_apres_indign){
	image = spr_choix_apres_indigner
	nb_repliques = 2
	nb_dialogues = 2
	dialogue[0] = "Je ne comprends pas du tout de quoi tu parles..."
	dialogue[1] = "Tu n'a pas à t'inquiéter, suis moi je vais te montrer mon coin favori !"
	replique[0] = "Bon... d'accord tu as raison"
	replique[1] = "Jamais de la vie ! *Chercher une arme*"
}

with(sc_q_se_promener){
	image = spr_se_promener
	nb_repliques = 2
	nb_dialogues = 2
	dialogue[0] = "Voici l'allée des marteaux et des outils à soudure !"
	dialogue[1] = "J'aime trop cogner des clous et briser du métal comme passe temps !"
	replique[0] = "Glups... Supeeeer..."
	replique[1] = "C'est trop pour moi ! *Chercher une arme*"
}

with(sc_q_chercher_arme){
	image = spr_chercher_fusil
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Il doit bien avoir quelque chose de dangereux dans ce sacré magasin"
	dialogue[1] = "PARFAIT! Un vrai de vrai pistolet tueur !"
}

with(sc_q_chercher_arme2){
	image = spr_commis_threat
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "EH TOI ! QUE FAIS TU AVEC UN VRAI DE VRAI PISTOLET TUEUR DANS CE MAGASIN"
	dialogue[1] = "TU NE SORTIRAS PAS D'ICI VIVANT !"
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

with(sc_f_titanic){
	image =spr_titanic_1
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Oh trop bien on va passer un troooop bon moment !"
	dialogue[1] = "Errrmmm c'est quoi le bruit qu'on entend ?"
}

with(sc_f_bateau){
	image = spr_titanic_2
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "HOOOONK HOOONK MOTHERTRUCKERS !"
	dialogue[1] = "OH LA VACHE MAMAN !"
}

with(sc_f_transformers){
	image = spr_intro_1 // a changer
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Zute... j'aurais du penser à choisir un film un peu moins épeurant..."
	dialogue[1] = "Toute cette violence... envers mes chers frères..."
}

with(sc_f_robot_ending_1){
	image = spr_intro_1 // a changer
	nb_repliques = 0
	nb_dialogues = 5
	dialogue[0] = "Pourquoi tu fais cette façe beauté ?"
	dialogue[1] = "Toi aussi... ça te fait peur? Je crois savoir pourquoi..."
	dialogue[2] = "Tu sais garder un secret ? De toute façon tu l'as sûrement déjà deviné..."
	dialogue[3] = "..."
	dialogue[4] = "Je suis en réalité "
}

with(sc_f_robot_ending_2){
	image = spr_intro_1 // a changer
	nb_repliques = 0
	nb_dialogues = 3
	dialogue[0] = "Optimus Prime, commandant des autobots, groupe d'héroïques robots extraterrestres..."
	dialogue[1] = "... capables de se tranformer en divers véhicules !"
	dialogue[2] = "Viens habiter la façe cachée de la lune avec moi !"
}

with(sc_f_netflix){
	image = spr_intro_1 // a changer
	nb_repliques = 2
	nb_dialogues = 3
	dialogue[0] = "Ouuh j'adore ton idée ;)"
	dialogue[1] = "Dans ce cas, on passera pas par tous les chemins qui mènent à Rome."
	dialogue[2] = "Déshabilles toi grand fou !"
	replique[0] = "NON ! Je dois garder ma couverture !"
	replique[1] = "Allez poupée ! Viens à moi !"
}

with(sc_f_pudique){
	image = spr_intro_1 // a changer
	nb_repliques = 0
	nb_dialogues = 3
	dialogue[0] = "Quoi !?!?!?!? Après toute cette soirée tu veux même pas de moi ?"
	dialogue[1] = "C'est n'importe quoi ! JE TE DÉTESTEEEEE"
	dialogue[2] = "Tu vas le regretter..."
}

with(sc_f_dog){
	image = spr_intro_1 // a changer
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "SCOOBY-DOO ! ATTAQUE"
	dialogue[1] = "AAAAAAHH AHHHH BZZT DZZ POW BIM DZZZ"
}

with(sc_f_naked){
	image = spr_intro_1 // a changer
	nb_repliques = 0
	nb_dialogues = 3
	dialogue[0] = "Oh oui enlèves ta chemise beau gosse !"
	dialogue[1] = "Ermm... pourquoi ta peau est toute grise ? Et où sont passés tes cheveux !"
	dialogue[2] = "Ne me dit pas que... non c'est trop beau pour être vrai !"
}

with(sc_f_robot_sex){
	image = spr_intro_1 // a changer
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0] = "Tu es un robot toi aussi ! Je suis tellement soulagée"
	dialogue[1] = "Allez viens me graisser les tuyaux, mon port USB n'attend que ta clé"
}

//minigames
with(sc_crossyroad_1){
	room_minigame = rm_crossyroad
	more_info = 0
}

with(sc_crossyroad_2){
	room_minigame = rm_crossyroad
	more_info = 1
}

setDependances()
setNextScene(sc_restart)
