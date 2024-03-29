extends Node2D


# Declare member variables here. Examples:
var battle_config = ""
var aya_scene = preload("res://assets/entities/magilica/magical-girls/aya/AyaBattle.tscn")
var chuya_scene = preload("res://assets/entities/magilica/magical-girls/chuya/ChuyaBattle.tscn")
var himari_scene = preload("res://assets/entities/magilica/magical-girls/himari/HimariBattle.tscn")
var homura_scene = preload("res://assets/entities/magilica/magical-girls/homura/HomuraBattle.tscn")
var samurai_scene = preload("res://assets/entities/magilica/samurai/SamuraiBattle.tscn")
var genby_scene = preload("res://assets/entities/dragony/dragon_kings/genby/GenbyBattle.tscn")
var suzaku_scene = preload("res://assets/entities/dragony/dragon_kings/suzaku/SuzakuBattle.tscn")
var seiryu_scene = preload("res://assets/entities/dragony/dragon_kings/seiryu/SeiryuPrototype.tscn")
# insert more characters here
var magilica_scene_instances = []
var dragony_scene_instances = []
var entity_list = []
var current_attacker = 0
var initial_number_of_entities = 0
var current_number_of_entities = 0

var battle_entity_script = preload("res://assets/entities/BattleEntity.tscn")


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
			
		elif battle_config_army[0] == "chuya":
			magilica_army.append(battle_config_army[0])
			entity_list.append("chuya")
			
		elif battle_config_army[0] == "himari":
			magilica_army.append(battle_config_army[0])
			entity_list.append("himari")
			
		elif battle_config_army[0] == "homura":
			magilica_army.append(battle_config_army[0])
			entity_list.append("homura")
			
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
				
		elif battle_config_army[0] == "seiryu":
			dragony_army.append(battle_config_army[0])
			if battle_config_army[0] == "seiryu":
				entity_list.append("seiryu")
				
		# insert more characters here
			
	
	var magilica_member_pos_x = 36
	var magilica_member_pos_y = 24
	var i = 0
	var j = 0
	
	# now all Magilican members are added here
	for magilica_member in magilica_army:
		if magilica_member == "aya":
			magilica_scene_instances.append(battle_entity_script.instance())
			$PartyContainer.add_child(magilica_scene_instances[i])
			$PartyContainer.get_child(i).create(magilica_member)
			$PartyContainer.get_child(i).position.x = magilica_member_pos_x
			$PartyContainer.get_child(i).position.y = magilica_member_pos_y
			
		elif magilica_member == "chuya":
			magilica_scene_instances.append(battle_entity_script.instance())
			$PartyContainer.add_child(magilica_scene_instances[i])
			$PartyContainer.get_child(i).create(magilica_member)
			$PartyContainer.get_child(i).position.x = magilica_member_pos_x
			$PartyContainer.get_child(i).position.y = magilica_member_pos_y
			
		elif magilica_member == "himari":
			magilica_scene_instances.append(battle_entity_script.instance())
			$PartyContainer.add_child(magilica_scene_instances[i])
			$PartyContainer.get_child(i).create(magilica_member)
			$PartyContainer.get_child(i).position.x = magilica_member_pos_x
			$PartyContainer.get_child(i).position.y = magilica_member_pos_y
			
		elif magilica_member == "homura":
			magilica_scene_instances.append(battle_entity_script.instance())
			$PartyContainer.add_child(magilica_scene_instances[i])
			$PartyContainer.get_child(i).create(magilica_member)
			$PartyContainer.get_child(i).position.x = magilica_member_pos_x
			$PartyContainer.get_child(i).position.y = magilica_member_pos_y
		
		elif magilica_member == "samurai":
			magilica_scene_instances.append(battle_entity_script.instance())
			$PartyContainer.add_child(magilica_scene_instances[i])
			$PartyContainer.get_child(i).create(magilica_member)
			$PartyContainer.get_child(i).position.x = magilica_member_pos_x
			$PartyContainer.get_child(i).position.y = magilica_member_pos_y
		
		i += 1
		j += 1
		magilica_member_pos_y += 128
		if j >= 4:
			magilica_member_pos_y = 24
			magilica_member_pos_x += 128
			j = 0
			
		# insert more characters here
		
	
	var dragony_member_pos_x = 1224
	var dragony_member_pos_y = 56
	i = 0
	j = 0
	
	# Now all Dragonian members are added here
	for dragony_member in dragony_army:
		if dragony_member == "genby":
			dragony_scene_instances.append(battle_entity_script.instance())
			$EnemyContainer.add_child(dragony_scene_instances[i])
			$EnemyContainer.get_child(i).create(dragony_member)
			$EnemyContainer.get_child(i).position.x = dragony_member_pos_x
			$EnemyContainer.get_child(i).position.y = dragony_member_pos_y
		
		elif dragony_member == "suzaku":
			dragony_scene_instances.append(battle_entity_script.instance())
			$EnemyContainer.add_child(dragony_scene_instances[i])
			$EnemyContainer.get_child(i).create(dragony_member)
			$EnemyContainer.get_child(i).position.x = dragony_member_pos_x
			$EnemyContainer.get_child(i).position.y = dragony_member_pos_y
			
		elif dragony_member == "seiryu":
			dragony_scene_instances.append(battle_entity_script.instance())
			$EnemyContainer.add_child(dragony_scene_instances[i])
			$EnemyContainer.get_child(i).create(dragony_member)
			$EnemyContainer.get_child(i).position.x = dragony_member_pos_x
			$EnemyContainer.get_child(i).position.y = dragony_member_pos_y
		
		i += 1
		
		j += 1
		dragony_member_pos_y += 128
		if j >= 9:
			dragony_member_pos_y = 48
			dragony_member_pos_x -= 128
			j = 0
			
		# insert more characters here
	
	# Now the battle order is being defined
	i = 0
	
	for dragony_entity in dragony_scene_instances:
		if dragony_entity.get_child(0) == seiryu_scene.instance():
			entity_list.append("seiryu")
	
	i = 0
	
	for dragony_entity in dragony_scene_instances:
		if dragony_entity.get_child(0) == genby_scene.instance():
			entity_list.append("genby")
			
	i = 0
	
	for dragony_entity in dragony_scene_instances:
		if dragony_entity.get_child(0) == suzaku_scene.instance():
			entity_list.append("suzaku")
			
	i = 0
	
	for magilica_entity in magilica_scene_instances:
		if magilica_entity.get_child(0) == himari_scene.instance():
			entity_list.append("himari")
			
	i = 0
	
	for magilica_entity in magilica_scene_instances:
		if magilica_entity.get_child(0) == homura_scene.instance():
			entity_list.append("homura")
	
	i = 0
	
	for magilica_entity in magilica_scene_instances:
		if magilica_entity.get_child(0) == aya_scene.instance():
			entity_list.append("aya")
	
	i = 0
	
	for magilica_entity in magilica_scene_instances:
		if magilica_entity.get_child(0) == samurai_scene.instance():
			entity_list.append("samurai")
			
	i = 0
	
	for magilica_entity in magilica_scene_instances:
		if magilica_entity.get_child(0) == chuya_scene.instance():
			entity_list.append("chuya")
			
	# insert more characters here
	print(len(entity_list))
	#initial_number_of_entities = len(entity_list)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# That's why you and the enemy can attack each other
	if entity_list[current_attacker] == "aya":
		if $PartyContainer.get_child(current_attacker).get_node("AyaBattle") != null:
			$CurrentChar.text = "Aya"
			
		else:
			entity_list.remove(current_attacker)
		
	elif entity_list[current_attacker] == "chuya":
		if $PartyContainer.get_child(current_attacker).get_node("ChuyaBattle") != null:
			$CurrentChar.text = "Chuya"
			
		else:
			entity_list.remove(current_attacker)
		
	elif entity_list[current_attacker] == "himari":
		if $PartyContainer.get_child(current_attacker).get_node("HimariBattle") != null:
			$CurrentChar.text = "Himari"
			
		else:
			entity_list.remove(current_attacker)
		
	elif entity_list[current_attacker] == "homura":
		if $PartyContainer.get_child(current_attacker).get_node("HomuraBattle") != null:
			$CurrentChar.text = "Homura"
			
		else:
			entity_list.remove(current_attacker)
		
	elif entity_list[current_attacker] == "samurai":
		# may need to be replaced when the story progresses
		if $PartyContainer.get_child(current_attacker).get_node("SamuraiBattle") != null:
			$CurrentChar.text = "Samurai"
			
		else:
			entity_list.remove(current_attacker)

	elif entity_list[current_attacker] == "suzaku":
		$EnemyList.clear()
		var to_be_attacked = rand_range(0, $PartyContainer.get_child_count() - 1)
		
		if $PartyContainer.get_child_count() > 0 and $EnemyContainer.get_child(current_attacker - $PartyContainer.get_child_count()) != null:
			$EnemyContainer.get_child(current_attacker - $PartyContainer.get_child_count()).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
		
			print($PartyContainer.get_child(int(to_be_attacked)).stats["hp"])
			var health_of_char = $PartyContainer.get_child(int(to_be_attacked)).stats["hp"]
		
			if health_of_char <= 0:
				if $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Aya"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "aya":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Chuya"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "chuya":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Himari"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "himari":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Homura"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "homura":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Samurai"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "samurai":
							entity_list.remove(k)
							break
							
				$PartyContainer.remove_child($PartyContainer.get_child(int(to_be_attacked)))
				current_attacker = 0
		
		
		if current_attacker >= len(entity_list):
			current_attacker = 0
			print(entity_list[current_attacker])
				
		else:
			current_attacker += 1
			if current_attacker >= len(entity_list):
				current_attacker = 0
				print(entity_list[current_attacker])
				
		var i = 0
		var enemies_alive = []
		var can_return = true
	
		while i < $PartyContainer.get_child_count():
			enemies_alive.append($PartyContainer.get_child(i).stats["hp"])
			i += 1
		
		i = 0
	
		while i < len(enemies_alive):
			if enemies_alive[i] > 0:
				can_return = false
				break
		
		i += 1
	
		if can_return:
			get_tree().change_scene("res://assets/menus/main-menu/MainMenu.tscn")
		
		if $PartyContainer.get_child_count() == 0 or $EnemyContainer.get_child_count() == 0:
			get_tree().change_scene("res://assets/menus/main-menu/MainMenu.tscn")
			
	elif entity_list[current_attacker] == "genby":
		$EnemyList.clear()
		var to_be_attacked = rand_range(0, $PartyContainer.get_child_count() - 1)
		print(current_attacker)
		
		if $PartyContainer.get_child_count() > 0 and $EnemyContainer.get_child(current_attacker - $PartyContainer.get_child_count()) != null:
			$EnemyContainer.get_child(current_attacker - $PartyContainer.get_child_count()).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
			
			print($PartyContainer.get_child(int(to_be_attacked)).stats["hp"])
			var health_of_char = $PartyContainer.get_child(int(to_be_attacked)).stats["hp"]
		
			if health_of_char <= 0:
				if $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Aya"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "aya":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Chuya"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "chuya":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Himari"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "himari":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Homura"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "homura":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Samurai"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "samurai":
							entity_list.remove(k)
							break
				
				$PartyContainer.get_child(
					int(to_be_attacked)
					).remove_child($PartyContainer.get_child(
						int(to_be_attacked)).get_child(0))
				
				$PartyContainer.remove_child(
					$PartyContainer.get_child(int(to_be_attacked)))
		
				current_attacker = 0
		
		if current_attacker >= len(entity_list):
			current_attacker = 0
			print(entity_list[current_attacker])
				
		else:
			current_attacker += 1
			if current_attacker >= len(entity_list):
				current_attacker = 0
				print(entity_list[current_attacker])
		
		var i = 0
		var enemies_alive = []
		var can_return = true
	
		while i < $PartyContainer.get_child_count():
			enemies_alive.append($PartyContainer.get_child(i).stats["hp"])
			i += 1
		
		i = 0
	
		while i < len(enemies_alive):
			if enemies_alive[i] > 0:
				can_return = false
				break
		
			i += 1
	
		if can_return:
			get_tree().change_scene("res://assets/menus/main-menu/MainMenu.tscn")
		
		if $PartyContainer.get_child_count() == 0 or $EnemyContainer.get_child_count() == 0:
			get_tree().change_scene("res://assets/menus/main-menu/MainMenu.tscn")
		
	elif entity_list[current_attacker] == "seiryu":
		$EnemyList.clear()
		var to_be_attacked = rand_range(0, $PartyContainer.get_child_count() - 1)
		
		print(current_attacker)
		if $PartyContainer.get_child_count() > 0 and $EnemyContainer.get_child(current_attacker - $PartyContainer.get_child_count()) != null:
			$EnemyContainer.get_child(current_attacker - $PartyContainer.get_child_count()).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
			
			print($PartyContainer.get_child(int(to_be_attacked)).stats["hp"])
			var health_of_char = $PartyContainer.get_child(int(to_be_attacked)).stats["hp"]
		
			if health_of_char <= 0:
				if $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Aya"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "aya":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Chuya"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "chuya":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Himari"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "himari":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Homura"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "homura":
							entity_list.remove(k)
							break
							
				elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Samurai"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "samurai":
							entity_list.remove(k)
							break
				
				$PartyContainer.get_child(
					int(to_be_attacked)
					).remove_child($PartyContainer.get_child(
						int(to_be_attacked)).get_child(0))
				
				$PartyContainer.remove_child(
					$PartyContainer.get_child(int(to_be_attacked)))
		
				current_attacker = 0
		
		if current_attacker >= len(entity_list):
			current_attacker = 0
			print(entity_list[current_attacker])
				
		else:
			current_attacker += 1
			if current_attacker >= len(entity_list):
				current_attacker = 0
				print(entity_list[current_attacker])
		
		var i = 0
		var enemies_alive = []
		var can_return = true
	
		while i < $PartyContainer.get_child_count():
			enemies_alive.append($PartyContainer.get_child(i).stats["hp"])
			i += 1
		
		i = 0
	
		while i < len(enemies_alive):
			if enemies_alive[i] > 0:
				can_return = false
				break
		
			i += 1
	
		if can_return:
			get_tree().change_scene("res://assets/menus/main-menu/MainMenu.tscn")
		
		if $PartyContainer.get_child_count() == 0 or $EnemyContainer.get_child_count() == 0:
			get_tree().change_scene("res://assets/menus/main-menu/MainMenu.tscn")
		
		# insert more characters here

