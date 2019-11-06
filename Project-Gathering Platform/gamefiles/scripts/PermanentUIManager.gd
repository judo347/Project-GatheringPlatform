extends Node2D

var label_wood_value = null
var label_stone_value = null
var label_grass_value = null

# Called when the node enters the scene tree for the first time.
func _ready():
	label_grass_value = get_node("MarginContainer/HBoxContainer/InfoBars/BarGrass/Value")
	label_stone_value = get_node("MarginContainer/HBoxContainer/InfoBars/BarStone/Value")
	label_wood_value = get_node("MarginContainer/HBoxContainer/InfoBars/BarWood/Value")
	
	update_material_labels()

func update_material_labels():
	set_material_label_values(playerInventory.material_wood_count, 
								playerInventory.material_grass_count, 
								playerInventory.material_stone_count)

func set_material_label_values(amount_wood, amount_grass, amount_stone):
	set_material_label_value(enums.MaterialEnum.GRASS, amount_grass)
	set_material_label_value(enums.MaterialEnum.WOOD, amount_wood)
	set_material_label_value(enums.MaterialEnum.STONE, amount_stone)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_material_label_value(type, amount):
	match type:
		enums.MaterialEnum.GRASS: label_grass_value.text = str(amount)
		enums.MaterialEnum.WOOD: label_wood_value.text = str(amount)
		enums.MaterialEnum.STONE: label_stone_value.text = str(amount)