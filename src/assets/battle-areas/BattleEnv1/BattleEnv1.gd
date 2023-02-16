extends Node2D


# Declare member variables here. Examples:
var battle_config = ""
var aya_scene = preload("res://assets/entities/magilica/magical-girls/aya/AyaBattle.tscn")
var samurai_scene = preload("res://assets/entities/magilica/samurai/SamuraiBattle.tscn")
var genby_scene = preload("res://assets/entities/dragony/dragon_kings/genby/GenbyBattle.tscn")
var suzaku_scene = preload("res://assets/entities/dragony/dragon_kings/suzaku/SuzakuBattle.tscn")
var magilica_scene_instances = []
var dragony_scene_instances = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var battleFile = File.new()
	battleFile.open("user://battle.txt", File.READ)
	battle_config = battleFile.get_as_text()
	battleFile.close()
	
	var battle_config_list = battle_config.split("\n")
	var magilica_army = []
	var dragony_army = []
	
	for battle_config_forces in battle_config_list:
		var battle_config_army = battle_config_forces.split("*")
		
		if battle_config_army[0] == "aya":
			magilica_army.append(battle_config_army[0])
			
		elif battle_config_army[0] == "samurai":
			var i = 0
			
			while i < int(battle_config_army[1]):
				magilica_army.append(battle_config_army[0])
				i += 1
				
		elif battle_config_army[0] == "genby" or battle_config_army[0] == "suzaku":
			dragony_army.append(battle_config_army[0])
			
	
	var magilica_member_pos_x = 24
	var magilica_member_pos_y = 24
	var i = 0
	var j = 0
	
	for magilica_member in magilica_army:
		if magilica_member == "aya":
			magilica_scene_instances.append(aya_scene.instance())
			add_child(magilica_scene_instances[i])
			get_child(get_child_count() - 1).position.x = magilica_member_pos_x
			get_child(get_child_count() - 1).position.y = magilica_member_pos_y
		
		elif magilica_member == "samurai":
			magilica_scene_instances.append(samurai_scene.instance())
			add_child(magilica_scene_instances[i])
			get_child(get_child_count() - 1).position.x = magilica_member_pos_x
			get_child(get_child_count() - 1).position.y = magilica_member_pos_y
		
		i += 1
		j += 1
		magilica_member_pos_y += 64
		if j >= 9:
			magilica_member_pos_y = 24
			magilica_member_pos_x += 64
			j = 0
		
	
	var dragony_member_pos_x = 1256
	var dragony_member_pos_y = 24
	i = 0
	j = 0
	
	for dragony_member in dragony_army:
		if dragony_member == "genby":
			dragony_scene_instances.append(genby_scene.instance())
			add_child(dragony_scene_instances[i])
			
			get_child(get_child_count() - 1).position.x = dragony_member_pos_x
			get_child(get_child_count() - 1).position.y = dragony_member_pos_y
		
		elif dragony_member == "suzaku":
			dragony_scene_instances.append(suzaku_scene.instance())
			add_child(dragony_scene_instances[i])
			
			get_child(get_child_count() - 1).position.x = dragony_member_pos_x
			get_child(get_child_count() - 1).position.y = dragony_member_pos_y
		
		i += 1
		
		j += 1
		dragony_member_pos_y += 64
		if j >= 9:
			dragony_member_pos_y = 24
			dragony_member_pos_x -= 64
			j = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
