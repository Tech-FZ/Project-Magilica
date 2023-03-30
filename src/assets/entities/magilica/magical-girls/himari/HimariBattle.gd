extends "res://assets/entities/BattleEntity.gd"

# quick n' zippy, fast and powerful, but low DEF

export(int) var himari_hp = 700
export(int) var himari_atk = 120
export(int) var himari_def = 80
export(int) var himari_spd = 15

# himari
func get_stats():
	return {
		hp=himari_hp, 
		atk=himari_atk, 
		def=himari_def, 
		spd=himari_spd
	}

func _ready():
	pass # Replace with function body.
