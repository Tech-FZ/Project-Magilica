extends Control


# Declare member variables here. Examples:
var write_as_txt = ""


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $MainMenuBtn.pressed:
		get_tree().change_scene("res://assets/menus/main-menu/MainMenu.tscn")
	
	# applies all battle participants
	if $StartBtn.pressed:
		if $AyaCheckbox.pressed:
			write_as_txt += "aya*1\n"
			
		if $ChuyaCheckbox.pressed:
			write_as_txt += "chuya*1\n"
			
		if $HimariCheckbox.pressed:
			write_as_txt += "himari*1\n"
			
		if $HomuraCheckbox.pressed:
			write_as_txt += "homura*1\n"
			
		if $SamuraiCheckbox.pressed:
			write_as_txt += "samurai*" + str($SamuraiSpinBox.value) + "\n"
			
		if $GenbyCheckbox.pressed:
			write_as_txt += "genby*1\n"
			
		if $SuzakuCheckbox.pressed:
			write_as_txt += "suzaku*1\n"
			
		if $SeiryuCheckbox.pressed:
			write_as_txt += "seiryu*1\n"
		
		# creates battle.txt
		var battleFile = File.new()
		battleFile.open("user://battle.txt", File.WRITE)
		battleFile.store_string(write_as_txt)
		battleFile.close()
		
		# switches to the battle
		var _changeScene = get_tree().change_scene("res://assets/battle-areas/BattleEnv1/BattleEnv1.tscn")
