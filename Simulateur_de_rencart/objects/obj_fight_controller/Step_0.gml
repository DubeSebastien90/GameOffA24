press_space = keyboard_check_pressed(vk_space)


if stateFight == 1{
	if cooldown < 0{
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
	if press_space{
		cooldown = cooldownAtt
		m_ind = 2
		e_hp_live -= round(m_dmg_max*random_range(0.5,1))
		stateFight = 1
	}
	cooldown --
}

if charFight == 1 && stateFight == 0{
	e_ind = 1
	if cooldown < 0{
		cooldown = cooldownAtt
		e_ind = 2
		m_hp_live -= round(e_dmg_max*random_range(0.5,1))
		stateFight = 1
	}
	cooldown --
}

m_hp_buff = lerp(m_hp_buff,m_hp_live,0.1)
e_hp_buff = lerp(e_hp_buff,e_hp_live,0.1)