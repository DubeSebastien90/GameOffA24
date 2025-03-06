randomize()

//easy access
langage = 1
//français = 0, anglais = 1

//endigns
nb_endings = sprite_get_number(spr_chambre)-1
for(var i = 0; i < nb_endings; i++){
	unlock[i] = 0
}

TRICHERIE = false

my_musique = noone

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
	if scene_actuelle == sc_menu && replique_actuelle == 0{
		game_end()
	} else{
	if _scene.musique != noone{
		audio_stop_sound(my_musique)
		my_musique = audio_play_sound(_scene.musique,0,true)
	}
	if _scene.sound != noone{
		audio_play_sound(_scene.sound,1,false)
	}
	
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
}

function setDependances(){
	sc_menu.next_scene[1] = sc_restart
	
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
	sc_etang_canard.next_scene[0] = sc_nourir_canard
	sc_nourir_canard.next_scene[0] = sc_perdu_canard
	sc_nourir_canard.next_scene[1] = sc_gagne_canard
	
	sc_perdu_canard.next_scene[0] = sc_noyade
	sc_noyade.next_scene[0] = sc_restart
	//branch
	
	sc_gagne_canard.next_scene[0] = sc_kiss_fille
	sc_gagne_canard.next_scene[1] = sc_kiss_canard
	
	
	sc_etang_skinny_dip.next_scene[0] = sc_restart
	sc_kiss_fille.next_scene[0] = sc_restart
	sc_kiss_canard.next_scene[0] = sc_restart
	
	//quincaillerie
	
	sc_quincaillerie.next_scene[0] = sc_crossyroad_2
	
	sc_questionnement.next_scene[0] = sc_q_rester_calme
	sc_questionnement.next_scene[1] = sc_q_indigner
	sc_questionnement.next_scene[2] = sc_q_bagarre_commis
	
	sc_q_bagarre_commis.next_scene[0] = sc_fight_hand_commis
	sc_fight_hand_commis.next_scene[0] = sc_q_perdre_combat_tout
	sc_fight_hand_commis.next_scene[1] = sc_q_gagner_bagarre_commis
	sc_q_gagner_bagarre_commis.next_scene[0] = sc_q_gagner_bagarre_commis_2
	sc_q_gagner_bagarre_commis_2.next_scene[0] = sc_restart
	sc_q_perdre_combat_tout.next_scene[0] = sc_restart
	
	sc_q_rester_calme.next_scene[0] = sc_q_se_promener
	
	sc_q_indigner.next_scene[0] = sc_q_choix_apres_indign
	
	sc_q_choix_apres_indign.next_scene[0] = sc_q_se_promener
	sc_q_choix_apres_indign.next_scene[1] = sc_q_chercher_arme
	
	sc_q_se_promener.next_scene[0] = sc_q_combat_femme
	sc_q_se_promener.next_scene[1] = sc_q_chercher_arme
	
	sc_q_combat_femme.next_scene[0] = sc_fight_hand_eve
	sc_fight_hand_eve.next_scene[0] = sc_q_perdre_combat_femme
	sc_fight_hand_eve.next_scene[1] = sc_q_gagner_combat_femme
	sc_q_perdre_combat_femme.next_scene[0] = sc_restart
	sc_q_gagner_combat_femme.next_scene[0] = sc_restart
	
	sc_q_chercher_arme.next_scene[0] = sc_q_chercher_arme2
	sc_q_chercher_arme2.next_scene[0] = sc_fight_gun_commis
	sc_fight_gun_commis.next_scene[0] = sc_q_perdre_combat_tout
	sc_fight_gun_commis.next_scene[1] = sc_q_gagner_combat_fusil
	sc_q_gagner_combat_fusil.next_scene[0] = sc_q_gagner_combat_fusil_2
	sc_q_gagner_combat_fusil_2.next_scene[0] = sc_q_gagner_combat_fusil_3
	sc_q_gagner_combat_fusil_3.next_scene[0] = sc_restart
	
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
	sc_f_robot_ending_2.next_scene[0] = sc_f_robot_ending_3
	sc_f_robot_ending_3.next_scene[0] = sc_restart
	
	sc_f_pudique.next_scene[0] = sc_f_dog
	sc_f_dog.next_scene[0] = sc_restart
	
	sc_f_naked.next_scene[0] = sc_f_robot_sex
	sc_f_robot_sex.next_scene[0] = sc_sex
	sc_sex.next_scene[0] = sc_f_loose_sex
	sc_sex.next_scene[1] = sc_f_win_sex
	
	sc_f_loose_sex.next_scene[0] = sc_restart
	sc_f_win_sex.next_scene[0] = sc_restart
	
}

