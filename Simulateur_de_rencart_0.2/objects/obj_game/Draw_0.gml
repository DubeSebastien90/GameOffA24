//ui
if scene_actuelle != noone && room == rm_questions{

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_pixel)
draw_set_color(c_lime)

var val = 130

if scene_actuelle.nb_repliques>0{ 
	draw_sprite(spr_fond,0,0,0)
	draw_sprite_ext(scene_actuelle.image,0,5,5,1.2,1.2,0,c_white,1)
} else{
	if scene_actuelle = sc_restart{
		draw_sprite(spr_chambre,0,0,0)
		for(var i = 0; i < nb_endings; i++){
			if(unlock[i] == 1){
				draw_sprite(spr_chambre,i+1,0,0)
			}
		}
		draw_set_color(c_black)
		draw_set_halign(fa_center)
		draw_text_transformed(room_width/2,3,"Fins débloquées: "+string(fin_debloquees)+"/"+string(nb_endings),0.45,0.45,0)
	} else{
		draw_sprite_ext(scene_actuelle.image,0,room_width/2,room_height/2 + 12,0.92,0.92,0,c_white,1)
	}
	draw_set_alpha(0.6)
	draw_rectangle_color(5-2,120-2,room_width-5 + 2, 120 + 19 + 2,c_black,c_black,c_black,c_black,false)
	draw_set_alpha(1)
	val = 120
	draw_set_color(c_white)
}
draw_set_halign(fa_left)
draw_text_ext_transformed(5,val,scene_actuelle.dialogue[langage][dialogue_actuel],19,(room_width-15)/0.45,0.45,0.45,0)

if dialogue_actuel = scene_actuelle.nb_dialogues-1 && scene_actuelle.nb_repliques>0{
	var space = 29
	for(var i = 0; i < scene_actuelle.nb_repliques; i++){
		var text = scene_actuelle.replique[langage][i]
		draw_text_transformed(192-5,10 + space*replique_actuelle,">",0.4,0.4,0)
		draw_text_ext_transformed(192,10 + space*i,text,17,78/0.4,0.4,0.4,0)
	}
}
//draw_text(10,10,unlock)
}