extends Panel

var isMouseOver_level_danger_plus = false
var isMouseOver_level_danger_minus = false

var isMouseOver_level_materialYield_plus = false
var isMouseOver_level_materialYield_minus = false

var isMouseOver_player_movementspeed_plus = false
var isMouseOver_player_movementspeed_minus = false

onready var level_materialYield_value_label = get_node("VBoxContainer/LevelVBox/VBoxContainer/MaterialYieldBox/Value")
onready var level_danger_value_label = get_node("VBoxContainer/LevelVBox/VBoxContainer/DangerBox/Value")
onready var player_movementspeed_value_label = get_node("VBoxContainer/PlayerVBox/VBoxContainer/MovementSpeedBox/Value")

func _ready():
	level_danger_value_label.text = str(playerData.levelMod_level_dangerPoints)
	level_materialYield_value_label.text = str(playerData.levelMod_level_materialYield)
	player_movementspeed_value_label.text = str(playerData.levelMod_player_movementspeedPoints)

func levelModder_tick():
	if Input.is_action_just_pressed("ui_mouse_left"):
		if isMouseOver_level_danger_plus:
			if playerInventory.skillpoints > 0:
				playerData.levelMod_level_dangerPoints += 1
				playerInventory.remove_skillpoint()
				level_danger_value_label.text = str(playerData.levelMod_level_dangerPoints)
		elif isMouseOver_level_danger_minus:
			if playerData.levelMod_level_dangerPoints > 0:
				playerData.levelMod_level_dangerPoints -= 1
				playerInventory.add_skillpoint()
				level_danger_value_label.text = str(playerData.levelMod_level_dangerPoints)
		elif isMouseOver_level_materialYield_plus:
			if playerInventory.skillpoints > 0:
				playerData.levelMod_level_materialYield += 1
				playerInventory.remove_skillpoint()
				level_materialYield_value_label.text = str(playerData.levelMod_level_materialYield)
		elif isMouseOver_level_materialYield_minus:
			if playerData.levelMod_level_materialYield > 0:
				playerData.levelMod_level_materialYield -= 1
				playerInventory.add_skillpoint()
				level_materialYield_value_label.text = str(playerData.levelMod_level_materialYield)
		elif isMouseOver_player_movementspeed_plus:
			if playerInventory.skillpoints > 0:
				playerData.levelMod_player_movementspeedPoints += 1
				playerInventory.remove_skillpoint()
				player_movementspeed_value_label.text = str(playerData.levelMod_player_movementspeedPoints)
		elif isMouseOver_player_movementspeed_minus:
			if playerData.levelMod_player_movementspeedPoints > 0:
				playerData.levelMod_player_movementspeedPoints -= 1
				playerInventory.add_skillpoint()
				player_movementspeed_value_label.text = str(playerData.levelMod_player_movementspeedPoints)
		
		get_parent().get_node("PermanentUI").update_labels()

func mouse_entered_plusORminus(modnumber, isPlus):
	print("Enter modnumber: ", modnumber, " ", isPlus)
	
	match modnumber:
		0: match isPlus:
				true: isMouseOver_level_danger_plus = true
				false:isMouseOver_level_danger_minus = true
		1: match isPlus:
				true: isMouseOver_player_movementspeed_plus = true
				false:isMouseOver_player_movementspeed_minus = true
		2: match isPlus:
				true: isMouseOver_level_materialYield_plus = true
				false:isMouseOver_level_materialYield_minus = true

func mouse_exited_plusORminus(modnumber, isPlus):
	print("Exit modnumber: ", modnumber, " ", isPlus)
	
	match modnumber:
		0: match isPlus:
				true: isMouseOver_level_danger_plus = false
				false:isMouseOver_level_danger_minus = false
		1: match isPlus:
				true: isMouseOver_player_movementspeed_plus = false
				false:isMouseOver_player_movementspeed_minus = false
		2: match isPlus:
				true: isMouseOver_level_materialYield_plus = false
				false:isMouseOver_level_materialYield_minus = false