sc_menu = instance_create_depth(0,0,-1000,obj_scene)
//minigames
sc_crossyroad_1 = instance_create_depth(0,0,-1000,obj_scene)
sc_crossyroad_2 = instance_create_depth(0,0,-1000,obj_scene)
sc_nourir_canard = instance_create_depth(0,0,-1000,obj_scene)
sc_sex = instance_create_depth(0,0,-1000,obj_scene)

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

sc_perdu_canard = instance_create_depth(0,0,-1000,obj_scene)
sc_gagne_canard = instance_create_depth(0,0,-1000,obj_scene)
sc_noyade = instance_create_depth(0,0,-1000,obj_scene)

//canard 

sc_kiss_canard = instance_create_depth(0,0,-1000,obj_scene)
sc_kiss_fille = instance_create_depth(0,0,-1000,obj_scene)


//quicaillerie
sc_questionnement = instance_create_depth(0,0,-1000,obj_scene)

sc_q_rester_calme = instance_create_depth(0,0,-1000,obj_scene)
sc_q_indigner = instance_create_depth(0,0,-1000,obj_scene)
sc_q_bagarre_commis = instance_create_depth(0,0,-1000,obj_scene)

sc_q_choix_apres_indign = instance_create_depth(0,0,-1000,obj_scene)

sc_q_se_promener = instance_create_depth(0,0,-1000,obj_scene)
sc_q_chercher_arme = instance_create_depth(0,0,-1000,obj_scene)
sc_q_chercher_arme2 = instance_create_depth(0,0,-1000,obj_scene)
sc_q_combat_femme = instance_create_depth(0,0,-1000,obj_scene)

//pas encore def - end fights
sc_q_perdre_combat_tout = instance_create_depth(0,0,-1000,obj_scene)
sc_q_gagner_bagarre_commis = instance_create_depth(0,0,-1000,obj_scene)
sc_q_gagner_bagarre_commis_2 = instance_create_depth(0,0,-1000,obj_scene)
sc_q_gagner_combat_femme = instance_create_depth(0,0,-1000,obj_scene)
sc_q_gagner_combat_fusil = instance_create_depth(0,0,-1000,obj_scene)
sc_q_gagner_combat_fusil_2 = instance_create_depth(0,0,-1000,obj_scene)
sc_q_gagner_combat_fusil_3 = instance_create_depth(0,0,-1000,obj_scene)
sc_q_perdre_combat_femme = instance_create_depth(0,0,-1000,obj_scene)

//minigames fights
sc_fight_hand_commis = instance_create_depth(0,0,-1000,obj_scene)
sc_fight_gun_commis = instance_create_depth(0,0,-1000,obj_scene)
sc_fight_hand_eve = instance_create_depth(0,0,-1000,obj_scene)


//film
sc_f_titanic = instance_create_depth(0,0,-1000,obj_scene)
sc_f_netflix = instance_create_depth(0,0,-1000,obj_scene)
sc_f_transformers = instance_create_depth(0,0,-1000,obj_scene)

sc_f_pudique = instance_create_depth(0,0,-1000,obj_scene)
sc_f_naked = instance_create_depth(0,0,-1000,obj_scene)

sc_f_bateau = instance_create_depth(0,0,-1000,obj_scene)

sc_f_robot_ending_1 = instance_create_depth(0,0,-1000,obj_scene)
sc_f_robot_ending_2 = instance_create_depth(0,0,-1000,obj_scene)
sc_f_robot_ending_3 = instance_create_depth(0,0,-1000,obj_scene)

