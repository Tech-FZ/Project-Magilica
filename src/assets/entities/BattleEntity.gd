extends Node


enum Action {
	ATTACK, 
	DEFEND, 
	WAIT, 
	INVALID
	}
var current_action = Action.INVALID

enum State {
	DEFAULT, 
	UNCONSCIOUS,
	INVALID
	}
var current_state = State.INVALID

var stats = {
	hp = -1,
	atk = -1,
	def = -1,
	spd = -1
}
var initialized = false

func create(entity_id):
	
	var entity
	if entity_id == 'aya':
		entity = load("res://assets/entities/magilica/magical-girls/aya/AyaBattle.tscn")
	if entity_id == 'chuya':
		entity = load("res://assets/entities/magilica/magical-girls/chuya/ChuyaBattle.tscn")
	if entity_id == 'himari':
		entity = load("res://assets/entities/magilica/magical-girls/himari/HimariBattle.tscn")
	if entity_id == 'homura':
		entity = load("res://assets/entities/magilica/magical-girls/homura/HomuraBattle.tscn")
	
	if entity_id == 'suzaku':
		entity = load("res://assets/entities/dragony/dragon_kings/suzaku/SuzakuBattle.tscn")
	if entity_id == 'seiryu':
		entity = load("res://assets/entities/dragony/dragon_kings/seiryu/SeiryuPrototype.tscn")
	if entity_id == 'genby':
		entity = load("res://assets/entities/dragony/dragon_kings/genby/GenbyBattle.tscn")
	if entity_id == 'dilong':
		entity = load("res://assets/entities/dragony/dragon_kings/dilong/DilongBattle.tscn")
	
	# attach entity as child (for sprite and other attributes)
	var entity_instance = entity.instance()
	add_child(entity_instance)
	
	# populate entity stats
	stats = entity_instance.get_stats()
	
	
	
	# set flag to assure main loop that this object is valid
	initialized = true

func deal_damage(target):
	# assert target is a Battle Entity 
	var damage = stats.atk # TODO: update this to make more reasonable
	target.receive_damage(damage)

func receive_damage(damage_value):
	# TODO: this is temporary, refine this later
	
	# DEF stat = subract DEF stat value from incoming damage value 
	var modified_damage = damage_value - stats.def
	
	# if defending, subtract 2x DEF stat
	if (current_action == Action.DEFEND): 
		modified_damage -= stats.def	
			
	stats.hp -= modified_damage

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass