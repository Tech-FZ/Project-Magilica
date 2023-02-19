extends "res://assets/entities/BattleEntity.gd"

# basic samurai

export(int) var samurai_hp = 800
export(int) var samurai_atk = 110
export(int) var samurai_def = 100
export(int) var samurai_spd = 8

# samurai
func get_stats():
	return {
		hp=samurai_hp, 
		atk=samurai_atk, 
		def=samurai_def, 
		spd=samurai_spd
	}

func _ready():
	pass # Replace with function body.