func get_enemies():
	var i = 0
	
	while i < $EnemyContainer.get_child_count():
		if $EnemyContainer.get_child(i).get_child(0).died:
			$EnemyList.add_item($EnemyContainer.get_child(i).get_child(0).name + " (died)")
		else:
			$EnemyList.add_item($EnemyContainer.get_child(i).get_child(0).name)
			
		# insert more enemies here
		
		i += 1


func _on_ConfirmBtn_pressed():
	$ConfirmBtn.disabled = true
	var enemy_to_attack = $EnemyList.items[$EnemyList.get_selected_items()[0]]
	print(enemy_to_attack)
	print(entity_list[current_attacker])
	
	if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).died == false:
		$PartyContainer.get_child(current_attacker).deal_damage($EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
	
	if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]) != null:
		if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).stats["hp"] <= 0:
			if enemy_to_attack != null:
				if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Suzaku"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "suzaku":
							entity_list.remove(k)
							break
				
					$EnemyContainer.get_child(
						$EnemyList.get_selected_items()[0]
						).remove_child($EnemyContainer.get_child(
							$EnemyList.get_selected_items()[0]).get_child(0))
				
					$EnemyContainer.remove_child(
						$EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
							
				elif $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Genby"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "genby":
							entity_list.remove(k)
							break
				
					$EnemyContainer.get_child(
						$EnemyList.get_selected_items()[0]
						).remove_child($EnemyContainer.get_child(
							$EnemyList.get_selected_items()[0]).get_child(0))
				
					$EnemyContainer.remove_child(
						$EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
					
				elif $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Seiryu"):
					var k = 0
					while k < len(entity_list):
						if entity_list[k] == "seiryu":
							entity_list.remove(k)
							break
				
					$EnemyContainer.get_child(
						$EnemyList.get_selected_items()[0]
						).remove_child($EnemyContainer.get_child(
							$EnemyList.get_selected_items()[0]).get_child(0))
				
					$EnemyContainer.remove_child(
						$EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
				
	if current_attacker >= len(entity_list):
		current_attacker = 0
		print(entity_list[current_attacker])
				
	else:
		current_attacker += 1
		if current_attacker >= len(entity_list):
			current_attacker = 0
			print(entity_list[current_attacker])
			
	var i = 0
	var enemies_alive = []
	var can_return = true
	
	while i < $EnemyContainer.get_child_count():
		enemies_alive.append($EnemyContainer.get_child(i).stats["hp"])
		i += 1
		
	i = 0
	
	while i < len(enemies_alive):
		if enemies_alive[i] > 0: 
			can_return = false
			break
		
		i += 1
	
	if can_return:
		get_tree().change_scene("res://assets/menus/main-menu/MainMenu.tscn")
	
	if $PartyContainer.get_child_count() == 0 or $EnemyContainer.get_child_count() == 0:
		get_tree().change_scene("res://assets/menus/main-menu/MainMenu.tscn")
			
	$EnemyList.clear()


func _on_AttackBtn_pressed():
	get_enemies()
	$ConfirmBtn.disabled = false


func _on_PassBtn_pressed():
	if current_attacker >= len(entity_list):
		current_attacker = 0
		print(entity_list[current_attacker])
				
	else:
		current_attacker += 1
		if current_attacker >= len(entity_list):
			current_attacker = 0
			print(entity_list[current_attacker])
			
	$EnemyList.clear()


func _on_RetreatBtn_pressed():
	get_tree().change_scene("res://assets/menus/main-menu/MainMenu.tscn")