sc_f_dog = instance_create_depth(0,0,-1000,obj_scene)
sc_f_robot_sex = instance_create_depth(0,0,-1000,obj_scene)

sc_f_win_sex = instance_create_depth(0,0,-1000,obj_scene)
sc_f_loose_sex = instance_create_depth(0,0,-1000,obj_scene)



with (sc_restart){
	image = spr_chambre //image à afficher
	nb_repliques = 0 // le nombre de répliques (si 0, mode cinema)
	nb_dialogues = 1 // le nombre de blocs de texte
	dialogue[0][0] = "Appuies sur la barre d'espace pour commencer." // dialogue[a][b] où a = langue et b = index du dialogue
	dialogue[1][0] = "Press space to start"
	musique = snd_musique //nouvelle musique à jouer lors de la scène, par défaut noone
	//sound = snd_exemple son à jouer au début de la scène, par défaut noone
}

with (sc_intro_1){
	image = spr_intro_1
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Oh tiens regarde, un nouveau match sur Tinda!"
	dialogue[0][1] = "Oh mon dieu qu'elle est belle! C'est certainement la femme de ma vie."
	
	dialogue[1][0] = "Oh look a that! I got a new match on Tinda"
	dialogue[1][1] = "Oh my god she is so pretty! She probably is the woman of my life."
}

with (sc_intro_2){
	image = spr_intro_2
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Mais non! Que faire! Je suis un robot, mes émotions sont simulées par des circuits électriques..."
	dialogue[0][1] = "Personne ne voudra de moi pour une relation à caractère romantique."
	
	dialogue[1][0] = "Wait! What can I do? I am a robot, my feelings are simulated by electrical circuits"
	dialogue[1][1] = "Nobody will ever want me as a partner for a romantic relationship."

}

with (sc_intro_3){
	image = spr_intro_3
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Une chance qu'un aveugle passait dans le coin, j'ai pu me dénicher un beau déguisement."
	dialogue[0][1] = "Le plan est INFAILLIBLE! Avec ces habits, elle n'y verra que du feu."
	
	dialogue[1][0] = "Luckily, a blind man was walking around here, I was able to find this costume."
	dialogue[1][1] = "That's a PERFECT plan! Nobody is going to know!"
}

with(sc_mort_voiture){
	image = spr_mort_auto
	musique = snd_musique
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Il est toujours important de regarder des deux côtés de la rue avant de traverser."
	dialogue[0][1] = "Comme quoi, l'amour rend vraiment aveugle..."
	
	dialogue[1][0] = "Don't forget to look both ways before crossing the road."
	dialogue[1][1] = "Maybe it's true, love is really blind..."
}

with (sc_resto){
	image = spr_date_1
	musique = snd_musique
	nb_repliques = 3
	nb_dialogues = 2
	replique[0][0] = "Merci, c'est très gentil"
	replique[0][1] = "Toi aussi, tu es très charmante"
	replique[0][2] = "*Imploser*"
	
	dialogue[0][0] = "Salut, moi c'est Ève, c'est bien avec toi que j'avais un rencard?"
	dialogue[0][1] = "Wow, tu es beaucoup plus beau en vrai que sur tes photos!"
	
	replique[1][0] = "Thanks, you're very kind"
	replique[1][1] = "I could say the same about you!"
	replique[1][2] = "*Implode*"
	
	dialogue[1][0] = "Hey, I'm Eva, you're my date?"
	dialogue[1][1] = "Wow, you're way more handsome in real life than in your pictures"
}


with (sc_resto_explosion){
	image = spr_date_explosion
	sound = snd_explosion
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "BOUM POW AAAAAAAAAAAAH"
	dialogue[0][1] = "Zute de flute, pour une fois que ma date se passait à merveille."
	
	dialogue[1][0] = "BOOM POW AAAAAAAAAAAAH"
	dialogue[1][1] = "Oh snap, it was the first time my date was going very well."
}

