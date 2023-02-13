extends KinematicBody2D


# Declare member variables here. Examples:
var selected = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mouse_pos = get_viewport().get_mouse_position()
	if Input.is_action_pressed("select_players"):
		if mouse_pos.x <= position.x - 32 and mouse_pos.y <= position.y - 32:
			if mouse_pos.x >= position.x + 32 and mouse_pos.y >= position.y + 32:
				selected = true
				print("Aya has been selected.")
			
			else:
				selected = false
				print("Aya has been un-selected.")
	
		else:
			selected = false
			print("Aya has been un-selected.")
