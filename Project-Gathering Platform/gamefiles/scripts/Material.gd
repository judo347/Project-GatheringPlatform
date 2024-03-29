extends Area2D

onready var music_manager = get_parent().get_parent().get_node("MusicManager")

var material_type = enums.MaterialEnum # Does not contain value, has to be set through function
var material_amount = global_variables.material_default_yield

func set_material_type(type):
	material_type = type
	# Change texture to match type
	match type:
		enums.MaterialEnum.GRASS: get_node("Sprite").texture = global_variables.material_one_grass_texture
		enums.MaterialEnum.STONE: get_node("Sprite").texture = global_variables.material_two_stone_texture
		enums.MaterialEnum.WOOD: get_node("Sprite").texture = global_variables.material_three_wood_texture

func set_material_yeild(amount):
	material_amount = amount

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			# Player is touching material
			playerInventory.add_collected_material(material_type, material_amount)
			get_parent().get_parent().get_node("Player/Camera2D/PermanentUI").update_labels()
			print("Added material to player inventory") # TODO replace with functionality
			music_manager.pickup()
			queue_free()
	