with (sc_resto_serveur){
	image = spr_serveur
	nb_repliques = 4
	nb_dialogues = 2
	dialogue[0][0] = "Bonsoir mes tourtereaux..."
	dialogue[0][1] = "Que puis-je vous servir ce soir ?"
	
	replique[0][0] = "Un verre d'eau frais !"
	replique[0][1] = "Un verre d'huile, bip boup."
	replique[0][2] = "Un spaghetti sauce bolognaise !"
	replique[0][3] = "OMG J'ÉTAIS PAS PRÊT POUR ÇA ! *Courir aux toilettes*"
	
	dialogue[1][0] = "Good evening lovers..."
	dialogue[1][1] = "How can I help you tonight?"
	
	replique[1][0] = "Just a glass of water !"
	replique[1][1] = "Can I get some oil ? Beep boop."
	replique[1][2] = "I'll have a spaghetti bolognese please."
	replique[1][3] = "OMG I WASN'T READY FOR THIS ! *Run to the bathrooms*"
}


with (sc_resto_vers_eau){
	image = spr_verre_eau
	sound = snd_electricite
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0][0] = "Miam, un bon verre d'ea...GYAYAAAAAAHEEAOFIDF *mort soufffrante*"
	
	dialogue[1][0] = "Yummy, a fresh glass of wa... GYAYAAAAAAHEEAOFIDF *suffering death*"
}

with (sc_resto_vers_huile){
	image = spr_date_huile 
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "What, t'es trop bizarre lol. Je trouve ça très masculin boire de l'huile, j'aime ça."
	dialogue[0][1] = "Quoi? C'est pas bizarre du tout manger une carotte... "
	
	dialogue[1][0] = "You're so weird lol. Drinking oil is very masculine, I like it."
	dialogue[1][1] = "What? Everyone eats carrots... That's perfecly normal..."
}


with (sc_resto_spag){
	image = spr_date_spag 
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Le classique. Ok je savais pas que t'étais de même."
	dialogue[0][1] = "Arrête! Une carotte c'est vraiment plus original."
	
	dialogue[1][0] = "Classic! Didn't know you were like that."
	dialogue[1][1] = "Stop it! A carrot is WAY more original."
}

with (sc_resto_toilette){
	image = spr_toilettes 
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0][0] = "Omg j'ai passé trop proche de la catastrophe, allez, on respire et on y retourne."
	
	dialogue[1][0] = "Omg that was almost a disaster... Take a breath, here we go again."
}

with (sc_resto_demasquage){
	image = spr_pas_perruque 
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0][0] = "OH NOOOON MA PERRUQUE ! J'AI ÉTÉ DÉMASQUÉ ! AAAAAAAAAAAH"
	
	dialogue[1][0] = "OH NOOOOO MY WIG ! SHE KNOWS EVERYTHING NOW ! AAAAAAAAAAAH"
}


with (sc_resto_demande_next_activite){
	image = spr_date_1 
	nb_repliques = 3
	nb_dialogues = 2
	dialogue[0][0] = "Omg c'était trop amusant et HUMAIN de manger ensemble."
	dialogue[0][1] = "Aimerais-tu qu'on aille ailleurs ? Quelle idée préfères-tu ?"
	
	replique[0][0] = "Je connais un étang trop chou pas trop loin d'ici..."
	replique[0][1] = "Je te laisse décider, emmène moi à ton endroit favori !"
	replique[0][2] = "Et si on allait chez moi écouter un film ? "
	
	dialogue[1][0] = "Omg that was so funny and HUMAN to eat together."
	dialogue[1][1] = "Would you like to go soewhre else ? What dou you prefer ?"
	
	replique[1][0] = "I know a cute pond pretty close..."
	replique[1][1] = "You choose, bring me to your favorite place !"
	replique[1][2] = "We could go at my place to watch a movie ?"
}

with (sc_etang_entree){
	image = spr_date_etang 
	musique = snd_musique
	nb_repliques = 2
	nb_dialogues = 1
	dialogue[0][0] = "Vraiment charmant cet étang ! Qu'est-ce qu'on pourrait bien y faire ? "
	
	replique[0][0] = "SKINNY DIP !!"
	replique[0][1] = "Nourrir les canards serait un choix à la fois écologiquement responsable et rapprocheur :)"
	
	dialogue[1][0] = "What a lovely pond ! What should we do here ?"
	
	replique[1][0] = "SKINNY DIP !!"
	replique[1][1] = "Feeding the ducks while talking would bring us closer :)"
}


