//ui
if scene_actuelle != noone{

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_pixel)

var val = 115

if scene_actuelle.nb_repliques>0{ 
	draw_sprite(scene_actuelle.image,0,10,10)
} else{
	if scene_actuelle = sc_restart{
		for(var i = 0; i <= nb_unlocked; i++){
			draw_sprite(spr_chambre,unlock[i],0,0)
		}
	} else{
		draw_sprite_ext(scene_actuelle.image,0,room_width/2,room_height/2 + 12,0.92,0.92,0,c_white,1)
	}
	draw_set_alpha(0.6)
	draw_rectangle_color(10-2,120-2,room_width-20 + 2, 120 + 19 + 2,c_black,c_black,c_black,c_black,false)
	draw_set_alpha(1)
	val = 120
}
draw_text_ext_transformed(10,val,scene_actuelle.dialogue[dialogue_actuel],19,(room_width-25)/0.5,0.5,0.5,0)

if dialogue_actuel = scene_actuelle.nb_dialogues-1 && scene_actuelle.nb_repliques>0{
	for(var i = 0; i < scene_actuelle.nb_repliques; i++){
		var text = scene_actuelle.replique[i]
		draw_text_ext_transformed(20+150-6,10 + 24*replique_actuelle,">",17,(room_width-30-150)/0.4,0.4,0.4,0)
		draw_text_ext_transformed(20+150,10 + 24*i,text,17,(room_width-30-150)/0.4,0.4,0.4,0)
	}
}
//draw_text(10,10,unlock)
}