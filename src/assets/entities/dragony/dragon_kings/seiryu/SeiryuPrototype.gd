extends "res://assets/entities/BattleEntity.gd"

# standard stats girl

export(int) var seiryu_hp = 1700
export(int) var seiryu_atk = 250
export(int) var seiryu_def = 110
export(int) var seiryu_spd = 25

# seiryu
func get_stats():
	return {
		hp=seiryu_hp, 
		atk=seiryu_atk, 
		def=seiryu_def, 
		spd=seiryu_spd
	}
