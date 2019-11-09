extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY_ACC = 20
const MOVEMENTSPEED = 400
const JUMP_HEIGHT = -800

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
	
	# Place the de-seleted char back into its slot
	match playerData.currentCharacter:
		enums.CharacterEnum.ONE:
			get_parent().get_node("CharacterSelection/Slot1/Sprite").show()
		enums.CharacterEnum.TWO:
			get_parent().get_node("CharacterSelection/Slot2/Sprite").show()
		enums.CharacterEnum.THREE:
			get_parent().get_node("CharacterSelection/Slot3/Sprite").show()
	
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