extends "res://assets/entities/BattleEntity.gd"

# tanky girl, slower and low ATK but high HP and DEF

export(int) var chuya_hp = 1300
export(int) var chuya_atk = 100
export(int) var chuya_def = 160
export(int) var chuya_spd = 3

# Chuya
func get_stats():
	return {
		hp=chuya_hp, 
		atk=chuya_atk, 
		def=chuya_def, 
		spd=chuya_spd
	}

func _ready():
	pass # Replace with function body.
