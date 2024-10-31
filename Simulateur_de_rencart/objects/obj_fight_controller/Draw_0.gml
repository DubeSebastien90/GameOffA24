draw_set_alpha(0.7)
draw_set_color(c_black)
draw_set_font(fnt_pixel)
draw_rectangle(3,1,85,21,false)
draw_rectangle(room_width-3,1,room_width-(string_length(e_name)*5) - 1,21,false)
draw_set_alpha(1)


draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_sprite(m_sprite,m_ind,0,0)
draw_set_color(c_white)
draw_text_transformed(5,1,m_name,0.5,0.5,0)
draw_sprite(spr_barre_vie,0,5,10)
draw_sprite_ext(spr_barre_vie,1,5,10,max(0,m_hp_buff/m_hp),1,0,c_white,1)


draw_set_valign(fa_top)
draw_set_halign(fa_right)
draw_text_transformed(room_width-5,1,e_name,0.5,0.5,0)
draw_sprite(e_sprite,e_ind,0,0)
draw_sprite_ext(spr_barre_vie,0,room_width-5,10,-1,1,0,c_white,1)
draw_sprite_ext(spr_barre_vie,1,room_width-5,10,-max(0,e_hp_buff/e_hp),1,0,c_white,1)

if charFight == 0{
	draw_sprite_ext(spr_barre,0,room_width/2, room_height*0.9,25,1,0,c_white,1)
	draw_sprite(spr_indic,0,room_width/2,room_height*0.9)
	draw_sprite(spr_icon,icon_ind,icon_pos,room_height*0.9+0.5)
}