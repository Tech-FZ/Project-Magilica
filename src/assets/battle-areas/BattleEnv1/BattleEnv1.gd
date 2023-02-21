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
# insert more characters here
var magilica_scene_instances = []
var dragony_scene_instances = []
var entity_list = []
var current_attacker = 0

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
				
		# insert more characters here
			
	
	var magilica_member_pos_x = 24
	var magilica_member_pos_y = 24
	var i = 0
	var j = 0
	
	# now all Magilican members are added here
	for magilica_member in magilica_army:
		if magilica_member == "aya":
			#magilica_scene_instances.append(aya_scene.instance())
			magilica_scene_instances.append(battle_entity_script.instance())
			$PartyContainer.add_child(magilica_scene_instances[i])
			$PartyContainer.get_child(i).create(magilica_member)
			$PartyContainer.get_child(i).position.x = magilica_member_pos_x
			$PartyContainer.get_child(i).position.y = magilica_member_pos_y
			
		elif magilica_member == "chuya":
			#magilica_scene_instances.append(aya_scene.instance())
			magilica_scene_instances.append(battle_entity_script.instance())
			$PartyContainer.add_child(magilica_scene_instances[i])
			$PartyContainer.get_child(i).create(magilica_member)
			$PartyContainer.get_child(i).position.x = magilica_member_pos_x
			$PartyContainer.get_child(i).position.y = magilica_member_pos_y
			
		elif magilica_member == "himari":
			#magilica_scene_instances.append(aya_scene.instance())
			magilica_scene_instances.append(battle_entity_script.instance())
			$PartyContainer.add_child(magilica_scene_instances[i])
			$PartyContainer.get_child(i).create(magilica_member)
			$PartyContainer.get_child(i).position.x = magilica_member_pos_x
			$PartyContainer.get_child(i).position.y = magilica_member_pos_y
			
		elif magilica_member == "homura":
			#magilica_scene_instances.append(aya_scene.instance())
			magilica_scene_instances.append(battle_entity_script.instance())
			$PartyContainer.add_child(magilica_scene_instances[i])
			$PartyContainer.get_child(i).create(magilica_member)
			$PartyContainer.get_child(i).position.x = magilica_member_pos_x
			$PartyContainer.get_child(i).position.y = magilica_member_pos_y
		
		elif magilica_member == "samurai":
			#magilica_scene_instances.append(samurai_scene.instance())
			#$PartyContainer.add_child(magilica_scene_instances[i])
			magilica_scene_instances.append(battle_entity_script.instance())
			$PartyContainer.add_child(magilica_scene_instances[i])
			$PartyContainer.get_child(i).create(magilica_member)
			$PartyContainer.get_child(i).position.x = magilica_member_pos_x
			$PartyContainer.get_child(i).position.y = magilica_member_pos_y
			#get_child(get_child_count() - 1).position.x = magilica_member_pos_x
			#get_child(get_child_count() - 1).position.y = magilica_member_pos_y
		
		i += 1
		j += 1
		magilica_member_pos_y += 128
		if j >= 4:
			magilica_member_pos_y = 24
			magilica_member_pos_x += 128
			j = 0
			
		# insert more characters here
		
	
	var dragony_member_pos_x = 1256
	var dragony_member_pos_y = 24
	i = 0
	j = 0
	
	# Now all Dragonian members are added here
	for dragony_member in dragony_army:
		if dragony_member == "genby":
			#dragony_scene_instances.append(genby_scene.instance())
			dragony_scene_instances.append(battle_entity_script.instance())
			$EnemyContainer.add_child(dragony_scene_instances[i])
			$EnemyContainer.get_child(i).create(dragony_member)
			$EnemyContainer.get_child(i).position.x = dragony_member_pos_x
			$EnemyContainer.get_child(i).position.y = dragony_member_pos_y
			#get_child(get_child_count() - 1).position.x = dragony_member_pos_x
			#get_child(get_child_count() - 1).position.y = dragony_member_pos_y
		
		elif dragony_member == "suzaku":
			#dragony_scene_instances.append(suzaku_scene.instance())
			#$EnemyContainer.add_child(dragony_scene_instances[i])
			dragony_scene_instances.append(battle_entity_script.instance())
			$EnemyContainer.add_child(dragony_scene_instances[i])
			$EnemyContainer.get_child(i).create(dragony_member)
			$EnemyContainer.get_child(i).position.x = dragony_member_pos_x
			$EnemyContainer.get_child(i).position.y = dragony_member_pos_y
			#get_child(get_child_count() - 1).position.x = dragony_member_pos_x
			#get_child(get_child_count() - 1).position.y = dragony_member_pos_y
		
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# That's why you and the enemy can attack each other
	if entity_list[current_attacker] == "aya":
		$CurrentChar.text = "Aya"
		
		#if $AttackBtn.pressed:
		#	get_enemies()
		#	$ConfirmBtn.disabled = false
			
		#if $ConfirmBtn.pressed and $EnemyList.get_selected_items() != null:
		#	$ConfirmBtn.disabled = true
		#	var enemy_to_attack = $EnemyList.items[$EnemyList.get_selected_items()[0]]
		#	print(enemy_to_attack)
			
		#	$PartyContainer.get_child(current_attacker).deal_damage($EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
			
		#	if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).stats["hp"] <= 0:
		#		if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Suzaku"):
		#			var k = 0
		#			while k < len(entity_list):
		#				if entity_list[k] == "suzaku":
		#					entity_list.remove(k)
		#					break
		#					
		#		elif $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Genby"):
		#			var k = 0
		#			while k < len(entity_list):
		#				if entity_list[k] == "genby":
		#					entity_list.remove(k)
		#					break
		#					
		#		$EnemyContainer.remove_child(
		#			$EnemyContainer.get_child(
		#				$EnemyList.get_selected_items()[0]))
		#		
		#	
		#	
		#	if current_attacker >= len(entity_list):
		#		current_attacker = 0
		#		
		#	else:
		#		current_attacker += 1
				
		#	if $ConfirmBtn.pressed == false:
		#		$EnemyList.clear()
		
	elif entity_list[current_attacker] == "chuya":
		$CurrentChar.text = "Chuya"
		
	elif entity_list[current_attacker] == "himari":
		$CurrentChar.text = "Himari"
		
	elif entity_list[current_attacker] == "homura":
		$CurrentChar.text = "Homura"
		
	elif entity_list[current_attacker] == "samurai":
		$CurrentChar.text = "Samurai"
		
		#if $AttackBtn.pressed:
		#	get_enemies()
		#	$ConfirmBtn.disabled = false
			
		#if $ConfirmBtn.pressed and $EnemyList.get_selected_items() != null:
		#	$ConfirmBtn.disabled = true
		#	var enemy_to_attack = $EnemyList.items[$EnemyList.get_selected_items()[0]]
		#	print(enemy_to_attack)
		#	
		#	$PartyContainer.get_child(current_attacker).deal_damage($EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
		#	
		#	if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).stats["hp"] <= 0:
		#		if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Suzaku"):
		#			var k = 0
		#			while k < len(entity_list):
		#				if entity_list[k] == "suzaku":
		#					entity_list.remove(k)
		#					break
		#					
		#		elif $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Genby"):
		#			var k = 0
		#			while k < len(entity_list):
		#				if entity_list[k] == "genby":
		#					entity_list.remove(k)
		#					break
		#		
		#		$EnemyContainer.remove_child(
		#			$EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
		#		
		#	
		#	
		#	if current_attacker >= len(entity_list):
		#		current_attacker = 0
		#		
		#else:
		#	current_attacker += 1
		#		
		#	if $ConfirmBtn.pressed == false:
		#		$EnemyList.clear()
				
	elif entity_list[current_attacker] == "suzaku":
		$EnemyList.clear()
		var to_be_attacked = rand_range(0, $PartyContainer.get_child_count() - 1)
		
		if $PartyContainer.get_child_count() > 0:
			if $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Aya"):
				$EnemyContainer.get_child(current_attacker - 4).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
			
			elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Chuya"):
				$EnemyContainer.get_child(current_attacker - 4).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
			
			elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Himari"):
				$EnemyContainer.get_child(current_attacker - 4).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
				
			elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Homura"):
				$EnemyContainer.get_child(current_attacker - 4).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
			
			elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Samurai"):
				$EnemyContainer.get_child(current_attacker - 4).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
		
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
		
		if current_attacker >= len(entity_list):
			current_attacker = 0
			print(entity_list[current_attacker])
				
		else:
			current_attacker += 1
			if current_attacker >= len(entity_list):
				current_attacker = 0
				print(entity_list[current_attacker])
			
	elif entity_list[current_attacker] == "genby":
		$EnemyList.clear()
		var to_be_attacked = rand_range(0, $PartyContainer.get_child_count() - 1)
		print(current_attacker)
		if $PartyContainer.get_child_count() > 0:
			if $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Aya"):
				$EnemyContainer.get_child(current_attacker - 3).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
			
			elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Chuya"):
				$EnemyContainer.get_child(current_attacker - 3).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
	
			elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Himari"):
				$EnemyContainer.get_child(current_attacker - 3).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
				
			elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Homura"):
				$EnemyContainer.get_child(current_attacker - 3).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
			
			elif $PartyContainer.get_child(int(to_be_attacked)).get_child(0).name.begins_with("Samurai"):
				$EnemyContainer.get_child(current_attacker - 3).deal_damage($PartyContainer.get_child(int(to_be_attacked)))
		
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
		
		if current_attacker >= len(entity_list):
			current_attacker = 0
			print(entity_list[current_attacker])
				
		else:
			current_attacker += 1
			if current_attacker >= len(entity_list):
				current_attacker = 0
				print(entity_list[current_attacker])
			
		# insert more characters here

