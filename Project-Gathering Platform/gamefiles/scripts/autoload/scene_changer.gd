extends Node

var transfer_levelToHomebase_death_active = false

func _process(delta):
	queue_change_levelToHomebase_death_check()

func queue_change_levelToHomebase_death():
	transfer_levelToHomebase_death_active = true

func queue_change_levelToHomebase_death_check():
	if transfer_levelToHomebase_death_active:
		# Wait for death sound to finish
		if script_getter.get_MusicManager().is_playing_death():
			return
		
		#Change scene to homebase
		get_tree().change_scene("gamefiles/scenes/World.tscn")
		transfer_levelToHomebase_death_active = false