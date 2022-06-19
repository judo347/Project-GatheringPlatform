extends Node

var transfer_levelToHomebase_death_active = false

var trans_instanced

func _process(delta):
	queue_change_levelToHomebase_death_check()

func queue_change_levelToHomebase_death():
	transfer_levelToHomebase_death_active = true
	
	#Add transistion
	trans_instanced = resource_lib.transistions.instance()
	var player_pos = get_tree().get_current_scene().get_node("Player").get_position()
	#trans_instanced.global_translate(player_pos)
	trans_instanced.get_node("Death/AniPlay").play()
	#get_tree().root.add_child(trans_instanced)
	#get_tree().get_current_scene().get_node("Player/Camera2D").add_child(trans_instanced)

func queue_change_levelToHomebase_death_check():
	if transfer_levelToHomebase_death_active:
		# Wait for death sound to finish
		if script_getter.get_MusicManager().is_playing_death():
			return
		
		#Change scene to homebase
		get_tree().root.remove_child(trans_instanced)
		get_tree().change_scene("gamefiles/scenes/World.tscn")
		transfer_levelToHomebase_death_active = false
