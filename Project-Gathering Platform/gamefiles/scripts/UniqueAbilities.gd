extends Panel

var mouseIsOver_noDeathPenalty = false
var mouseIsOver_worldFlip = false

var is_noDeathPenalty_selected = false
var is_worldFlip_selected = false

var noDeathPenalty_cost = 10
var worldFlip_cost = 10

func _ready():
	get_node("VBoxContainer/HBoxContainer/NoDeathPenalty/Label").text = "Cost: " + str(noDeathPenalty_cost)
	get_node("VBoxContainer/HBoxContainer/WorldFlip/Label").text = "Cost: " + str(worldFlip_cost)

func uniqueAbilities_tick():
	if Input.is_action_just_pressed("ui_mouse_left"):
		if mouseIsOver_noDeathPenalty:
			if is_noDeathPenalty_selected:
				change_status_noDeathPenalty(false)
			else:
				if playerInventory.skillpoints >= noDeathPenalty_cost:
					change_status_noDeathPenalty(true)
		elif mouseIsOver_worldFlip:
			if is_worldFlip_selected:
				change_status_worldFlip(false)
			else:
				if playerInventory.skillpoints >= worldFlip_cost:
					change_status_worldFlip(true)
		
		get_parent().get_node("PermanentUI").update_labels()

func mouse_entered_ability(ability_number):
	print("Enter ability: ", ability_number)
	
	match ability_number:
		0: mouseIsOver_worldFlip = true
		1: mouseIsOver_noDeathPenalty = true

func mouse_exit_ability(ability_number):
	print("Exit ability: ", ability_number)
	
	match ability_number:
		0: mouseIsOver_worldFlip = false
		1: mouseIsOver_noDeathPenalty = false

# Called when double jump is selected or de-selected
func change_status_noDeathPenalty(var isEnabled):
	if isEnabled:
		get_node("VBoxContainer/HBoxContainer/NoDeathPenalty/CenterContainer/TextureRect2").texture = global_variables.bench_charModder_background_selected
		playerInventory.remove_skillpoints(noDeathPenalty_cost)
	else:
		get_node("VBoxContainer/HBoxContainer/NoDeathPenalty/CenterContainer/TextureRect2").texture = global_variables.bench_charModder_background_deselected
		playerInventory.add_skillpoints(noDeathPenalty_cost)
	
	is_noDeathPenalty_selected = isEnabled
	playerData.is_noDeathPenalty_enabled = isEnabled

# Called when slide is selected or de-selected
func change_status_worldFlip(var isEnabled):
	if isEnabled:
		get_node("VBoxContainer/HBoxContainer/WorldFlip/CenterContainer/TextureRect2").texture = global_variables.bench_charModder_background_selected
		playerInventory.remove_skillpoints(worldFlip_cost)
	else:
		get_node("VBoxContainer/HBoxContainer/WorldFlip/CenterContainer/TextureRect2").texture = global_variables.bench_charModder_background_deselected
		playerInventory.add_skillpoints(worldFlip_cost)
	
	is_worldFlip_selected = isEnabled
	playerData.is_worldFlip_enabled = isEnabled