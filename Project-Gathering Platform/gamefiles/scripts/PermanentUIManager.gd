extends Node2D

var label_wood_value = null
var label_stone_value = null
var label_grass_value = null
var label_skillpoint_value = null

# Called when the node enters the scene tree for the first time.
func _ready():
	label_grass_value = get_node("MarginContainer/HBoxContainer/InfoBars/BarGrass/Value")
	label_stone_value = get_node("MarginContainer/HBoxContainer/InfoBars/BarStone/Value")
	label_wood_value = get_node("MarginContainer/HBoxContainer/InfoBars/BarWood/Value")
	label_skillpoint_value = get_node("MarginContainer/HBoxContainer/InfoBars/BarSkillpoint/Value")
	
	update_labels()

func update_labels():
	set_material_label_values(playerInventory.material_wood_count, 
								playerInventory.material_grass_count, 
								playerInventory.material_stone_count)
	set_skillpoint_label_value(playerInventory.skillpoints)

func set_skillpoint_label_value(amount_skillpoint):
	label_skillpoint_value.text = str(amount_skillpoint)

func set_material_label_values(amount_wood, amount_grass, amount_stone):
	set_material_label_value(enums.MaterialEnum.GRASS, amount_grass)
	set_material_label_value(enums.MaterialEnum.WOOD, amount_wood)
	set_material_label_value(enums.MaterialEnum.STONE, amount_stone)

func set_material_label_value(type, amount):
	match type:
		enums.MaterialEnum.GRASS: label_grass_value.text = str(amount)
		enums.MaterialEnum.WOOD: label_wood_value.text = str(amount)
		enums.MaterialEnum.STONE: label_stone_value.text = str(amount)