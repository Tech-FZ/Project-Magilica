extends Area2D


# Declare member variables here. Examples:
var selected = false
var mouse_is_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("select_players"):
		if mouse_is_in_area:
			selected = true
			print("Aya has been selected.")
	
		else:
			selected = false
			print("Aya has been un-selected.")
			
	if Input.is_action_pressed("move_players"):
		if selected:
			position.x = get_viewport().get_mouse_position().x
			position.y = get_viewport().get_mouse_position().y


func _on_Aya_mouse_entered():
	mouse_is_in_area = true


func _on_Aya_mouse_exited():
	mouse_is_in_area = false