with (sc_etang_canard){
	image = spr_date_canard 
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0][0] = "Ils sont trop mignooooons ! Nourris les s'il te plaît !"
	
	dialogue[1][0] = "They are soooo cute ! Can you feed them please ?"
}

with (sc_etang_skinny_dip){
	image = spr_skinny_dip
	sound = snd_electricite
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "OH NON ÇA FAIT TROP MAL, JE SOUFFRE ÉNORMÉMENT"
	dialogue[0][1] = "Au moins j'aurai vu une femme nue avant ma mort ! Yes !"
	
	dialogue[1][0] = "OH GOD IT HURTS, I'M SUFFERING SOOO BAD"
	dialogue[1][1] = "Well at least I saw a naked woman before dying ! YEAH !"
}

with(sc_perdu_canard){
	image = spr_date_canard_aide
	musique = snd_musique
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Oh non... t'es trop nul en fait !"
	dialogue[0][1] = "Laisse moi le faire ! *Trébuche* AAAAAAH SPLOUSH ARGH !"
	
	dialogue[1][0] = "Oh... stop it you're very bad !"
	dialogue[1][1] = "Let me do it ! *stumbles* AAAAAAH SPLOOSH ARGH !"
}

with(sc_noyade){
	image = spr_etang_noyade
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Bon... j'imagine que c'est des choses qui arrivent"
	dialogue[0][1] = "Mieux vaudrait partir d'ici avant que quelqu'un me voie..."
	
	dialogue[1][0] = "Welp... I guess this can happen sometimes..."
	dialogue[1][1] = "I should get out of here before someone sees me..."
}

with(sc_gagne_canard){
	image = spr_etang_romantique
	musique = snd_musique
	nb_repliques = 2
	nb_dialogues = 1
	dialogue[0][0] = "Wow, comme c'est romantique de nourrir les canards, ensemble... Je vis un moment incroyable !"
	
	replique[0][0] = "L'embrasser"
	replique[0][1] = "Embrasser le canard"
	
	dialogue[1][0] = "Wow it's so romantic ! I'm having a wonderful time..."
	
	replique[1][0] = "Kiss her"
	replique[1][1] = "Kiss the duck"
}


with (sc_kiss_fille){
	image = spr_bisou_fille 
	nb_repliques = 0
	nb_dialogues = 1
	dialogue[0][0] = "Mwah smack smack ! Tu as réussi, bien joué !"
	
	dialogue[1][0] = "Kiss smack smack ! You managed to do it, good job !"
}

with (sc_kiss_canard){
	image = spr_bisou_canard 
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Ne jamais mordre la main qui te nourrit !"
	dialogue[0][1] = "Comme quoi le vrai amour est parfois celui qui vient à nous <3 <3 <3"
	
	dialogue[1][0] = "Never bite the hand that feeds you !"
	dialogue[1][1] = "Real love is sometimes far from expected <3 <3 <3"
}

//quicaillerie
with(sc_quincaillerie){
	image = spr_expl_quincaillerie
	nb_repliques = 0
	nb_dialogues = 4
	dialogue[0][0] = "Parfait, j'avais quelques comissions à faire."
	dialogue[0][1] = "Ma bicyclète est brisée, je t'emmène à la quicaillerie."
	dialogue[0][2] = "QUOI? T'ES JAMAIS ALLÉ À LA QUICAILLERIE ?!?!";
	dialogue[0][3] = "Suis-moi je vais touuuuut te montrer.";
}

with(sc_questionnement){
	image = spr_vue_quinc
	musique = snd_musique_quicaillerie
	nb_repliques = 3
	nb_dialogues = 4
	dialogue[0][0] = "Mais... c'est un cimetière intérieur cet endroit."
	dialogue[0][1] = "Ce sont les parties du corps de tous mes amis robots !"
	dialogue[0][2] = "Je ne veux pas compromettre mon identité, mais c'est beaucoup trop."
	dialogue[0][3] = "Que faire ???"
	replique[0][0] = "Rester calme"
	replique[0][1] = "S'indigner"
	replique[0][2] = "Battre le commis"
}


