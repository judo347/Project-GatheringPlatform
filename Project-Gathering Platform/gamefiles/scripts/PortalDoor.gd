extends Node2D 

onready var animSprite = $AnimatedSprite

var playerAtDoor = false
var doorOpen = false

func _process(delta):
	
	# Check if the door is open
	if(playerAtDoor):
		if(animSprite.get_animation() == "1-Opening"):
			if(animSprite.get_frame() == 2):
				doorOpen = true
			else:
				doorOpen = false
		else:
			doorOpen = false
	else:
		doorOpen = false

func activatePortal():
	if(playerAtDoor && doorOpen):
		# TODO teleport/change level
		get_tree().change_scene("gamefiles/scenes/GeneratedLevelTemplate.tscn")

func _on_Area2D_body_entered(body):
	
	# TODO Check if the body is the player, else pass
	if !(get_parent().get_node("Player") == body):
		return
	
	playerAtDoor = true
	animSprite.play("1-Opening")

func _on_Area2D_body_exited(body):
	
	# TODO Check if the body is the player, else pass
	if !(get_parent().get_node("Player") == body):
		return
	
	playerAtDoor = false
	animSprite.play("3-Closing")
