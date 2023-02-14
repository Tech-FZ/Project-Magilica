extends Node2D


# Declare member variables here. Examples:
var battle_config = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	var battleFile = File.new()
	battleFile.open("user://battle.txt", File.READ)
	battle_config = battleFile.get_as_text()
	battleFile.close()
	
	# insert character adding and positioning algorithm here


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