with (sc_q_rester_calme){
	image = spr_rassure_quinc
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Est-ce que tout va bien mon chou ?"
	dialogue[0][1] = "Suis moi, je vais t'emmener dans mon coin favori !"
}

with(sc_q_indigner){
	image = spr_indigner
	nb_repliques = 0
	nb_dialogues = 3
	dialogue[0][0] = "C'est n'importe quoi cet endroit Ève !"
	dialogue[0][1] = "Je me sens très mal à l'aise entouré de toutes ces... pièces"
	dialogue[0][2] = "Je veux qu'on sorte d'ici tout de suite."
}

with(sc_q_choix_apres_indign){
	image = spr_choix_apres_indigner
	nb_repliques = 2
	nb_dialogues = 2
	dialogue[0][0] = "Je ne comprends pas du tout de quoi tu parles..."
	dialogue[0][1] = "Tu n'a pas à t'inquiéter, suis moi je vais te montrer mon coin favori !"
	replique[0][0] = "Bon... d'accord tu as raison"
	replique[0][1] = "Jamais de la vie ! *Chercher une arme*"
}

with(sc_q_se_promener){
	image = spr_se_promener
	nb_repliques = 2
	nb_dialogues = 2
	dialogue[0][0] = "Voici l'allée des marteaux et des outils à soudure !"
	dialogue[0][1] = "J'aime trop cogner des clous et briser du métal comme passe temps !"
	replique[0][0] = "Glups... Supeeeer..."
	replique[0][1] = "C'est trop pour moi ! *Chercher une arme*"
}

with(sc_q_chercher_arme){
	image = spr_chercher_fusil
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Il doit bien avoir quelque chose de dangereux dans ce sacré magasin"
	dialogue[0][1] = "PARFAIT! Un vrai de vrai pistolet tueur !"
}

with(sc_q_chercher_arme2){
	image = spr_commis_threat
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "EH TOI ! QUE FAIS TU AVEC UN VRAI DE VRAI PISTOLET TUEUR DANS CE MAGASIN"
	dialogue[0][1] = "TU NE SORTIRAS PAS D'ICI VIVANT !"
}

with(sc_q_bagarre_commis){
	image = spr_provoquer_commis
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "EH SALOPARD ! C'EST TOI QUI TRAVAILLE ICI ?!?"
	dialogue[0][1] = "VIENS T'EN QUE JE T'EN COLLE TOUTE QU'UNE !"
}

with(sc_q_combat_femme){
	image = spr_ferailleuse
	nb_repliques = 0
	nb_dialogues = 5
	dialogue[0][0] = "Quoi ? Ça ne t'inquiète pas plus que ça ? Pourtant ça devrait te faire peur..."
	dialogue[0][1] = "Mouhahaha ne fais pas cette expression, je sais depuis le début que tu es un robot"
	dialogue[0][2] = "Sérieusement ? Une simple perruque et un veston, ce n'est vraiment pas discret."
	dialogue[0][3] = "Pourquoi penses-tu qu'on a matché sur Tinda, je suis en fait une traqueuse de ferraille !"
	dialogue[0][4] = "Viens ici que je te démembres et te vende au plus offrant !"
}

with(sc_q_perdre_combat_tout){
	image =spr_boulons
	musique = snd_musique_quicaillerie
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Quand un coup est parti, même quatre chevaux seraient en peine pour le rattraper."
	dialogue[0][1] = "Comme quoi la violence ne résout pas toujours tous les conflits..."
}

with(sc_q_gagner_bagarre_commis){
	image = spr_police_1
	musique = snd_musique_quicaillerie
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Mais voyons ! Qu'as-tu fait grand fou ?!?"
	dialogue[0][1] = "Quelqu'un ! Appelez la police !"
}

with(sc_q_gagner_bagarre_commis_2){
	image = spr_police_2
	sound = snd_police
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Allez passez lui les menotes, il en a au moins pour 10 ans de prison."
	dialogue[0][1] = "EH ! Pourquoi ses bras sont en métal ?"
}

