extends "res://assets/entities/BattleEntity.gd"

# delicate but very high ATK

export(int) var homura_hp = 500
export(int) var homura_atk = 160
export(int) var homura_def = 60
export(int) var homura_spd = 12

# homura
func get_stats():
	return {
		hp=homura_hp, 
		atk=homura_atk, 
		def=homura_def, 
		spd=homura_spd
	}

func _ready():
	pass # Replace with function body.
