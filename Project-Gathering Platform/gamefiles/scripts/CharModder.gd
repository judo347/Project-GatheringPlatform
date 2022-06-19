extends Panel

var mouseIsOver_doubleJump = false
var mouseIsOver_slide = false

var is_doubleJump_selected = false
var is_slide_selected = false

var doubleJump_cost = 10
var slide_cost = 10

func _ready():
	get_node("VBoxContainer/HBoxContainer/DoubleJump/Label").text = "Cost: " + str(doubleJump_cost)
	get_node("VBoxContainer/HBoxContainer/Slide/Label").text = "Cost: " + str(slide_cost)

func charModder_converter_tick():
	if Input.is_action_just_pressed("ui_mouse_left"):
		if mouseIsOver_doubleJump:
			if is_doubleJump_selected:
				change_status_doublejump(false)
			else:
				if playerInventory.skillpoints >= doubleJump_cost:
					change_status_doublejump(true)
		elif mouseIsOver_slide:
			if is_slide_selected:
				change_status_slide(false)
			else:
				if playerInventory.skillpoints >= slide_cost:
					change_status_slide(true)
		
		get_parent().get_node("PermanentUI").update_labels()

func mouse_entered_ability(ability_number):
	print("Enter ability: ", ability_number)
	
	match ability_number:
		0: mouseIsOver_slide = true
		1: mouseIsOver_doubleJump = true

func mouse_exit_ability(ability_number):
	print("Exit ability: ", ability_number)
	
	match ability_number:
		0: mouseIsOver_slide = false
		1: mouseIsOver_doubleJump = false

# Called when double jump is selected or de-selected
func change_status_doublejump(var isEnabled):
	if isEnabled:
		get_node("VBoxContainer/HBoxContainer/DoubleJump/DoubleJump/TextureRect2").texture = global_variables.bench_charModder_background_selected
		playerInventory.remove_skillpoints(doubleJump_cost)
	else:
		get_node("VBoxContainer/HBoxContainer/DoubleJump/DoubleJump/TextureRect2").texture = global_variables.bench_charModder_background_deselected
		playerInventory.add_skillpoints(doubleJump_cost)
	
	is_doubleJump_selected = isEnabled
	playerData.hasDoubleJump = isEnabled

# Called when slide is selected or de-selected
func change_status_slide(var isEnabled):
	if isEnabled:
		get_node("VBoxContainer/HBoxContainer/Slide/Slide/TextureRect2").texture = global_variables.bench_charModder_background_selected
		playerInventory.remove_skillpoints(slide_cost)
	else:
		get_node("VBoxContainer/HBoxContainer/Slide/Slide/TextureRect2").texture = global_variables.bench_charModder_background_deselected
		playerInventory.add_skillpoints(slide_cost)
	
	is_slide_selected = isEnabled
	playerData.hasSlide = isEnabled
