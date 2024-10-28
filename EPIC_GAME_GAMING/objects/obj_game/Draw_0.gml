//ui
if scene_actuelle != noone{
draw_sprite(scene_actuelle.image,0,10,10)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_pixel)
draw_text_ext_transformed(10,115,scene_actuelle.dialogue[dialogue_actuel],19,(room_width-20)/0.5,0.5,0.5,0)

if dialogue_actuel = scene_actuelle.nb_dialogues-1{
	for(var i = 0; i < scene_actuelle.nb_repliques; i++){
		var text = scene_actuelle.replique[i]
		draw_text_ext_transformed(20+150-6,10 + 32*replique_actuelle,">",17,(room_width-30-150)/0.4,0.4,0.4,0)
		draw_text_ext_transformed(20+150,10 + 32*i,text,17,(room_width-30-150)/0.4,0.4,0.4,0)
	}
}
draw_text(10,50,replique_actuelle)
}