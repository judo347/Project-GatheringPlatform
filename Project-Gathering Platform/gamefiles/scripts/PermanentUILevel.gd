extends Node2D

var label_wood_value = null
var label_stone_value = null
var label_grass_value = null

func _physics_process(delta):
	
	# Update UI location on level scene 
	var playerX = get_tree().get_root().get_node("Level/Player").get_position().x
	var cameraPosVec = get_parent().get_camera_position()
	var uiHeight = 200
	set_global_position(Vector2(cameraPosVec.x -OS.window_size.x, -OS.window_size.y + uiHeight))

# Called when the node enters the scene tree for the first time.
func _ready():
	label_grass_value = get_node("MarginContainer/HBoxContainer/InfoBars/BarGrass/Value")
	label_stone_value = get_node("MarginContainer/HBoxContainer/InfoBars/BarStone/Value")
	label_wood_value = get_node("MarginContainer/HBoxContainer/InfoBars/BarWood/Value")
	
	update_labels()

func update_labels():
	set_material_label_values(playerInventory.material_wood_count_level_collected, 
								playerInventory.material_grass_count_level_collected, 
								playerInventory.material_stone_count_level_collected)

func set_material_label_values(amount_wood, amount_grass, amount_stone):
	set_material_label_value(enums.MaterialEnum.GRASS, amount_grass)
	set_material_label_value(enums.MaterialEnum.WOOD, amount_wood)
	set_material_label_value(enums.MaterialEnum.STONE, amount_stone)

func set_material_label_value(type, amount):
	match type:
		enums.MaterialEnum.GRASS: label_grass_value.text = str(amount)
		enums.MaterialEnum.WOOD: label_wood_value.text = str(amount)
		enums.MaterialEnum.STONE: label_stone_value.text = str(amount)
