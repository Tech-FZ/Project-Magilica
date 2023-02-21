extends "res://assets/entities/BattleEntity.gd"

# standard stats girl

export(int) var suzaku_hp = 2300
export(int) var suzaku_atk = 150
export(int) var suzaku_def = 75
export(int) var suzaku_spd = 20

# suzaku
func get_stats():
	return {
		hp=suzaku_hp, 
		atk=suzaku_atk, 
		def=suzaku_def, 
		spd=suzaku_spd
	}