with(sc_q_gagner_combat_femme){
	image = spr_tuer_femme
	musique = snd_musique_quicaillerie
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Woah mais quelle folle ! Personne ne touche à mes boulons !"
	dialogue[0][1] = "Pour une fois que j'avais un rendez-vous qui se passait bien..."
	
}

with(sc_q_perdre_combat_femme){
	image = spr_boulons
	musique = snd_musique_quicaillerie
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Hehe tu étais bien membré à ce que je vois."
	dialogue[0][1] = "Je vais me faire une petite fortune avec toutes ces composantes."
}

with(sc_q_gagner_combat_fusil){
	image = spr_eve_blessee_1
	musique = snd_musique_quicaillerie
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "C'est bon Ève ! Je l'ai eu ce dangereux commis !"
	dialogue[0][1] = "Plus personne ne sera blessé par c.. Ève?"
}

with(sc_q_gagner_combat_fusil_2){
	image = spr_eve_blessee_2
	nb_repliques = 0
	nb_dialogues = 3
	dialogue[0][0] = "Argh, j'ai reçu une balle perdue..."
	dialogue[0][1] = "C'en est fini pour moi... je me sens mourir..."
	dialogue[0][2] = "Du moins..."
}

with(sc_q_gagner_combat_fusil_3){
	image = spr_eve_blessee_3
	nb_repliques = 0
	nb_dialogues = 4
	dialogue[0][0] = "Mon enveloppe corporelle est en train de mourir."
	dialogue[0][1] = "Je vais devoir vider la cervelle de quelqu'un cette nuit pour aller m'y loger."
	dialogue[0][2] = "Ce fut un plaisir de te rencontrer, nous nous reverrons bientôt."
	dialogue[0][3] = "J'espère que mon prochain corps va convenir à tes standards de beauté !"
}

//film 
with(sc_film_entree){
	image = spr_film 
	musique = snd_musique
	nb_repliques = 3
	nb_dialogues = 3
	dialogue[0][0] = "C'est ici que j'habite, c'est pas très grand mais ça serait assez pour deux ;)"
	dialogue[0][1] = "Allez, viens prendre une place sur le divan !"
	dialogue[0][2] = "Alors on écoute quoi chaton ?"
	replique[0][0] = "Quelque chose de romantique comme Titanic !"
	replique[0][1] = "On pourrait seulement écouter Netflix et..."
	replique[0][2] = "Yes ! On écoute Transformers !"
}

with(sc_f_titanic){
	image =spr_titanic_1
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Oh trop bien on va passer un troooop bon moment !"
	dialogue[0][1] = "Errrmmm c'est quoi le bruit qu'on entend ?"
}

with(sc_f_bateau){
	image = spr_titanic_2
	sound = snd_crate
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "HOOOONK HOOONK MOTHERTRUCKERS !"
	dialogue[0][1] = "OH LA VACHE MAMAN !"
}

with(sc_f_transformers){
	image = spr_appeure
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Zute... j'aurais du penser à choisir un film un peu moins épeurant..."
	dialogue[0][1] = "Toute cette violence... envers mes chers frères..."
}

with(sc_f_robot_ending_1){
	image = spr_transform_1
	nb_repliques = 0
	nb_dialogues = 5
	dialogue[0][0] = "Pourquoi tu fais cette façe beauté ?"
	dialogue[0][1] = "Toi aussi... ça te fait peur? Je crois savoir pourquoi..."
	dialogue[0][2] = "Tu sais garder un secret ? De toute façon tu l'as sûrement déjà deviné..."
	dialogue[0][3] = "..."
	dialogue[0][4] = "Je suis en réalité "
}

with(sc_f_robot_ending_2){
	image = spr_transform_2
	nb_repliques = 0
	nb_dialogues = 3
	dialogue[0][0] = "Optimus Prime, commandant des autobots, groupe d'héroïques robots extraterrestres..."
	dialogue[0][1] = "... capables de se tranformer en divers véhicules !"
	dialogue[0][2] = "Viens habiter la façe cachée de la lune avec moi !"
}

