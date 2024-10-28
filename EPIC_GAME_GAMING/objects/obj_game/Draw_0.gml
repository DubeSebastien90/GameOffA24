//ui
draw_sprite(image,0,10,10)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(fnt_pixel)
draw_text_ext_transformed(10,115,dialogue,19,(room_width-20)/0.5,0.5,0.5,0)

for(var i = 0; i < nb_repliques; i++){
	draw_text_ext_transformed(10,115,dialogue,19,(room_width-20)/0.5,0.5,0.5,0)
}