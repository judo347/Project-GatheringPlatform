extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY_ACC = 20
const MOVEMENTSPEED = 400
const JUMP_HEIGHT = -800

var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite").texture = playerData.texture
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	# Trigger character selection check and action
	if Input.is_action_just_pressed("ui_action"):
		_select_character()
	
	
	motion.y += GRAVITY_ACC
	
	if Input.is_action_pressed("ui_right"):
		motion.x = MOVEMENTSPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOVEMENTSPEED
	else:
		motion.x = 0
		
		
	if is_on_floor():
		# print("On floor.")
		if Input.is_action_just_pressed("ui_up"):
				motion.y = JUMP_HEIGHT
	
	motion = move_and_slide(motion, UP)
	
	pass
	
func _select_character():
	
	var isCollidingCharSlotOne = get_parent().get_node("CharacterSelection").isPlayerCollidingWithCharSlot_one
	var isCollidingCharSlotTwo = get_parent().get_node("CharacterSelection").isPlayerCollidingWithCharSlot_two
	var isCollidingCharSlotThree = get_parent().get_node("CharacterSelection").isPlayerCollidingWithCharSlot_three
	
	# TODO Check if the character slot is empty
	
	if isCollidingCharSlotOne:
		# Change the current character to character one
		playerData.texture = global_variables.player_character_texture_one
	elif isCollidingCharSlotTwo:
		# Change the current character to character two
		playerData.texture = global_variables.player_character_texture_two
	elif isCollidingCharSlotThree:
		# Change the current character to character two
		playerData.texture = global_variables.player_character_texture_three
	
	if isCollidingCharSlotOne || isCollidingCharSlotTwo || isCollidingCharSlotThree:
		get_node("Sprite").texture = playerData.texture

func _kill_player():
	queue_free()