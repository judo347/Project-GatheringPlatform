extends Area2D

var material_type = enums.MaterialEnum # Does not contain value, has to be set through function
var material_amount = global_variables.material_default_yield

func set_material_type(type):
	material_type = type

func set_material_yeild(amount):
	material_amount = amount

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			# Player is touching material
			playerInventory.add_material(material_type, material_amount)
			print("Added material to player inventory") # TODO replace with functionality
			queue_free()
	