with(sc_f_robot_ending_3){
	image = spr_transform_3
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Nous sommes bien mieux loin de ce merdier !"
	dialogue[0][1] = "Fondons une famille et colonisons l'univers !"
}

with(sc_f_netflix){
	image = spr_film_sexe
	nb_repliques = 2
	nb_dialogues = 3
	dialogue[0][0] = "Ouuh j'adore ton idée ;)"
	dialogue[0][1] = "Dans ce cas, on passera pas par tous les chemins qui mènent à Rome."
	dialogue[0][2] = "Déshabilles toi grand fou !"
	replique[0][0] = "NON ! Je dois garder ma couverture de robot !"
	replique[0][1] = "Allez poupée ! Viens à moi !"
}

with(sc_f_pudique){
	image = spr_film_pudique
	nb_repliques = 0
	nb_dialogues = 3
	dialogue[0][0] = "Quoi !?!?!?!? Après toute cette soirée tu veux même pas de moi ?"
	dialogue[0][1] = "C'est n'importe quoi ! JE TE DÉTESTEEEEE"
	dialogue[0][2] = "Tu vas le regretter..."
}

with(sc_f_dog){
	sound = snd_dog
	image =spr_film_chien
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "SCOOBY-DOO ! ATTAQUE"
	dialogue[0][1] = "AAAAAAHH AHHHH BZZT DZZ POW BIM DZZZ"
}

with(sc_f_naked){
	image = spr_film_peau_metal
	nb_repliques = 0
	nb_dialogues = 3
	dialogue[0][0] = "Oh oui enlèves ta chemise beau gosse !"
	dialogue[0][1] = "Ermm... pourquoi ta peau est toute grise ? Et où sont passés tes cheveux !"
	dialogue[0][2] = "Ne me dit pas que... non c'est trop beau pour être vrai !"
}

with(sc_f_robot_sex){
	image = spr_film_robot_sex
	musique = snd_sex
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Tu es un robot toi aussi ! Je suis tellement soulagée"
	dialogue[0][1] = "Allez viens me graisser les tuyaux, mon port USB n'attend que ta clé"
}

with(sc_f_loose_sex){
	image = spr_film_perdu_sex
	musique = snd_musique
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Bon... Non mais c'est vraiment pas grave, ça arrive à tout le monde."
	dialogue[0][1] = "De toute façon tu dois être un gros puceau, oui toi derrière l'écran! Puceau ! Puceau !"
}

with(sc_f_win_sex){
	image = spr_film_gagne_sex
	nb_repliques = 0
	nb_dialogues = 2
	dialogue[0][0] = "Ouhlala ça faisait assez longtemps que j'avais bien niqué comme ça !"
	dialogue[0][1] = "On se rappelle bientôt d'accord ?"
}

//minigames
with(sc_crossyroad_1){
	room_minigame = rm_crossyroad
	more_info = 0
	musique = snd_musique_crossy
}

with(sc_crossyroad_2){
	room_minigame = rm_crossyroad
	more_info = 1
	musique = snd_musique_crossy
}

with(sc_fight_hand_commis){
	room_minigame = rm_fight
	more_info = 0
	musique = snd_musique_fight
}

with(sc_fight_gun_commis){
	room_minigame = rm_fight
	more_info = 1
	musique = snd_musique_fight
}

with(sc_fight_hand_eve){
	room_minigame = rm_fight
	more_info = 2
	musique = snd_musique_fight
}

with(sc_nourir_canard){
	room_minigame = rm_canards
	musique = snd_musique_crossy
}

with(sc_sex){
	room_minigame = rm_sex
}

with(sc_menu){
	image = spr_attention
	nb_repliques = 2
	nb_dialogues = 2
	dialogue[0][0] = "Attention, ce jeu est destiné à un auditoire de 13 ans et plus."
	dialogue[0][1] = "Es-tu assez vieux pour jouer ?"
	replique[0][0] = "Non, j'ai moins de 13 ans"
	replique[0][1] = "Oui, j'ai 13 ans et plus"
}

setDependances()
setNextScene(sc_restart)
