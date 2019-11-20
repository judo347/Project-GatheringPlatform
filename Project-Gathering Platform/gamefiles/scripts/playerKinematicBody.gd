extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY_ACC = 20
const MOVEMENTSPEED = 400
const JUMP_HEIGHT = -800
const SLIDE_FORCE = 500
const SLIDE_SPEED = 400

var is_facing_right = true

var jumps_used = 0

var slide_destination = 0
var is_sliding = false

var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite").texture = playerData.texture
	if get_parent().name == "Level":
		.get_node("Camera2D").set_offset(Vector2(0, 350))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	# Trigger character selection check and action
	if Input.is_action_just_pressed("ui_action"):
		_select_character()
		interactable_object()
	
	if Input.is_action_just_pressed("ui_achievement"):
		get_parent().get_node("UImaster").show_AchievementMenu()
	
	motion.y += GRAVITY_ACC
	
	if Input.is_action_pressed("ui_right"):
		motion.x = MOVEMENTSPEED
		is_facing_right = true
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOVEMENTSPEED
		is_facing_right = false
	else:
		motion.x = 0
		
	if Input.is_action_just_pressed("ui_up"):
		if playerData.hasDoubleJump && jumps_used < 2:
			jump()
	
	if is_on_floor():
		jumps_used = 0
		
		# print("On floor.")
		if Input.is_action_just_pressed("ui_up"):
				jump()
	
	slide(delta)
	
	motion = move_and_slide(motion, UP)
	
	pass

func slide(delta):
	if playerData.hasSlide:
		if is_on_floor():
			if Input.is_action_just_pressed("ui_down"):
				# Slide direction
				if is_facing_right:
					slide_destination = get_global_position().x + SLIDE_FORCE
				else:
					slide_destination = get_global_position().x - SLIDE_FORCE
				
				is_sliding = true
				print("Slide activated")
	
	var current_position = get_global_position()
	
	if !is_sliding:
		return
	
	var newX = 0
	
	if abs(current_position.x - slide_destination) < 0.2:
		is_sliding = false
		return
	elif current_position.x < slide_destination:
		newX = current_position.x + SLIDE_SPEED*delta
	elif current_position.x > slide_destination:
		newX = current_position.x - SLIDE_SPEED*delta
		
	set_global_position(Vector2(newX, current_position.y))

func interactable_object():
	get_parent().get_node("Benches").show_ui_player_is_touching()

func _select_character():
	
	var isCollidingCharSlotOne = get_parent().get_node("CharacterSelection").isPlayerCollidingWithCharSlot_one
	var isCollidingCharSlotTwo = get_parent().get_node("CharacterSelection").isPlayerCollidingWithCharSlot_two
	var isCollidingCharSlotThree = get_parent().get_node("CharacterSelection").isPlayerCollidingWithCharSlot_three
	
	# TODO Check if the character slot is empty
	
	if isCollidingCharSlotOne:
		# Change the current character to character one
		change_character(enums.CharacterEnum.ONE)
	elif isCollidingCharSlotTwo:
		# Change the current character to character two
		change_character(enums.CharacterEnum.TWO)
	elif isCollidingCharSlotThree:
		# Change the current character to character two
		change_character(enums.CharacterEnum.THREE)
	
	if isCollidingCharSlotOne || isCollidingCharSlotTwo || isCollidingCharSlotThree:
		get_node("Sprite").texture = playerData.texture

func change_character(type):
	
	var charPathFind_int_to = utilities.character_enum_to_int(playerData.currentCharacter)
	var chatPathFind_int_from = utilities.character_enum_to_int(type)
	
	# Place the de-seleted char back into its slot
	get_parent().get_node("CharPathFinding").move_char(chatPathFind_int_from, charPathFind_int_to)
	
#	match playerData.currentCharacter: #TODO remove, not nessesary
#		enums.CharacterEnum.ONE:
#			#get_parent().get_node("CharacterSelection/Slot1/Sprite").show()
#			get_parent().get_node("CharPathFinding").move_char(chatPathFind_int_from, charPathFind_int_to)
#		enums.CharacterEnum.TWO:
#			get_parent().get_node("CharacterSelection/Slot2/Sprite").show()
#			get_parent().get_node("CharPathFinding").move_char(chatPathFind_int_from, charPathFind_int_to)
#		enums.CharacterEnum.THREE:
#			get_parent().get_node("CharacterSelection/Slot3/Sprite").show()
#			get_parent().get_node("CharPathFinding").move_char(chatPathFind_int_from, charPathFind_int_to)
	
	# Change to the new character
	match type:
		enums.CharacterEnum.ONE:
			playerData.texture = global_variables.player_character_texture_one
			get_parent().get_node("CharacterSelection/Slot1/Sprite").hide()
		enums.CharacterEnum.TWO:
			playerData.texture = global_variables.player_character_texture_two
			get_parent().get_node("CharacterSelection/Slot2/Sprite").hide()
		enums.CharacterEnum.THREE:
			playerData.texture = global_variables.player_character_texture_three
			get_parent().get_node("CharacterSelection/Slot3/Sprite").hide()
	
	# Save the new character type
	playerData.currentCharacter = type

func _kill_player():
	queue_free()

func jump():
	motion.y = JUMP_HEIGHT
	jumps_used = jumps_used + 1