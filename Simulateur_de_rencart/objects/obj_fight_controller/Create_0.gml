scenario = obj_game.more_info
temps = random_range(0,360)

icon_ind = 0
icon_pos = room_width/2

fighting = -1
cooldownFin = 90

m_hp = 0
m_hp_live = 0
m_hp_buff = 0
m_dmg_max = 0
m_sprite = noone
m_name = ""
m_ind = 0

e_hp = 0
e_hp_live = 0
e_hp_buff = 0
e_dmg_max = 0
e_sprite = noone
e_name = ""
e_ind = 0

//gameplay

//sprites - idle, charger, frapper
charFight = 0
stateFight = 0 //charger, attaquer, changer perso
cooldownAtt = 90
cooldown = 0
cooldownFight = 90




function setScenario(_info){
	if scenario == 0{
		m_hp = 100
		m_hp_live = m_hp
		m_hp_buff = m_hp
		m_dmg_max = 30
		m_sprite = spr_moi_poing
		m_name = "Moi"

		e_hp = 100
		e_hp_live = e_hp
		e_hp_buff = e_hp
		e_dmg_max = 20
		e_sprite = spr_commis_poing
		e_name = "Commis de quincaillerie"
	}
	if scenario == 1{
		m_hp = 100
		m_hp_live = m_hp
		m_hp_buff = m_hp
		m_dmg_max = 50
		m_sprite = spr_moi_poing
		m_name = "Moi"
		icon_ind = 1

		e_hp = 100
		e_hp_live = e_hp
		e_hp_buff = e_hp
		e_dmg_max = 40
		e_sprite = spr_commis_poing //commis avec robot
		e_name = "Commis de quincaillerie"
	}
	if scenario == 2{
		m_hp = 100
		m_hp_live = m_hp
		m_hp_buff = m_hp
		m_dmg_max = 30
		m_sprite = spr_moi_poing
		m_name = "Moi"

		e_hp = 160
		e_hp_live = e_hp
		e_hp_buff = e_hp
		e_dmg_max = 15
		e_sprite = spr_commis_poing //eve
		e_name = "Ève - tueuse de robots"
	}
}

setScenario(0)
