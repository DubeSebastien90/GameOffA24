draw_sprite(spr_fond_sex,0,0,0)


draw_sprite(spr_jauge,0,40,15)

draw_sprite(spr_jauge,0,60,15)
draw_sprite_ext(spr_jauge,1,60,15 + (jauge_size) - (jauge_size*(temps_rendu/win_condition)),1,max(0,temps_rendu/win_condition),0,c_white,1)


draw_sprite_ext(spr_USB,0,190+cle_x,20+cle_y,3,3,-60,c_white,1)