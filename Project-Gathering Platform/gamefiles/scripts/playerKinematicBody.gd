extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY_ACC = 20
const MOVEMENTSPEED = 400
const JUMP_HEIGHT = -800

var motion = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


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
	
	var isCollidingCharOne = get_parent().get_node("CharacterSelection").isPlayerCollidingWithCharSlot_one
	var isCollidingCharTwo = get_parent().get_node("CharacterSelection").isPlayerCollidingWithCharSlot_two
	
	if isCollidingCharOne:
		# Change the current character to character one
		_swap_sprites(get_node("Sprite"), get_parent().get_node("CharacterSelection/Slot1").get_node("Sprite"))
	elif isCollidingCharTwo:
		# Change the current character to character two
		_swap_sprites(get_node("Sprite"), get_parent().get_node("CharacterSelection/Slot2").get_node("Sprite"))
	
	pass
	
func _swap_sprites(one, two):
	var tempTexture = one.texture
	
	one.texture = two.texture
	two.texture = tempTexture
	
	pass
	
func _kill_player():
	queue_free()