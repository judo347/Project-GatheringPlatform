extends CollisionShape2D

onready var music_manager = get_parent().get_parent().get_node("MusicManager")

func _on_Killzone_ground_body_entered(body):
	
	# Is it the body of the player?
	if !(get_parent().get_parent().get_node("Player") == body):
		return
	
	# get_parent().get_parent().get_node("Player").queue_free()
	
	# Death penalty
	playerInventory.collect_materials(false)
	
	# Death sound
	music_manager.death()
	
	# queue scene change
	scene_changer.queue_change_levelToHomebase_death()