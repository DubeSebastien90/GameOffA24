press_space = keyboard_check_pressed(vk_space)

if fighting == -1{
if stateFight == 1{
	if cooldown < 0{
		temps = random_range(0,360)
		stateFight = 0
		charFight = (charFight+1)%2
		cooldown = cooldownFight + random_range(-20,20)
		if charFight == 0{
			e_ind = 0
			m_ind = 1
		} else{
			m_ind = 0
			e_ind = 1
		}
	}
	cooldown --
}

if charFight = 0 && stateFight == 0{
	m_ind = 1
	temps += 3
	icon_pos = ((25*10 - 20)/2) * dsin(temps) + room_width/2
	if press_space{
		cooldown = cooldownAtt
		m_ind = 2
		audio_play_sound_ext({sound: snd_pop, loop: false, pitch: random_range(0.9,1.1)})
		var dmg = round(m_dmg_max*(1-(min(1,max(0,(abs(room_width/2 - icon_pos)))/40))))
		e_hp_live -= dmg
		with(instance_create_depth(room_width*0.75,room_height/3,depth-1,obj_textShow)){
			text = "-"+string(dmg)
		}
		stateFight = 1
	}
	cooldown--
}

if charFight == 1 && stateFight == 0{
	e_ind = 1
	if cooldown < 0{
		cooldown = cooldownAtt
		e_ind = 2
		audio_play_sound_ext({sound: snd_pop, loop: false, pitch: random_range(0.9,1.1)})
		var dmg = round(e_dmg_max*random_range(0.7,1))
		m_hp_live -= dmg
		stateFight = 1
		with(instance_create_depth(room_width*0.25,room_height/3,depth-1,obj_textShow)){
			text = "-"+string(dmg)
		}
	}
	cooldown --
}
} else{
	if fighting == 0{
		m_ind = 3
		e_ind = 2
	} else{
		m_ind = 2
		e_ind = 3
	}
	cooldownFin --
	if cooldownFin < 0{
		obj_game.returnVal = fighting
	}
}

if m_hp_live <= 0{
	fighting = 0
	cooldown = 60
	charFight = 1
}

if e_hp_live <= 0{
	fighting = 1
	cooldown = 60
	charFight = 1
}


m_hp_buff = lerp(m_hp_buff,m_hp_live,0.1)
e_hp_buff = lerp(e_hp_buff,e_hp_live,0.1)