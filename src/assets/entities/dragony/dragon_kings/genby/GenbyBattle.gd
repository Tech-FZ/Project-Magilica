extends "res://assets/entities/BattleEntity.gd"

# standard stats girl

export(int) var genby_hp = 1800
export(int) var genby_atk = 180
export(int) var genby_def = 220
export(int) var genby_spd = 22

# genby
func get_stats():
	return {
		hp=genby_hp, 
		atk=genby_atk, 
		def=genby_def, 
		spd=genby_spd
	}