func get_enemies():
	var i = 0
	
	while i < $EnemyContainer.get_child_count():
		$EnemyList.add_item($EnemyContainer.get_child(i).get_child(0).name)
		#if $EnemyContainer.get_child(i).name.begins_with("Suzaku"):
		#	$EnemyList.add_item($EnemyContainer.get_child(i).name)
		#	
		#elif $EnemyContainer.get_child(i).name.begins_with("Genby"):
		#	$EnemyList.add_item($EnemyContainer.get_child(i).name)
			
		# insert more enemies here
		
		i += 1


func _on_ConfirmBtn_pressed():
	$ConfirmBtn.disabled = true
	var enemy_to_attack = $EnemyList.items[$EnemyList.get_selected_items()[0]]
	print(enemy_to_attack)
	print(entity_list[current_attacker])
			
	$PartyContainer.get_child(current_attacker).deal_damage($EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
	
	if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).died == true:
		if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Suzaku"):
			var k = 0
			while k < len(entity_list):
				if entity_list[k] == "suzaku":
					entity_list.remove(k)
					break
					
			$EnemyContainer.remove_child(
				$EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
							
		elif $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Genby"):
			var k = 0
			while k < len(entity_list):
				if entity_list[k] == "genby":
					entity_list.remove(k)
					break
					
			$EnemyContainer.remove_child(
				$EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
	
	if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).stats["hp"] <= 0:
		if $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Suzaku"):
			var k = 0
			while k < len(entity_list):
				if entity_list[k] == "suzaku":
					entity_list.remove(k)
					break
					
			$EnemyContainer.remove_child(
				$EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
							
		elif $EnemyContainer.get_child($EnemyList.get_selected_items()[0]).get_node(enemy_to_attack).name.begins_with("Genby"):
			var k = 0
			while k < len(entity_list):
				if entity_list[k] == "genby":
					entity_list.remove(k)
					break
					
			$EnemyContainer.remove_child(
				$EnemyContainer.get_child($EnemyList.get_selected_items()[0]))
				
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
			
	$EnemyList.clear()


func _on_AttackBtn_pressed():
	get_enemies()
	$ConfirmBtn.disabled = false
