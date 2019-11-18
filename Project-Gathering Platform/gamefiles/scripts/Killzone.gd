extends CollisionShape2D

func _on_Killzone_ground_body_entered(body):
	
	# Is it the body of the player?
	if !(get_parent().get_parent().get_node("Player") == body):
		return
	
	# get_parent().get_parent().get_node("Player").queue_free()
	
	# Death penalty
	playerInventory.trigger_deathPenalty()
	
	get_tree().change_scene("gamefiles/scenes/World.tscn")