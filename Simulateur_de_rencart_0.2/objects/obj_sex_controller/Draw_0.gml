draw_sprite(spr_fond_sex,0,0,0)


draw_sprite(spr_jauge,0,40,15)

draw_sprite(spr_jauge,0,60,15)
draw_sprite_ext(spr_jauge,1,60,15 + (jauge_size) - (jauge_size*(temps_rendu/win_condition)),1,max(0,temps_rendu/win_condition),0,c_white,1)

draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_font(fnt_pixel)
draw_text_transformed(80,room_height*0.7,"Appuyez sur espace et restez \nen contrôle de la clé",0.55,0.55,0)

draw_sprite_ext(spr_USB,0,190+cle_x,20+cle_y,3,3,-60,c_white,1)