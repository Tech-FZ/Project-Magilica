extends "res://assets/entities/BattleEntity.gd"


export(int) var dilong_hp = 2000
export(int) var dilong_atk = 200
export(int) var dilong_def = 180
export(int) var dilong_spd = 20

# dilong
func get_stats():
	return {
		hp=dilong_hp, 
		atk=dilong_atk, 
		def=dilong_def, 
		spd=dilong_spd
	}

func _ready():
	pass # Replace with function body.
