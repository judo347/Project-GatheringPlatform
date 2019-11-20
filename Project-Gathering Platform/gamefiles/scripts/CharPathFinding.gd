extends Node

const MOVEMENT_SPEED = 350
var current_moving_pathFollow2D = null
var current_moving_char_id = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if current_moving_pathFollow2D != null:
		# Has it reached end of path?
		if current_moving_pathFollow2D.get_unit_offset() > 0.99: # Done moving
			current_moving_pathFollow2D.get_node("Sprite").visible = false
			match current_moving_char_id:
				1: get_parent().get_node("CharacterSelection/Slot1/Sprite").show()
				2: get_parent().get_node("CharacterSelection/Slot2/Sprite").show()
				3: get_parent().get_node("CharacterSelection/Slot3/Sprite").show()
			current_moving_pathFollow2D.set_offset(0)
			current_moving_pathFollow2D = null
			current_moving_char_id = null
		else:
			current_moving_pathFollow2D.set_offset(current_moving_pathFollow2D.get_offset() + MOVEMENT_SPEED * delta)

func move_char(from, to):
	
	var path
	current_moving_char_id = to
	
	match from:
		1: match to:
			2: path = get_node("Slot1To2")
			3: path = get_node("Slot1To3")
		2: match to:
			1: path = get_node("Slot2To1")
			3: path = get_node("Slot2To3")
		3: match to:
			1: path = get_node("Slot3To1")
			2: path = get_node("Slot3To2")
	
	path.get_node("PathFollow2D/Sprite").show()
	current_moving_pathFollow2D = path.get_node("PathFollow2D")