extends Node2D


# Declare member variables here. Examples:
var battle_config = ""
var aya_scene = preload("res://assets/entities/magilica/magical-girls/aya/AyaBattle.tscn")
var samurai_scene = preload("res://assets/entities/magilica/samurai/SamuraiBattle.tscn")
var genby_scene = preload("res://assets/entities/dragony/dragon_kings/genby/GenbyBattle.tscn")
var suzaku_scene = preload("res://assets/entities/dragony/dragon_kings/suzaku/SuzakuBattle.tscn")
# insert more characters here
var magilica_scene_instances = []
var dragony_scene_instances = []
var entity_list = []
var current_attacker = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# That reads the battle.txt file
	var battleFile = File.new()
	battleFile.open("user://battle.txt", File.READ)
	battle_config = battleFile.get_as_text()
	battleFile.close()
	
	# That splits the file content
	var battle_config_list = battle_config.split("\n")
	var magilica_army = []
	var dragony_army = []
	
	for battle_config_forces in battle_config_list:
		# here it looks for all the characters
		var battle_config_army = battle_config_forces.split("*")
		
		if battle_config_army[0] == "aya":
			magilica_army.append(battle_config_army[0])
			entity_list.append("aya")
			
		elif battle_config_army[0] == "samurai":
			var i = 0
			
			while i < int(battle_config_army[1]):
				magilica_army.append(battle_config_army[0])
				i += 1
				entity_list.append("samurai")
				
		elif battle_config_army[0] == "genby" or battle_config_army[0] == "suzaku":
			dragony_army.append(battle_config_army[0])
			if battle_config_army[0] == "genby":
				entity_list.append("genby")
			
			elif battle_config_army[0] == "suzaku":
				entity_list.append("suzaku")
				
		# insert more characters here
			
	
	var magilica_member_pos_x = 24
	var magilica_member_pos_y = 24
	var i = 0
	var j = 0
	
	# now all Magilican members are added here
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
			
		# insert more characters here
		
	
	var dragony_member_pos_x = 1256
	var dragony_member_pos_y = 24
	i = 0
	j = 0
	
	# Now all Dragonian members are added here
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
			
		# insert more characters here
	
	# Now the battle order is being defined
	i = 0
	
	for magilica_entity in magilica_scene_instances:
		if magilica_entity == aya_scene.instance():
			entity_list.append("aya")
			
	i = 0
	
	for dragony_entity in dragony_scene_instances:
		if dragony_entity == suzaku_scene.instance():
			entity_list.append("suzaku")
			
	i = 0
	
	for dragony_entity in dragony_scene_instances:
		if dragony_entity == genby_scene.instance():
			entity_list.append("genby")
			
	i = 0
	
	for magilica_entity in magilica_scene_instances:
		if magilica_entity == samurai_scene.instance():
			entity_list.append("samurai")
			
	# insert more characters here


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# That's why you and the enemy can attack each other
	if current_attacker < len(entity_list):
		pass
				
	else:
		current_attacker = 0
	
	if entity_list[current_attacker] == "aya":
		$CurrentChar.text = "Aya"
		
		if $AttackBtn.pressed:
			get_enemies()
			
		if $ConfirmBtn.pressed and $EnemyList.get_selected_items() != null:
			var enemy_to_attack = $EnemyList.items[$EnemyList.get_selected_items()[0]]
			print(enemy_to_attack)
			
			get_node("./" + enemy_to_attack).health -= 75
			
			if get_node(enemy_to_attack).health <= 0:
				if get_node(enemy_to_attack).name.begins_with("Suzaku"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "suzaku":
							entity_list.remove(k)
							break
							
				elif get_node(enemy_to_attack).name.begins_with("Genby"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "genby":
							entity_list.remove(k)
							break
							
				remove_child(get_node(enemy_to_attack))
				
			
			
			if current_attacker < len(entity_list):
				current_attacker += 1
				
			else:
				current_attacker = 0
				
			if $ConfirmBtn.pressed == false:
				$EnemyList.clear()
				
	elif entity_list[current_attacker] == "samurai":
		$CurrentChar.text = "Samurai"
		
		if $AttackBtn.pressed:
			get_enemies()
			
		if $ConfirmBtn.pressed and $EnemyList.get_selected_items() != null:
			var enemy_to_attack = $EnemyList.items[$EnemyList.get_selected_items()[0]]
			print(enemy_to_attack)
			
			get_node("./" + enemy_to_attack).health -= 15
			
			if get_node(enemy_to_attack).health <= 0:
				if get_node(enemy_to_attack).name.begins_with("Suzaku"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "suzaku":
							entity_list.remove(k)
							break
							
				elif get_node(enemy_to_attack).name.begins_with("Genby"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "genby":
							entity_list.remove(k)
							break
				
				remove_child(get_node(enemy_to_attack))
				
			
			
			if current_attacker < len(entity_list):
				current_attacker += 1
				
			else:
				current_attacker = 0
				
			if $ConfirmBtn.pressed == false:
				$EnemyList.clear()
				
	elif entity_list[current_attacker] == "suzaku":
		var to_be_attacked = rand_range(6, get_child_count() - 1)
		
		if get_child(int(to_be_attacked)).name.begins_with("Aya"):
			get_child(int(to_be_attacked)).health -= 200
			
		elif get_child(int(to_be_attacked)).name.begins_with("Samurai"):
			get_child(int(to_be_attacked)).health -= 200
		
		print(get_child(int(to_be_attacked)).health)
		var health_of_char = get_child(int(to_be_attacked)).health
		
		if health_of_char <= 0:
			if get_child(int(to_be_attacked)).name.begins_with("Aya"):
				var k = 0
				while k < len(entity_list):
					if entity_list[k] == "aya":
						entity_list.remove(k)
						break
							
			elif get_child(int(to_be_attacked)).name.begins_with("Samurai"):
				var k = 0
				while k < len(entity_list):
					if entity_list[k] == "samurai":
						entity_list.remove(k)
						break
							
			remove_child(get_child(int(to_be_attacked)))
		
		if current_attacker < len(entity_list):
				current_attacker += 1
				
		else:
			current_attacker = 0
			
	elif entity_list[current_attacker] == "genby":
		var to_be_attacked = rand_range(6, get_child_count() - 1)
		
		if get_child(int(to_be_attacked)).name.begins_with("Aya"):
			get_child(int(to_be_attacked)).health -= 200
			
		elif get_child(int(to_be_attacked)).name.begins_with("Samurai"):
			get_child(int(to_be_attacked)).health -= 200
		
		print(get_child(int(to_be_attacked)).health)
		var health_of_char = get_child(int(to_be_attacked)).health
		
		if health_of_char <= 0:
			if get_child(int(to_be_attacked)).name.begins_with("Aya"):
				var k = 0
				while k < len(entity_list):
					if entity_list[k] == "aya":
						entity_list.remove(k)
						break
							
			elif get_child(int(to_be_attacked)).name.begins_with("Samurai"):
				var k = 0
				while k < len(entity_list):
					if entity_list[k] == "samurai":
						entity_list.remove(k)
						break
						
			remove_child(get_child(int(to_be_attacked)))
		
		if current_attacker < len(entity_list):
				current_attacker += 1
				
		else:
			current_attacker = 0
			
		# insert more characters here

func get_enemies():
	var i = 6
	
	while i < get_child_count():
		if get_child(i).name.begins_with("Suzaku"):
			$EnemyList.add_item(get_child(i).name)
			
		elif get_child(i).name.begins_with("Genby"):
			$EnemyList.add_item(get_child(i).name)
			
		# insert more enemies here
		
		i += 1
