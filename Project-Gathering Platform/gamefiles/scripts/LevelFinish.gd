extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			playerInventory.collect_materials(true)
			get_tree().change_scene("gamefiles/scenes/World.tscn")
			queue_free()