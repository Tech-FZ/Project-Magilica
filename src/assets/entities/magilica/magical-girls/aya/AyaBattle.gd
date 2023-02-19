extends "res://assets/entities/BattleEntity.gd"

# standard stats girl

export(int) var aya_hp = 1000
export(int) var aya_atk = 100
export(int) var aya_def = 100
export(int) var aya_spd = 10

# aya
func get_stats():
	return {
		hp=aya_hp, 
		atk=aya_atk, 
		def=aya_def, 
		spd=aya_spd
	}

func _ready():
	pass # Replace with function body.
